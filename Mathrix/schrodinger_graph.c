/* =============================================================================
 * File:         schrodinger_graph.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-20
 * Description:  Interactive Schrodinger-equation plot — see schrodinger_graph.h
 *               for what the mouse and buttons do.
 *
 *               Shape of the file:
 *                 SchrodView         everything one window knows
 *                 sg_layout()        where things go for a given window size
 *                                    (shared by drawing and mouse hit-tests,
 *                                    so a click lands where the eye looks)
 *                 sg_draw()          the whole picture, one Cairo pass
 *                 event handlers     hover, click, buttons, animation tick
 *                 graph_window_open_schrodinger()   fetch from parse, build
 *
 *               Re-uses from graph.c: graph_xy_panel() for the panel, grid,
 *               ticks and the potential curve; nice_range(); show_text_at();
 *               graph_fetch_vector() / graph_fetch_scalar().  Colours all
 *               come from colors.h.
 *
 *               Physics used for the animation (hbar = 1 in the plot's own
 *               energy units — only the printed beat period is converted):
 *                 one state      Re[psi e^(-iEt)]  = psi cos(Et)
 *                 two states     psi = (a e^(-iEa t) + b e^(-iEb t)) / sqrt 2
 *                                |psi|^2 = (a^2 + b^2)/2 + a b cos((Eb-Ea) t)
 *               so the sloshing repeats every 2 pi / (Eb - Ea).
 * ============================================================================= */

#include "schrodinger_graph.h"
#include "graph.h"
#include "app_state.h"
#include "colors.h"

#include <gtk/gtk.h>
#include <cairo.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* ═══════════════════════════════════════════════════════════
   LAYOUT AND LOOK
   ═══════════════════════════════════════════════════════════ */

#define SG_PAD_TOP        104.0   /* title, two banner lines, hint line          */
#define SG_PAD_LEFT        72.0   /* y tick labels + rotated axis label          */
#define SG_LABEL_COL      150.0   /* level labels down the right-hand side       */
#define SG_PAD_RIGHT       10.0
#define SG_AXIS_ROOM       46.0   /* x tick labels + axis label under the panel  */
#define SG_DET_H           74.0   /* detector strip                              */
#define SG_PAD_BOTTOM      12.0
#define SG_LABEL_GAP       15.0   /* closest two level labels may sit, pixels    */
#define SG_PICK_SLOP        7.0   /* extra pixels of forgiveness for a click     */

#define SG_WAVE_FRAC        0.42  /* psi height as a fraction of level spacing   */
#define SG_PROB_FRAC        0.85  /* psi^2 height, same idea                     */
#define SG_BEAT_SECONDS     4.0   /* one animation cycle takes this long on screen */
#define SG_HIST_BINS        64    /* detector histogram bars                     */
#define SG_MAX_STATES       50    /* matches SCH_STATES_MAX in parse             */
#define SG_MAX_HITS         50000 /* detector memory; past this, it's a census   */
#define SG_DOTS_DRAWN       4000  /* newest hits drawn as dots, for frame rate   */
#define SG_HBAR_EVS         6.582119569e-16   /* hbar in eV seconds              */

/* one colour per state, cycling — all from the Catppuccin palette */
static const double sg_palette[][3] =
{
    { MX_BLUE_R,     MX_BLUE_G,     MX_BLUE_B     },
    { MX_GREEN_R,    MX_GREEN_G,    MX_GREEN_B    },
    { MX_PEACH_R,    MX_PEACH_G,    MX_PEACH_B    },
    { MX_MAUVE_R,    MX_MAUVE_G,    MX_MAUVE_B    },
    { MX_YELLOW_R,   MX_YELLOW_G,   MX_YELLOW_B   },
    { MX_TEAL_R,     MX_TEAL_G,     MX_TEAL_B     },
    { MX_RED_R,      MX_RED_G,      MX_RED_B      },
    { MX_SKY_R,      MX_SKY_G,      MX_SKY_B      },
};
#define SG_N_COLOURS  ((int)(sizeof(sg_palette) / sizeof(sg_palette[0])))

/* ═══════════════════════════════════════════════════════════
   WINDOW STATE
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      SchrodView
 * Description: Everything one Schrodinger window owns.  The
 *              results are fetched once; after that the window
 *              never talks to parse again, so new runs in the
 *              main window cannot pull the rug out from under it.
 **************************************************************/
typedef struct
{
    /* ── results from parse ── */
    int        N;            /* grid points                              */
    int        n;            /* states                                   */
    double    *x;            /* [N]   positions                          */
    double    *V;            /* [N]   potential                          */
    double    *E;            /* [n]   energies, lowest first             */
    double    *psi;          /* [N*n] row-major: psi[i*n + k]            */
    double     err;          /* vs exact, -1 = no exact answer           */
    int        nbound;       /* states the potential holds, -1 = n/a     */
    int        ev;           /* 1 = nm and eV                            */

    /* ── worked out once ── */
    double     maxPsi;       /* largest |psi| over all states            */
    double     maxProb;      /* largest psi^2                            */
    double     spacing;      /* typical gap between levels               */
    double     vEdge;        /* lower of V at the two box walls          */

    /* ── what the user is doing ── */
    int        hover;        /* state under the mouse, -1 = none         */
    int        sel[2];       /* picked states, oldest first              */
    int        nsel;         /* 0, 1 or 2                                */
    gboolean   showProb;     /* psi^2 instead of psi                     */
    gboolean   playing;      /* animation running                        */
    double     t;            /* animation time, plot units (hbar = 1)    */
    gint64     lastFrame;    /* frame clock time of the previous tick    */
    guint      tickId;       /* 0 when not animating                     */
    GArray    *hits;         /* detector hits: x positions (double)      */

    /* ── layout from the most recent draw (for hit tests) ── */
    double     px, py, pw, ph;
    double     detY;
    double     labX;
    double     labelY[SG_MAX_STATES];
    GraphAxis  ax, ay;

    /* ── widgets ── */
    GtkWidget *da;
    GtkWidget *playBtn;
    GtkWidget *probBtn;
} SchrodView;

/* data -> pixels for the main panel */
#define SG_PX(v, xv) ((v)->px + ((xv) - (v)->ax.lo) / ((v)->ax.hi - (v)->ax.lo) * (v)->pw)
#define SG_PY(v, ev) ((v)->py + (v)->ph - ((ev) - (v)->ay.lo) / ((v)->ay.hi - (v)->ay.lo) * (v)->ph)

/* ═══════════════════════════════════════════════════════════
   SMALL HELPERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_psi
 * Input:       v (const SchrodView*) — the window
 *              i (int) — grid index;  k (int) — state
 * Output:      double — psi_k at x_i
 **************************************************************/
static double sg_psi(const SchrodView *v, int i, int k)
{
    return v->psi[(size_t)i * v->n + k];
}

/*************************************************************
 * Function:    sg_is_selected
 * Input:       v (const SchrodView*), k (int) — state
 * Output:      int — 1 if k is one of the picked states
 **************************************************************/
static int sg_is_selected(const SchrodView *v, int k)
{
    int s;
    for (s = 0; s < v->nsel; s++)
        if (v->sel[s] == k) return 1;
    return 0;
}

/*************************************************************
 * Function:    sg_set_colour
 * Input:       cr (cairo_t*), k (int) — state, alpha (double)
 * Output:      void
 * Description: Picks state k's colour from the palette.
 **************************************************************/
static void sg_set_colour(cairo_t *cr, int k, double alpha)
{
    const double *c = sg_palette[k % SG_N_COLOURS];
    cairo_set_source_rgba(cr, c[0], c[1], c[2], alpha);
}

/*************************************************************
 * Function:    sg_nodes
 * Input:       v (const SchrodView*), k (int) — state
 * Output:      int — number of times psi_k crosses zero inside
 *              the box.  State k should have exactly k; anyone who
 *              sees otherwise has found a bug or a new physics.
 * Description: Tiny values near the walls are ignored, so rounding
 *              noise in the tails is not counted as a crossing.
 **************************************************************/
static int sg_nodes(const SchrodView *v, int k)
{
    double big = 0.0, thresh, val;
    int    i, nodes = 0, lastSign = 0, sign;

    for (i = 0; i < v->N; i++)
        if (fabs(sg_psi(v, i, k)) > big) big = fabs(sg_psi(v, i, k));
    thresh = 1e-3 * big;

    for (i = 0; i < v->N; i++)
    {
        val = sg_psi(v, i, k);
        if (fabs(val) < thresh) continue;
        sign = (val > 0) ? 1 : -1;
        if (lastSign != 0 && sign != lastSign) nodes++;
        lastSign = sign;
    }
    return nodes;
}

/*************************************************************
 * Function:    sg_density
 * Input:       v (const SchrodView*), i (int) — grid index
 * Output:      double — probability density at x_i right now
 * Description: Two picked states: the beating mix.  One picked:
 *              that state.  None: the ground state, the one nature
 *              would pick.
 **************************************************************/
static double sg_density(const SchrodView *v, int i)
{
    double a, b;

    if (v->nsel == 2)
    {
        a = sg_psi(v, i, v->sel[0]);
        b = sg_psi(v, i, v->sel[1]);
        return 0.5 * (a * a + b * b) +
               a * b * cos((v->E[v->sel[1]] - v->E[v->sel[0]]) * v->t);
    }
    a = sg_psi(v, i, v->nsel == 1 ? v->sel[0] : 0);
    return a * a;
}

/*************************************************************
 * Function:    sg_mix_wave
 * Input:       v (const SchrodView*), i (int) — grid index
 * Output:      double — real part of the two-state mix at x_i
 **************************************************************/
static double sg_mix_wave(const SchrodView *v, int i)
{
    int ka = v->sel[0], kb = v->sel[1];
    return (sg_psi(v, i, ka) * cos(v->E[ka] * v->t) +
            sg_psi(v, i, kb) * cos(v->E[kb] * v->t)) / M_SQRT2;
}

/*************************************************************
 * Function:    sg_mean_x
 * Input:       v (const SchrodView*)
 * Output:      double — where the particle is on average, right now
 * Description: The integral of x |psi|^2 dx.  This is the dot that
 *              swings back and forth when two states interfere.
 **************************************************************/
static double sg_mean_x(const SchrodView *v)
{
    double num = 0.0, den = 0.0, d;
    int    i;

    for (i = 0; i < v->N; i++)
    {
        d    = sg_density(v, i);
        num += v->x[i] * d;
        den += d;
    }
    return (den > 0.0) ? num / den : 0.0;
}

/*************************************************************
 * Function:    sg_period
 * Input:       v (const SchrodView*)
 * Output:      double — one cycle of the animation, plot time units
 * Description: Two states: the beat, 2 pi / |Eb - Ea|.  One state:
 *              its phase turn, 2 pi / |E| — unless E is so near
 *              zero that the turn would take forever, in which case
 *              a level spacing stands in so the picture still moves.
 **************************************************************/
static double sg_period(const SchrodView *v)
{
    double dE;

    if (v->nsel == 2)
        dE = fabs(v->E[v->sel[1]] - v->E[v->sel[0]]);
    else if (v->nsel == 1)
        dE = fabs(v->E[v->sel[0]]);
    else
        return 1.0;

    if (dE < 1e-3 * v->spacing) dE = v->spacing;
    return 2.0 * M_PI / dE;
}

/*************************************************************
 * Function:    sg_format_period
 * Input:       v (const SchrodView*), out (char*), outLen (size_t)
 * Output:      void — e.g. "1.38 fs" or "2.09 time units"
 * Description: In eV units the period is a real time, since
 *              t = 2 pi hbar / dE; femtoseconds are the natural size
 *              for electrons in a nanometre box.
 **************************************************************/
static void sg_format_period(const SchrodView *v, char *out, size_t outLen)
{
    double T = sg_period(v);

    if (!v->ev)
    {
        snprintf(out, outLen, "%.3g time units", T);
        return;
    }
    T *= SG_HBAR_EVS;                       /* now in seconds */
    if      (T < 1e-12) snprintf(out, outLen, "%.3g fs", T * 1e15);
    else if (T < 1e-9)  snprintf(out, outLen, "%.3g ps", T * 1e12);
    else                snprintf(out, outLen, "%.3g ns", T * 1e9);
}

/* ═══════════════════════════════════════════════════════════
   LAYOUT
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_layout
 * Input:       v (SchrodView*), w, h (double) — drawing area size
 * Output:      void — fills the layout fields of v
 * Description: Panel position, axis ranges, detector strip and
 *              the level labels' heights.  Labels start level with
 *              their energy and are pushed apart (bottom up) so
 *              near-equal levels stay readable and clickable.
 **************************************************************/
static void sg_layout(SchrodView *v, double w, double h)
{
    double lo, hi, xLo, xHi, gridH, minY;
    int    i, k;

    v->px   = SG_PAD_LEFT;
    v->py   = SG_PAD_TOP;
    v->pw   = w - SG_PAD_LEFT - SG_LABEL_COL - SG_PAD_RIGHT;
    v->ph   = h - SG_PAD_TOP - SG_AXIS_ROOM - SG_DET_H - SG_PAD_BOTTOM;
    v->detY = v->py + v->ph + SG_AXIS_ROOM;
    v->labX = v->px + v->pw + 14.0;

    /* ── x axis: the box itself, wall to wall ── */
    gridH = (v->N > 1) ? v->x[1] - v->x[0] : 1.0;
    xLo   = v->x[0] - gridH;
    xHi   = v->x[v->N - 1] + gridH;
    nice_range(xLo, xHi, &v->ax.lo, &v->ax.hi, &v->ax.step);
    v->ax.lo = xLo;                          /* exact walls, nice ticks */
    v->ax.hi = xHi;

    /* ── energy axis: from the bottom of the well (or the ground
          state, whichever is lower) to a little above the top level ── */
    lo = v->E[0];
    for (i = 0; i < v->N; i++) if (v->V[i] < lo) lo = v->V[i];
    hi  = v->E[v->n - 1] + 0.8 * v->spacing;
    lo -= 0.35 * v->spacing;
    nice_range(lo, hi, &v->ay.lo, &v->ay.hi, &v->ay.step);

    /* ── labels: ideal height first, then shove apart, bottom up ── */
    minY = v->py + v->ph + 6.0;
    for (k = 0; k < v->n; k++)
    {
        double want = SG_PY(v, v->E[k]) + 4.0;
        if (want > minY) want = minY;
        if (k > 0 && want > v->labelY[k - 1] - SG_LABEL_GAP)
            want = v->labelY[k - 1] - SG_LABEL_GAP;
        v->labelY[k] = want;
    }
}

/*************************************************************
 * Function:    sg_pick
 * Input:       v (const SchrodView*), mx, my (double) — mouse
 * Output:      int — state under the mouse, or -1
 * Description: Over the label column, the label you are on.
 *              Over the panel, the level nearest the mouse,
 *              provided it is within about half a level gap.
 **************************************************************/
static int sg_pick(const SchrodView *v, double mx, double my)
{
    int    k, best = -1;
    double d, bestD = 1e300, reach;

    /* ── label column ── */
    if (mx >= v->labX - 8.0 && mx <= v->labX + SG_LABEL_COL)
    {
        for (k = 0; k < v->n; k++)
        {
            d = fabs(v->labelY[k] - 4.0 - my);
            if (d < bestD) { bestD = d; best = k; }
        }
        return (bestD <= SG_LABEL_GAP * 0.6) ? best : -1;
    }

    /* ── the panel ── */
    if (mx < v->px || mx > v->px + v->pw || my < v->py || my > v->py + v->ph)
        return -1;
    for (k = 0; k < v->n; k++)
    {
        d = fabs(SG_PY(v, v->E[k]) - my);
        if (d < bestD) { bestD = d; best = k; }
    }
    reach = 0.5 * fabs(SG_PY(v, v->spacing) - SG_PY(v, 0.0)) + SG_PICK_SLOP;
    return (bestD <= reach) ? best : -1;
}

/* ═══════════════════════════════════════════════════════════
   DRAWING
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_draw_curve
 * Input:       cr (cairo_t*), v (const SchrodView*),
 *              base (double) — energy the curve floats at
 *              vals (const double*) — N values, already scaled to
 *                                     energy units
 *              fill (int) — 1 = shade down to the baseline
 *              r, g, b, alpha (double) — curve colour
 *              lineW (double) — line width, pixels
 * Output:      void
 * Description: Draws base + vals[i] across the box.  Thinned to
 *              about one point per pixel; Cairo gains nothing from
 *              five thousand points on a four-hundred-pixel panel.
 **************************************************************/
static void sg_draw_curve(cairo_t *cr, const SchrodView *v, double base,
                          const double *vals, int fill, double r, double g,
                          double b, double alpha, double lineW)
{
    int i, stride = (int)(v->N / (v->pw > 1 ? v->pw : 1));
    if (stride < 1) stride = 1;

    cairo_new_path(cr);
    cairo_move_to(cr, SG_PX(v, v->x[0]), SG_PY(v, base + vals[0]));
    for (i = stride; i < v->N; i += stride)
        cairo_line_to(cr, SG_PX(v, v->x[i]), SG_PY(v, base + vals[i]));
    cairo_line_to(cr, SG_PX(v, v->x[v->N - 1]), SG_PY(v, base + vals[v->N - 1]));

    if (fill)
    {
        /* close down to the baseline and shade, keeping the outline */
        cairo_path_t *outline = cairo_copy_path(cr);
        cairo_line_to(cr, SG_PX(v, v->x[v->N - 1]), SG_PY(v, base));
        cairo_line_to(cr, SG_PX(v, v->x[0]),        SG_PY(v, base));
        cairo_close_path(cr);
        cairo_set_source_rgba(cr, r, g, b, alpha * 0.28);
        cairo_fill(cr);
        cairo_append_path(cr, outline);
        cairo_path_destroy(outline);
    }
    cairo_set_source_rgba(cr, r, g, b, alpha);
    cairo_set_line_width(cr, lineW);
    cairo_set_line_join(cr, CAIRO_LINE_JOIN_ROUND);
    cairo_stroke(cr);
}

/*************************************************************
 * Function:    sg_draw_banner
 * Input:       cr (cairo_t*), v (const SchrodView*), w (double)
 * Output:      void
 * Description: Title, what was solved, should you believe it, and
 *              a hint line that changes with what is picked.
 **************************************************************/
static void sg_draw_banner(cairo_t *cr, const SchrodView *v, double w)
{
    char txt[256];
    char per[48];
    int  k;

    /* ── title ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TITLE_R, MX_GRAPH_TITLE_G, MX_GRAPH_TITLE_B);
    show_text_at(cr, w / 2.0, 22.0, "Schrödinger Equation — Energy Levels", 0.5);

    /* ── line 1: what was solved ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    snprintf(txt, sizeof(txt),
             "%d states   •   %d grid points   •   ground state energy %.6g%s",
             v->n, v->N, v->E[0], v->ev ? " eV" : "");
    show_text_at(cr, w / 2.0, 42.0, txt, 0.5);

    /* ── line 2: should you believe it? ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    if (v->err >= 0.0 && v->err < 0.01)
    {
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        snprintf(txt, sizeof(txt),
                 "Energies match the exact textbook answer to within %.2g%%",
                 v->err * 100.0);
    }
    else if (v->err >= 0.0)
    {
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "Energies are off from the exact answer by up to %.2g%% — "
                 "use more grid points", v->err * 100.0);
    }
    else if (v->nbound >= 0 && v->nbound < v->n)
    {
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "The potential holds only %d of these %d states — the ones "
                 "marked (box) are held up by the box walls", v->nbound, v->n);
    }
    else
    {
        cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
        snprintf(txt, sizeof(txt),
                 "No exact formula to compare against for this potential");
    }
    show_text_at(cr, w / 2.0, 60.0, txt, 0.5);

    /* ── line 3: what to do next, depending on what is picked ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    if (v->nsel == 0)
    {
        snprintf(txt, sizeof(txt),
                 "Click an energy level (or its label on the right) to pick a state.  "
                 "Pick two to watch them interfere.");
    }
    else if (v->nsel == 1)
    {
        k = v->sel[0];
        snprintf(txt, sizeof(txt),
                 "State %d: energy %.6g, %d node%s.  On its own a state only spins "
                 "in place — pick a second state to make the particle move.",
                 k, v->E[k], sg_nodes(v, k), sg_nodes(v, k) == 1 ? "" : "s");
    }
    else
    {
        sg_format_period(v, per, sizeof(per));
        snprintf(txt, sizeof(txt),
                 "States %d + %d: the particle sloshes back and forth once every %s.  "
                 "Click either one again to drop it.",
                 v->sel[0], v->sel[1], per);
    }
    show_text_at(cr, w / 2.0, 82.0, txt, 0.5);
}

/*************************************************************
 * Function:    sg_draw_states
 * Input:       cr (cairo_t*), v (const SchrodView*)
 * Output:      void
 * Description: Every state at its energy — dashed level line, then
 *              psi (or psi^2) floating on it — and, when two are
 *              picked, their live mix in white with a marker at the
 *              particle's average position.
 **************************************************************/
static void sg_draw_states(cairo_t *cr, const SchrodView *v)
{
    const double dash[] = { 4.0, 4.0 };
    double      *vals   = g_new(double, v->N);
    double       waveScale = SG_WAVE_FRAC * v->spacing / (v->maxPsi  > 0 ? v->maxPsi  : 1);
    double       probScale = SG_PROB_FRAC * v->spacing / (v->maxProb > 0 ? v->maxProb : 1);
    double       alpha, lineW, turn, base, mx;
    const double *c;
    int          i, k;

    for (k = 0; k < v->n; k++)
    {
        /* picked states bright, the rest faded back once something is
           picked; the one under the mouse always comes forward */
        if (v->nsel == 0)             alpha = 0.95;
        else if (sg_is_selected(v, k)) alpha = (v->nsel == 2) ? 0.55 : 1.0;
        else                           alpha = 0.16;
        lineW = 1.8;
        if (k == v->hover) { if (alpha < 0.85) alpha = 0.85; lineW = 3.0; }

        /* ── level line ── */
        cairo_save(cr);
        sg_set_colour(cr, k, alpha * 0.55);
        cairo_set_line_width(cr, 1.0);
        cairo_set_dash(cr, dash, 2, 0);
        cairo_move_to(cr, v->px,         SG_PY(v, v->E[k]));
        cairo_line_to(cr, v->px + v->pw, SG_PY(v, v->E[k]));
        cairo_stroke(cr);
        cairo_restore(cr);

        /* ── the state itself; a lone picked state turns with its
              phase, so psi visibly breathes while psi^2 sits still ── */
        turn = (v->nsel == 1 && v->sel[0] == k) ? cos(v->E[k] * v->t) : 1.0;
        for (i = 0; i < v->N; i++)
            vals[i] = v->showProb ? probScale * sg_psi(v, i, k) * sg_psi(v, i, k)
                                  : waveScale * sg_psi(v, i, k) * turn;

        c = sg_palette[k % SG_N_COLOURS];
        sg_draw_curve(cr, v, v->E[k], vals, v->showProb, c[0], c[1], c[2],
                      alpha, lineW);
    }

    /* ── two picked: the interfering mix, halfway between them ── */
    if (v->nsel == 2)
    {
        base = 0.5 * (v->E[v->sel[0]] + v->E[v->sel[1]]);
        for (i = 0; i < v->N; i++)
            vals[i] = v->showProb ? probScale * sg_density(v, i)
                                  : waveScale * sg_mix_wave(v, i);
        sg_draw_curve(cr, v, base, vals, 1, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B,
                      1.0, 2.6);
    }

    /* ── where the particle is, on average: a glowing bead on the
          baseline.  With two states it swings; with one it sits. ── */
    if (v->nsel > 0)
    {
        base = (v->nsel == 2) ? 0.5 * (v->E[v->sel[0]] + v->E[v->sel[1]])
                              : v->E[v->sel[0]];
        mx   = SG_PX(v, sg_mean_x(v));

        cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.25);
        cairo_new_path(cr);
        cairo_arc(cr, mx, SG_PY(v, base), 9.0, 0, 2 * M_PI);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_new_path(cr);
        cairo_arc(cr, mx, SG_PY(v, base), 4.0, 0, 2 * M_PI);
        cairo_fill(cr);
    }

    g_free(vals);
}

/*************************************************************
 * Function:    sg_draw_labels
 * Input:       cr (cairo_t*), v (const SchrodView*)
 * Output:      void
 * Description: One label per level down the right-hand side, with
 *              a short leader back to its level line.  Picked ones
 *              get a box; states the potential cannot hold by
 *              itself are tagged "(box)".
 **************************************************************/
static void sg_draw_labels(cairo_t *cr, const SchrodView *v)
{
    char   txt[64];
    double ly, ey, alpha;
    int    k, boxOnly;

    cairo_set_font_size(cr, 10.5);
    for (k = 0; k < v->n; k++)
    {
        ly      = v->labelY[k];
        ey      = SG_PY(v, v->E[k]);
        boxOnly = (v->nbound >= 0 && v->E[k] >= v->vEdge);
        alpha   = (v->nsel == 0 || sg_is_selected(v, k) || k == v->hover) ? 1.0 : 0.45;

        /* ── leader from the panel edge to the label ── */
        sg_set_colour(cr, k, alpha * 0.6);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, v->px + v->pw,       ey);
        cairo_line_to(cr, v->labX - 4.0,       ly - 4.0);
        cairo_stroke(cr);

        /* ── a box behind picked labels ── */
        if (sg_is_selected(v, k))
        {
            sg_set_colour(cr, k, 0.22);
            cairo_rectangle(cr, v->labX - 3.0, ly - 12.0, SG_LABEL_COL - 16.0, 15.0);
            cairo_fill(cr);
        }

        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               (k == v->hover || sg_is_selected(v, k))
                                   ? CAIRO_FONT_WEIGHT_BOLD : CAIRO_FONT_WEIGHT_NORMAL);
        snprintf(txt, sizeof(txt), "E%d = %.5g%s", k, v->E[k], boxOnly ? "  (box)" : "");
        sg_set_colour(cr, k, alpha);
        show_text_at(cr, v->labX, ly, txt, 0.0);
    }
}

/*************************************************************
 * Function:    sg_draw_detector
 * Input:       cr (cairo_t*), v (const SchrodView*)
 * Output:      void
 * Description: The strip under the plot where measured particles
 *              land.  Each hit is a dot (scattered up and down only
 *              so they don't stack into one line), the histogram
 *              of hits grows behind them, and a dashed white line
 *              shows the shape quantum mechanics predicts right now.
 *              For a sloshing mix that line moves; the hits from one
 *              press of Measure match it, hits from a long run of
 *              presses smear across the whole slosh.
 **************************************************************/
static void sg_draw_detector(cairo_t *cr, const SchrodView *v)
{
    const double dash[] = { 5.0, 3.0 };
    double  dx = v->px, dy = v->detY, dw = v->pw, dh = SG_DET_H;
    double  bins[SG_HIST_BINS] = { 0 };
    double  theory[SG_HIST_BINS] = { 0 };
    double  binW = (v->ax.hi - v->ax.lo) / SG_HIST_BINS;
    double  peak = 0.0, tSum = 0.0, hx, frac;
    char    txt[96];
    int     nHits = v->hits ? (int)v->hits->len : 0;
    int     i, b, first;

    /* ── strip background and frame ── */
    cairo_set_source_rgb(cr, MX_GRAPH_PANEL_R, MX_GRAPH_PANEL_G, MX_GRAPH_PANEL_B);
    cairo_rectangle(cr, dx, dy, dw, dh);
    cairo_fill(cr);

    /* ── what theory expects at this moment, binned like the hits ── */
    for (i = 0; i < v->N; i++)
    {
        b = (int)((v->x[i] - v->ax.lo) / binW);
        if (b < 0) b = 0;
        if (b >= SG_HIST_BINS) b = SG_HIST_BINS - 1;
        theory[b] += sg_density(v, i);
        tSum      += sg_density(v, i);
    }

    if (nHits == 0)
    {
        /* nothing measured yet — say how */
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC, CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_font_size(cr, 11.0);
        cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
        show_text_at(cr, dx + dw / 2.0, dy + dh / 2.0 + 4.0,
                     "Detector — press Measure to fire particles at it", 0.5);
    }
    else
    {
        /* ── histogram of the hits ── */
        for (i = 0; i < nHits; i++)
        {
            b = (int)((g_array_index(v->hits, double, i) - v->ax.lo) / binW);
            if (b < 0) b = 0;
            if (b >= SG_HIST_BINS) b = SG_HIST_BINS - 1;
            bins[b] += 1.0;
        }
        for (b = 0; b < SG_HIST_BINS; b++)
        {
            theory[b] *= nHits / (tSum > 0 ? tSum : 1);   /* expected count per bin */
            if (bins[b]   > peak) peak = bins[b];
            if (theory[b] > peak) peak = theory[b];
        }
        if (peak < 1.0) peak = 1.0;

        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B, 0.35);
        for (b = 0; b < SG_HIST_BINS; b++)
        {
            double bh = bins[b] / peak * (dh - 8.0);
            cairo_rectangle(cr, dx + b * dw / SG_HIST_BINS, dy + dh - bh,
                            dw / SG_HIST_BINS - 1.0, bh);
        }
        cairo_fill(cr);

        /* ── the newest hits as dots.  The up-and-down scatter is a
              fixed function of the hit number, so dots stay put
              between frames instead of fizzing like a bad TV ── */
        first = (nHits > SG_DOTS_DRAWN) ? nHits - SG_DOTS_DRAWN : 0;
        cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.75);
        for (i = first; i < nHits; i++)
        {
            hx   = g_array_index(v->hits, double, i);
            frac = fabs(fmod(sin(i * 12.9898 + 0.5) * 43758.5453, 1.0));
            cairo_new_path(cr);
            cairo_arc(cr, SG_PX(v, hx), dy + 5.0 + frac * (dh - 10.0),
                      (i == nHits - 1) ? 3.5 : 1.5, 0, 2 * M_PI);
            cairo_fill(cr);
        }

        /* ── theory's prediction, dashed white ── */
        cairo_save(cr);
        cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
        cairo_set_line_width(cr, 1.5);
        cairo_set_dash(cr, dash, 2, 0);
        for (b = 0; b < SG_HIST_BINS; b++)
        {
            double cx = dx + (b + 0.5) * dw / SG_HIST_BINS;
            double cy = dy + dh - theory[b] / peak * (dh - 8.0);
            if (b == 0) cairo_move_to(cr, cx, cy); else cairo_line_to(cr, cx, cy);
        }
        cairo_stroke(cr);
        cairo_restore(cr);
    }

    /* ── frame and caption ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G, MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, dx, dy, dw, dh);
    cairo_stroke(cr);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    if (nHits > 0)
    {
        snprintf(txt, sizeof(txt), "%d particle%s detected", nHits, nHits == 1 ? "" : "s");
        show_text_at(cr, dx + dw + 14.0, dy + 14.0, txt, 0.0);
        cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
        show_text_at(cr, dx + dw + 14.0, dy + 30.0, "bars = hits", 0.0);
        show_text_at(cr, dx + dw + 14.0, dy + 44.0, "dashes = theory,", 0.0);
        show_text_at(cr, dx + dw + 14.0, dy + 58.0, "right now", 0.0);
    }
}

/*************************************************************
 * Function:    sg_draw
 * Input:       cr (cairo_t*), w, h (int) — area size, v (SchrodView*)
 * Output:      void
 * Description: The whole picture.  Also refreshes v's layout, which
 *              the mouse handlers then use to find what was clicked.
 **************************************************************/
static void sg_draw(cairo_t *cr, int w, int h, SchrodView *v)
{
    const char *xLabel = v->ev ? "Position x  (nm)" : "Position x";
    const char *yLabel = v->ev ? "Energy  (eV)"     : "Energy";
    int         i;

    cairo_set_source_rgb(cr, MX_GRAPH_BG_R, MX_GRAPH_BG_G, MX_GRAPH_BG_B);
    cairo_paint(cr);

    sg_layout(v, w, h);
    sg_draw_banner(cr, v, w);
    if (v->pw < 120 || v->ph < 120) return;   /* window dragged too small to be useful */

    /* ── panel, grid, ticks, axis labels and the potential curve,
          all from the shared panel helper ── */
    graph_xy_panel(cr, v->px, v->py, v->pw, v->ph, "",
                   xLabel, yLabel, v->x, v->V, v->N,
                   NULL, NULL, 0, NAN, v->ax, v->ay);

    cairo_save(cr);
    cairo_rectangle(cr, v->px, v->py, v->pw, v->ph);
    cairo_clip(cr);

    /* ── shade under the potential, so the well reads as a solid
          landscape the particle lives on top of ── */
    cairo_new_path(cr);
    cairo_move_to(cr, SG_PX(v, v->x[0]), v->py + v->ph);
    for (i = 0; i < v->N; i++)
    {
        double yv = v->V[i];
        if (yv > v->ay.hi + v->ay.step) yv = v->ay.hi + v->ay.step;   /* keep the path sane */
        cairo_line_to(cr, SG_PX(v, v->x[i]), SG_PY(v, yv));
    }
    cairo_line_to(cr, SG_PX(v, v->x[v->N - 1]), v->py + v->ph);
    cairo_close_path(cr);
    cairo_set_source_rgba(cr, MX_SURFACE2_R, MX_SURFACE2_G, MX_SURFACE2_B, 0.45);
    cairo_fill(cr);

    sg_draw_states(cr, v);
    cairo_restore(cr);

    sg_draw_labels(cr, v);
    sg_draw_detector(cr, v);
}

/* ═══════════════════════════════════════════════════════════
   MEASURING — fire particles at the detector
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_measure
 * Input:       v (SchrodView*), count (int) — particles to fire
 * Output:      void
 * Description: Each particle lands at a random position drawn from
 *              |psi|^2 right now — the Born rule, by inverse CDF.
 *              A mix is sampled at the current moment of its slosh,
 *              which is why the dots pile up where the white curve
 *              is when you press the button.
 **************************************************************/
static void sg_measure(SchrodView *v, int count)
{
    double *cdf = g_new(double, v->N);
    double  sum = 0.0, r;
    int     i, j, lo, hi;

    /* running total of the density = the cumulative distribution */
    for (i = 0; i < v->N; i++)
    {
        sum   += sg_density(v, i);
        cdf[i] = sum;
    }
    if (sum <= 0.0) { g_free(cdf); return; }

    for (j = 0; j < count && v->hits->len < SG_MAX_HITS; j++)
    {
        /* find where a uniform random number falls in the CDF */
        r  = g_random_double() * sum;
        lo = 0; hi = v->N - 1;
        while (lo < hi)
        {
            int mid = (lo + hi) / 2;
            if (cdf[mid] < r) lo = mid + 1; else hi = mid;
        }
        /* jitter inside the grid cell, so hits are not quantised to
           the grid (the particle is quantised enough already) */
        r = v->x[lo] + (g_random_double() - 0.5) * (v->N > 1 ? v->x[1] - v->x[0] : 0);
        g_array_append_val(v->hits, r);
    }
    g_free(cdf);
}

/* ═══════════════════════════════════════════════════════════
   ANIMATION
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_tick
 * Input:       widget (GtkWidget*), clock (GdkFrameClock*),
 *              data (gpointer) — SchrodView*
 * Output:      gboolean — G_SOURCE_CONTINUE
 * Description: Once per screen frame: move time on so one cycle
 *              takes SG_BEAT_SECONDS of wall clock, and redraw.
 **************************************************************/
static gboolean sg_tick(GtkWidget *widget, GdkFrameClock *clock, gpointer data)
{
    SchrodView *v   = (SchrodView *)data;
    gint64      now = gdk_frame_clock_get_frame_time(clock);
    double      dt  = (v->lastFrame > 0) ? (now - v->lastFrame) / 1e6 : 0.0;

    v->lastFrame = now;
    if (dt > 0.1) dt = 0.1;          /* a stalled frame shouldn't make it leap */
    v->t += dt * sg_period(v) / SG_BEAT_SECONDS;
    gtk_widget_queue_draw(widget);
    return G_SOURCE_CONTINUE;
}

/*************************************************************
 * Function:    sg_update_animation
 * Input:       v (SchrodView*)
 * Output:      void
 * Description: Runs the tick only when there is something to move —
 *              a picked state and Play on — so an idle window costs
 *              nothing.
 **************************************************************/
static void sg_update_animation(SchrodView *v)
{
    gboolean want = v->playing && v->nsel > 0;

    if (want && v->tickId == 0)
    {
        v->lastFrame = 0;
        v->tickId    = gtk_widget_add_tick_callback(v->da, sg_tick, v, NULL);
    }
    else if (!want && v->tickId != 0)
    {
        gtk_widget_remove_tick_callback(v->da, v->tickId);
        v->tickId = 0;
    }
}

/* ═══════════════════════════════════════════════════════════
   EVENT HANDLERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    sg_on_draw
 * Description: GtkDrawingArea draw function — hands over to sg_draw.
 **************************************************************/
static void sg_on_draw(GtkDrawingArea *da, cairo_t *cr, int w, int h, gpointer data)
{
    (void)da;
    sg_draw(cr, w, h, (SchrodView *)data);
}

/*************************************************************
 * Function:    sg_on_motion
 * Description: Mouse moved: light up the state underneath, and
 *              show a pointing hand so it looks clickable.
 **************************************************************/
static void sg_on_motion(GtkEventControllerMotion *ctl, double x, double y, gpointer data)
{
    SchrodView *v = (SchrodView *)data;
    int         k = sg_pick(v, x, y);

    (void)ctl;
    if (k == v->hover) return;
    v->hover = k;
    gtk_widget_set_cursor_from_name(v->da, k >= 0 ? "pointer" : NULL);
    gtk_widget_queue_draw(v->da);
}

/*************************************************************
 * Function:    sg_on_leave
 * Description: Mouse left the plot: nothing is hovered.
 **************************************************************/
static void sg_on_leave(GtkEventControllerMotion *ctl, gpointer data)
{
    SchrodView *v = (SchrodView *)data;

    (void)ctl;
    v->hover = -1;
    gtk_widget_queue_draw(v->da);
}

/*************************************************************
 * Function:    sg_on_click
 * Description: Click on a level: pick it, or drop it if already
 *              picked.  A third pick replaces the older of the two.
 *              The detector is cleared, because its hits belong to
 *              the state that was picked when they were measured.
 **************************************************************/
static void sg_on_click(GtkGestureClick *gesture, int nPress, double x, double y,
                        gpointer data)
{
    SchrodView *v = (SchrodView *)data;
    int         k = sg_pick(v, x, y);

    (void)gesture;
    (void)nPress;
    if (k < 0) return;

    if (sg_is_selected(v, k))
    {
        /* drop it, keeping the other one (if any) */
        if (v->nsel == 2 && v->sel[0] == k) v->sel[0] = v->sel[1];
        v->nsel--;
    }
    else if (v->nsel < 2)
        v->sel[v->nsel++] = k;
    else
    {
        v->sel[0] = v->sel[1];
        v->sel[1] = k;
    }

    v->t = 0.0;
    g_array_set_size(v->hits, 0);
    sg_update_animation(v);
    gtk_widget_queue_draw(v->da);
}

/*************************************************************
 * Function:    sg_on_prob_toggled
 * Description: psi^2 button: wavefunction or probability.
 **************************************************************/
static void sg_on_prob_toggled(GtkToggleButton *btn, gpointer data)
{
    SchrodView *v = (SchrodView *)data;

    v->showProb = gtk_toggle_button_get_active(btn);
    gtk_button_set_label(GTK_BUTTON(btn), v->showProb ? "ψ²  Probability" : "ψ  Wavefunction");
    gtk_widget_queue_draw(v->da);
}

/*************************************************************
 * Function:    sg_on_play_toggled
 * Description: Play / Pause the animation.
 **************************************************************/
static void sg_on_play_toggled(GtkToggleButton *btn, gpointer data)
{
    SchrodView *v = (SchrodView *)data;

    v->playing = gtk_toggle_button_get_active(btn);
    gtk_button_set_label(GTK_BUTTON(btn), v->playing ? "⏸  Pause" : "▶  Play");
    sg_update_animation(v);
}

/*************************************************************
 * Function:    sg_on_measure_one / sg_on_measure_many / sg_on_clear
 * Description: The detector buttons.
 **************************************************************/
static void sg_on_measure_one(GtkButton *btn, gpointer data)
{
    SchrodView *v = (SchrodView *)data;
    (void)btn;
    sg_measure(v, 1);
    gtk_widget_queue_draw(v->da);
}

static void sg_on_measure_many(GtkButton *btn, gpointer data)
{
    SchrodView *v = (SchrodView *)data;
    (void)btn;
    sg_measure(v, 100);
    gtk_widget_queue_draw(v->da);
}

static void sg_on_clear(GtkButton *btn, gpointer data)
{
    SchrodView *v = (SchrodView *)data;
    (void)btn;
    g_array_set_size(v->hits, 0);
    gtk_widget_queue_draw(v->da);
}

/*************************************************************
 * Function:    sg_view_free
 * Input:       v (SchrodView*) — NULL is fine
 * Output:      void
 **************************************************************/
static void sg_view_free(SchrodView *v)
{
    if (!v) return;
    g_free(v->x);
    g_free(v->V);
    g_free(v->E);
    g_free(v->psi);
    if (v->hits) g_array_unref(v->hits);
    g_free(v);
}

/*************************************************************
 * Function:    sg_on_destroy
 * Description: Window closed: stop the animation, free everything.
 **************************************************************/
static void sg_on_destroy(GtkWidget *w, gpointer data)
{
    SchrodView *v = (SchrodView *)data;

    (void)w;
    if (v->tickId) gtk_widget_remove_tick_callback(v->da, v->tickId);
    sg_view_free(v);
}

/*************************************************************
 * Function:    sg_toolbar_button
 * Input:       box (GtkWidget*), btn (GtkWidget*), css (const char*),
 *              tip (const char*)
 * Output:      GtkWidget* — btn, appended to box
 **************************************************************/
static GtkWidget *sg_toolbar_button(GtkWidget *box, GtkWidget *btn,
                                    const char *css, const char *tip)
{
    gtk_widget_add_css_class(btn, css);
    gtk_widget_set_tooltip_text(btn, tip);
    gtk_box_append(GTK_BOX(box), btn);
    return btn;
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_schrodinger
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_schrodinger(void)
{
    AppState   *st = app_state_get();
    SchrodView *v;
    GtkWidget  *window, *vbox, *toolbar, *title, *btn;
    GtkEventController *motion;
    GtkGesture *click;
    int         nV = 0, nPsi = 0, i, k;

    /* ── fetch everything from parse, once ── */
    v = g_new0(SchrodView, 1);
    v->E   = graph_fetch_vector("schrod_E",   &v->n);
    v->x   = graph_fetch_vector("schrod_x",   &v->N);
    v->V   = graph_fetch_vector("schrod_V",   &nV);
    v->psi = graph_fetch_vector("schrod_psi", &nPsi);

    if (!v->E || !v->x || !v->V || !v->psi || v->n < 1 || v->N < 2 ||
        nV != v->N || nPsi != v->N * v->n || v->n > SG_MAX_STATES)
    {
        app_status_set("No Schrödinger results yet — run the Schrödinger Equation first");
        sg_view_free(v);
        return;
    }
    v->err    = graph_fetch_scalar("schrod_err");
    v->nbound = (int)graph_fetch_scalar("schrod_nbound");
    v->ev     = graph_fetch_scalar("schrod_ev") > 0.5;

    /* ── things the drawing needs again and again ── */
    for (i = 0; i < v->N; i++)
        for (k = 0; k < v->n; k++)
        {
            double p = fabs(sg_psi(v, i, k));
            if (p     > v->maxPsi)  v->maxPsi  = p;
            if (p * p > v->maxProb) v->maxProb = p * p;
        }
    v->spacing = (v->n > 1) ? (v->E[v->n - 1] - v->E[0]) / (v->n - 1)
                            : 0.5 * (fabs(v->E[0]) > 0 ? fabs(v->E[0]) : 1.0);
    if (v->spacing <= 0.0) v->spacing = 1.0;
    v->vEdge   = (v->V[0] < v->V[v->N - 1]) ? v->V[0] : v->V[v->N - 1];
    v->hover   = -1;
    v->playing = TRUE;
    v->hits    = g_array_new(FALSE, FALSE, sizeof(double));

    /* ── window ── */
    window = gtk_window_new();
    gtk_window_set_title(GTK_WINDOW(window), "Schrödinger Equation");
    gtk_window_set_default_size(GTK_WINDOW(window), 1120, 780);
    gtk_window_set_transient_for(GTK_WINDOW(window), GTK_WINDOW(st->window));
    gtk_window_set_modal(GTK_WINDOW(window), FALSE);
    gtk_window_set_destroy_with_parent(GTK_WINDOW(window), FALSE);

    vbox    = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    toolbar = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    gtk_widget_add_css_class(toolbar, "graph-toolbar");
    gtk_widget_set_margin_start(toolbar, 12);
    gtk_widget_set_margin_end(toolbar, 8);
    gtk_widget_set_margin_top(toolbar, 6);
    gtk_widget_set_margin_bottom(toolbar, 6);

    title = gtk_label_new("Schrödinger Equation — Energy Levels");
    gtk_widget_set_hexpand(title, TRUE);
    gtk_label_set_xalign(GTK_LABEL(title), 0.0f);
    gtk_widget_add_css_class(title, "graph-title-lbl");
    gtk_box_append(GTK_BOX(toolbar), title);

    /* ── the toys ── */
    v->probBtn = sg_toolbar_button(toolbar, gtk_toggle_button_new_with_label("ψ  Wavefunction"),
                                   "mathrix-run-btn",
                                   "Switch between the wavefunction and the probability "
                                   "of finding the particle");
    g_signal_connect(v->probBtn, "toggled", G_CALLBACK(sg_on_prob_toggled), v);

    v->playBtn = sg_toolbar_button(toolbar, gtk_toggle_button_new_with_label("⏸  Pause"),
                                   "mathrix-run-btn", "Start or stop the animation");
    gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(v->playBtn), TRUE);
    g_signal_connect(v->playBtn, "toggled", G_CALLBACK(sg_on_play_toggled), v);

    btn = sg_toolbar_button(toolbar, gtk_button_new_with_label("🎯 Measure 1"),
                            "mathrix-plot-btn", "Fire one particle at the detector");
    g_signal_connect(btn, "clicked", G_CALLBACK(sg_on_measure_one), v);

    btn = sg_toolbar_button(toolbar, gtk_button_new_with_label("🎯 Measure 100"),
                            "mathrix-plot-btn", "Fire a hundred particles at the detector");
    g_signal_connect(btn, "clicked", G_CALLBACK(sg_on_measure_many), v);

    btn = sg_toolbar_button(toolbar, gtk_button_new_with_label("Clear detector"),
                            "mathrix-run-btn", "Wipe the detector clean");
    g_signal_connect(btn, "clicked", G_CALLBACK(sg_on_clear), v);

    btn = sg_toolbar_button(toolbar, gtk_button_new_with_label("✕ Close"),
                            "mathrix-run-btn", "Close this window");
    g_signal_connect_swapped(btn, "clicked", G_CALLBACK(gtk_window_destroy), window);

    gtk_box_append(GTK_BOX(vbox), toolbar);
    gtk_box_append(GTK_BOX(vbox), gtk_separator_new(GTK_ORIENTATION_HORIZONTAL));

    /* ── drawing area that listens ── */
    v->da = gtk_drawing_area_new();
    gtk_widget_set_hexpand(v->da, TRUE);
    gtk_widget_set_vexpand(v->da, TRUE);
    gtk_widget_set_size_request(v->da, 760, 560);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(v->da), sg_on_draw, v, NULL);

    motion = gtk_event_controller_motion_new();
    g_signal_connect(motion, "motion", G_CALLBACK(sg_on_motion), v);
    g_signal_connect(motion, "leave",  G_CALLBACK(sg_on_leave),  v);
    gtk_widget_add_controller(v->da, motion);

    click = gtk_gesture_click_new();
    gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click), GDK_BUTTON_PRIMARY);
    g_signal_connect(click, "pressed", G_CALLBACK(sg_on_click), v);
    gtk_widget_add_controller(v->da, GTK_EVENT_CONTROLLER(click));

    gtk_box_append(GTK_BOX(vbox), v->da);

    g_signal_connect(window, "destroy", G_CALLBACK(sg_on_destroy), v);
    gtk_window_set_child(GTK_WINDOW(window), vbox);
    gtk_window_present(GTK_WINDOW(window));

    app_status_set("Graph: Schrödinger Equation — click a level to pick a state");
}
