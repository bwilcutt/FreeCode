/* =============================================================================
 * File:        asteroid_graph.c
 * Author:      Bryan Wilcutt
 * Date Started: 2026-11-06
 * Description: Cairo drawing for the Asteroid Impact Screening plot.  See
 *              asteroid_graph.h for the layout and the GraphData packing.
 * ============================================================================= */

#include "asteroid_graph.h"
#include "graph_data.h"
#include "graph.h"
#include "app_state.h"
#include "pipe_mgr.h"
#include "colors.h"

#include <gtk/gtk.h>
#include <cairo.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* ── physical reference values (km) — match calc's asteroid.c ── */
#define AG_R_EARTH_KM   6371.0
#define AG_LD_KM        384400.0

/* ── layout ── */
#define AG_PAD_LEFT     84.0
#define AG_PAD_RIGHT    28.0
#define AG_PAD_TOP      78.0     /* room for the title and the verdict banner */
#define AG_PAD_BOTTOM   58.0

/* ═══════════════════════════════════════════════════════════
   SMALL HELPERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    jd_to_text
 * Input:       jd  (double) — Julian Date
 *              buf (char*)  — receives "YYYY-MM-DD HH:MM"
 *              len (size_t) — capacity of buf
 * Output:      void
 * Description: Gregorian calendar conversion (Meeus, ch. 7).  A twin of
 *              the one in calc's asteroid.c: Mathrix and parse are separate
 *              programs with no shared library, so the two copies must be
 *              kept in step by hand.  It has been stable since 1582.
 *************************************************************/
static void jd_to_text(double jd, char *buf, size_t len)
{
    double Z, F, A, alpha, B, C, D, E;
    double day;
    int    month, year, hour, minute;

    /* round to the minute first, so 23:59:45 rolls to the next day */
    jd = floor(jd * 1440.0 + 0.5) / 1440.0;

    jd += 0.5;
    Z = floor(jd);
    F = jd - Z;

    /* Gregorian correction */
    if (Z < 2299161.0)
        A = Z;
    else
    {
        alpha = floor((Z - 1867216.25) / 36524.25);
        A     = Z + 1.0 + alpha - floor(alpha / 4.0);
    }

    B = A + 1524.0;
    C = floor((B - 122.1) / 365.25);
    D = floor(365.25 * C);
    E = floor((B - D) / 30.6001);

    day   = B - D - floor(30.6001 * E) + F;
    month = (E < 14.0) ? (int)E - 1 : (int)E - 13;
    year  = (month > 2) ? (int)C - 4716 : (int)C - 4715;

    minute = (int)floor((day - floor(day)) * 1440.0 + 0.5);
    hour   = minute / 60;
    minute = minute % 60;

    snprintf(buf, len, "%04d-%02d-%02d %02d:%02d", year, month,
             (int)floor(day), hour, minute);
}

/*************************************************************
 * Function:    fmt_km
 * Input:       km  (double) — a distance in km
 *              buf (char*)  — receives the text
 *              len (size_t) — capacity of buf
 * Output:      void
 * Description: Human-friendly distance: "7,948 km" below a million,
 *              "21.5 million km" above.  Nobody reads 2.15e+07.
 *************************************************************/
static void fmt_km(double km, char *buf, size_t len)
{
    long v;

    if (km >= 1.0e6)
    {
        snprintf(buf, len, "%.1f million km", km / 1.0e6);
        return;
    }

    /* thousands separators, done by hand — printf's ' flag is locale-shy */
    v = (long)floor(km + 0.5);
    if (v >= 1000)
        snprintf(buf, len, "%ld,%03ld km", v / 1000, v % 1000);
    else
        snprintf(buf, len, "%ld km", v);
}

/*************************************************************
 * Function:    fmt_axis_km
 * Input:       km  (double) — a power of ten, in km
 *              buf (char*)  — receives the tick label
 *              len (size_t) — capacity of buf
 * Output:      void
 * Description: Short log-axis tick labels: 1k, 10k, 100k, 1M, 10M ...
 *************************************************************/
static void fmt_axis_km(double km, char *buf, size_t len)
{
    if      (km >= 1.0e9) snprintf(buf, len, "%gB", km / 1.0e9);
    else if (km >= 1.0e6) snprintf(buf, len, "%gM", km / 1.0e6);
    else if (km >= 1.0e3) snprintf(buf, len, "%gk", km / 1.0e3);
    else                  snprintf(buf, len, "%g",  km);
}

/*************************************************************
 * Function:    nice_step
 * Input:       range (double) — axis span
 *              ticks (int)    — roughly how many ticks are wanted
 * Output:      double — a 1/2/5 x 10^n tick spacing
 * Description: Picks a tick spacing a human would choose.
 *************************************************************/
static double nice_step(double range, int ticks)
{
    double raw  = range / ticks;
    double mag  = pow(10.0, floor(log10(raw)));
    double norm = raw / mag;

    if      (norm < 1.5) return 1.0 * mag;
    else if (norm < 3.5) return 2.0 * mag;
    else if (norm < 7.5) return 5.0 * mag;
    return 10.0 * mag;
}

/*************************************************************
 * Function:    ref_line
 * Input:       cr       — Cairo context
 *              x0, x1   — horizontal extent of the plot area
 *              y        — pixel row of the line
 *              r, g, b  — colour
 *              label    — text drawn at the right end, above the line
 * Output:      void
 * Description: Dashed horizontal reference line with a label.
 *************************************************************/
static void ref_line(cairo_t *cr, double x0, double x1, double y,
                     double r, double g, double b, const char *label)
{
    const double dash[] = { 6.0, 4.0 };

    cairo_save(cr);
    cairo_set_source_rgba(cr, r, g, b, 0.85);
    cairo_set_line_width(cr, 1.2);
    cairo_set_dash(cr, dash, 2, 0);
    cairo_move_to(cr, x0, y);
    cairo_line_to(cr, x1, y);
    cairo_stroke(cr);
    cairo_restore(cr);

    cairo_set_source_rgb(cr, r, g, b);
    cairo_set_font_size(cr, 9.5);
    show_text_at(cr, x1 - 4, y - 4, label, 1.0);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_asteroid_plot
   ═══════════════════════════════════════════════════════════ */

void draw_asteroid_plot(cairo_t *cr, int w, int h, const GraphData *gd)
{
    /* ── unpack $asteroid_info ── */
    double start    = gd->x_data[0];
    double span     = gd->x_data[1];
    double tca      = gd->x_data[2];
    double dmin     = gd->x_data[3];
    double vrel     = gd->x_data[4];
    double bcap     = gd->x_data[5];
    int    hit      = gd->x_data[6] > 0.5;
    double prob     = gd->x_data[7];
    double prob_sig = gd->x_data[8];
    int    clones   = (int)gd->x_data[9];

    /* the curve lives after the header */
    const double *tx = gd->x_data + AST_GRAPH_HDR;
    const double *dy = gd->y_data + AST_GRAPH_HDR;
    int           n  = gd->n - AST_GRAPH_HDR;

    double px, py, pw, ph;           /* plot area */
    double d_lo, d_hi;               /* y range, km */
    double ly_lo, ly_hi;             /* the same, log10 */
    double xs;                       /* x tick step, days */
    double v;
    double dot_x, dot_y;
    char   txt[160];
    char   s1[48], s2[48];
    int    i;

    /* map (days, km) to pixels — log scale on y */
#define AX(t)  (px + (t) / span * pw)
#define AY(km) (py + ph - (log10(km) - ly_lo) / (ly_hi - ly_lo) * ph)

    if (n < 2 || span <= 0) return;

    /* ── background ── */
    cairo_set_source_rgb(cr, MX_BASE_R, MX_BASE_G, MX_BASE_B);
    cairo_paint(cr);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);

    /* ── title ── */
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    show_text_at(cr, w / 2.0, 24.0, "Asteroid — Distance from Earth", 0.5);

    /* ── verdict banner: the answer, before the evidence ── */
    cairo_set_font_size(cr, 13.0);
    if (hit)
        cairo_set_source_rgb(cr, MX_RED_R, MX_RED_G, MX_RED_B);
    else
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);

    if (clones > 0)
        snprintf(txt, sizeof(txt),
                 "%s   •   Impact probability %.3f  (%.1f%% ± %.1f%%, %d clone orbits)",
                 hit ? "IMPACT" : "MISS", prob, prob * 100.0,
                 prob_sig * 100.0, clones);
    else
        snprintf(txt, sizeof(txt),
                 "%s   •   Impact probability %.0f  (no uncertainties given)",
                 hit ? "IMPACT" : "MISS", prob);
    show_text_at(cr, w / 2.0, 48.0, txt, 0.5);

    /* ── plot area ── */
    px = AG_PAD_LEFT;
    py = AG_PAD_TOP;
    pw = w - AG_PAD_LEFT - AG_PAD_RIGHT;
    ph = h - AG_PAD_TOP - AG_PAD_BOTTOM;
    if (pw < 50 || ph < 50) return;

    cairo_set_source_rgb(cr, MX_MANTLE_R, MX_MANTLE_G, MX_MANTLE_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── y range: whole decades, low enough to show Earth itself ── */
    d_lo = fmin(dmin, AG_R_EARTH_KM);
    d_hi = 0;
    for (i = 0; i < n; i++)
        d_hi = fmax(d_hi, dy[i] * AG_LD_KM);
    if (d_lo < 1.0) d_lo = 1.0;                 /* log10(0) is not a number we want */
    ly_lo = floor(log10(d_lo * 0.8));
    ly_hi = ceil(log10(d_hi * 1.05));
    if (ly_hi <= ly_lo) ly_hi = ly_lo + 1;

    /* ── grid + y ticks (one per decade) ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    cairo_set_line_width(cr, 1.0);
    for (v = ly_lo; v <= ly_hi + 1e-9; v += 1.0)
    {
        double y = AY(pow(10.0, v));

        cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G, MX_SURFACE0_B, 0.7);
        cairo_move_to(cr, px, y);
        cairo_line_to(cr, px + pw, y);
        cairo_stroke(cr);

        fmt_axis_km(pow(10.0, v), s1, sizeof(s1));
        cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
        show_text_at(cr, px - 8, y + 4, s1, 1.0);
    }

    /* ── grid + x ticks (days) ── */
    xs = nice_step(span, 8);
    for (v = 0; v <= span + 1e-9; v += xs)
    {
        double x = AX(v);

        cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G, MX_SURFACE0_B, 0.7);
        cairo_move_to(cr, x, py);
        cairo_line_to(cr, x, py + ph);
        cairo_stroke(cr);

        snprintf(s1, sizeof(s1), "%g", v);
        cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
        show_text_at(cr, x, py + ph + 16, s1, 0.5);
    }

    /* ── axis labels ── */
    jd_to_text(start, s1, sizeof(s1));
    s1[10] = '\0';                               /* date only */
    snprintf(txt, sizeof(txt), "Days after %s", s1);
    show_text_at(cr, px + pw / 2.0, h - 14.0, txt, 0.5);

    cairo_save(cr);
    cairo_translate(cr, 16.0, py + ph / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    show_text_at(cr, 0, 0, "Distance from Earth's centre (km, log scale)", 0.5);
    cairo_restore(cr);

    /* ── reference lines, clipped to the plot area ── */
    cairo_save(cr);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_clip(cr);

    if (log10(AG_LD_KM) <= ly_hi)
        ref_line(cr, px, px + pw, AY(AG_LD_KM),
                 MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B, "Moon's distance");

    fmt_km(bcap, s1, sizeof(s1));
    snprintf(txt, sizeof(txt), "Capture radius %s — below this line is a hit", s1);
    ref_line(cr, px, px + pw, AY(bcap),
             MX_RED_R, MX_RED_G, MX_RED_B, txt);

    /* Earth's surface: its label goes on the LEFT end, so it does not sit
       on top of the capture-radius label just above it */
    {
        const double dash[] = { 2.0, 3.0 };
        double       y      = AY(AG_R_EARTH_KM);

        cairo_save(cr);
        cairo_set_source_rgba(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B, 0.85);
        cairo_set_line_width(cr, 1.2);
        cairo_set_dash(cr, dash, 2, 0);
        cairo_move_to(cr, px, y);
        cairo_line_to(cr, px + pw, y);
        cairo_stroke(cr);
        cairo_restore(cr);

        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_set_font_size(cr, 9.5);
        show_text_at(cr, px + 4, y + 13, "Earth's surface (6,371 km)", 0.0);
    }

    /* ── the distance curve, with a soft fill underneath ── */
    cairo_move_to(cr, AX(tx[0]), AY(dy[0] * AG_LD_KM));
    for (i = 1; i < n; i++)
        cairo_line_to(cr, AX(tx[i]), AY(dy[i] * AG_LD_KM));

    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_stroke_preserve(cr);

    cairo_line_to(cr, AX(tx[n - 1]), py + ph);
    cairo_line_to(cr, AX(tx[0]),     py + ph);
    cairo_close_path(cr);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B, 0.15);
    cairo_fill(cr);

    cairo_restore(cr);   /* end clip */

    /* ── closest-approach marker ── */
    dot_x = AX(tca - start);
    dot_y = AY(fmax(dmin, 1.0));

    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    cairo_arc(cr, dot_x, dot_y, 5.0, 0, 2 * M_PI);
    cairo_fill(cr);

    /* ── callout: how close, when, how fast ── */
    {
        const char *lines[4];
        char        l0[96], l1[96], l2[96], l3[64];
        double      box_w = 0, box_h, bx, by;
        double      line_h = 15.0;
        int         k;
        cairo_text_extents_t te;

        fmt_km(dmin, s1, sizeof(s1));
        snprintf(l0, sizeof(l0), "Closest approach: %s", s1);

        /* above or below the ground? */
        if (dmin < AG_R_EARTH_KM)
            snprintf(l1, sizeof(l1), "(%.2f Earth radii — the path passes through Earth)",
                     dmin / AG_R_EARTH_KM);
        else
        {
            fmt_km(dmin - AG_R_EARTH_KM, s2, sizeof(s2));
            snprintf(l1, sizeof(l1), "(%.2f Earth radii — %s above the surface)",
                     dmin / AG_R_EARTH_KM, s2);
        }

        jd_to_text(tca, s1, sizeof(s1));
        snprintf(l2, sizeof(l2), "%s TDB  (day %.2f)", s1, tca - start);
        snprintf(l3, sizeof(l3), "Relative speed %.2f km/s", vrel);

        lines[0] = l0; lines[1] = l1; lines[2] = l2; lines[3] = l3;

        /* size the box to the widest line */
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_font_size(cr, 10.5);
        for (k = 0; k < 4; k++)
        {
            cairo_text_extents(cr, lines[k], &te);
            box_w = fmax(box_w, te.x_advance);
        }
        box_w += 20.0;
        box_h  = 4 * line_h + 12.0;

        /* right of the dot if it fits, otherwise left.  Vertically it sits
           just above the capture-radius line: the curve only reaches down
           there at the dip itself, so the box covers empty sky instead of
           the flanks of the curve */
        bx = (dot_x + 18 + box_w < px + pw) ? dot_x + 18 : dot_x - 18 - box_w;
        if (bx < px + 4) bx = px + 4;
        by = AY(bcap) - box_h - 30;
        by = fmax(py + 8, fmin(by, py + ph - box_h - 8));

        /* leader line from the dot to the box */
        cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.8);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, dot_x, dot_y);
        cairo_line_to(cr, (bx > dot_x) ? bx : bx + box_w, by + box_h / 2.0);
        cairo_stroke(cr);

        /* box */
        cairo_set_source_rgba(cr, MX_CRUST_R, MX_CRUST_G, MX_CRUST_B, 0.92);
        cairo_rectangle(cr, bx, by, box_w, box_h);
        cairo_fill_preserve(cr);
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_stroke(cr);

        /* text — first line bold, it is the one that matters */
        for (k = 0; k < 4; k++)
        {
            cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                                   k == 0 ? CAIRO_FONT_WEIGHT_BOLD
                                          : CAIRO_FONT_WEIGHT_NORMAL);
            if (k == 0)
                cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
            else
                cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
            show_text_at(cr, bx + 10, by + 18 + k * line_h, lines[k], 0.0);
        }
    }

    /* ── frame ── */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_stroke(cr);

#undef AX
#undef AY
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_asteroid
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_asteroid(void)
{
    AppState *st = app_state_get();
    double   *info = NULL;
    double   *t    = NULL;
    double   *d    = NULL;
    double   *xs   = NULL;
    double   *ys   = NULL;
    int       n_info = 0, n_t = 0, n_d = 0;
    int       n;
    int       i;

    /* each dump reuses response_buf, so parse each one before the next */
    if (pipe_transact("dump $asteroid_info\n", st->response_buf, RESPONSE_BUFSIZE))
        info = parse_vector_response(st->response_buf, &n_info);
    if (pipe_transact("dump $asteroid_t\n", st->response_buf, RESPONSE_BUFSIZE))
        t = parse_vector_response(st->response_buf, &n_t);
    if (pipe_transact("dump $asteroid_d\n", st->response_buf, RESPONSE_BUFSIZE))
        d = parse_vector_response(st->response_buf, &n_d);

    if (!info || n_info < AST_GRAPH_HDR || !t || !d || n_t != n_d || n_t < 2)
    {
        app_status_set("No asteroid data — run the Asteroid Impact Screening first");
        g_free(info); g_free(t); g_free(d);
        return;
    }

    /* pack: header, then the curve (see asteroid_graph.h) */
    n  = AST_GRAPH_HDR + n_t;
    xs = g_new0(double, n);
    ys = g_new0(double, n);

    for (i = 0; i < AST_GRAPH_HDR; i++)
        xs[i] = info[i];
    for (i = 0; i < n_t; i++)
    {
        xs[AST_GRAPH_HDR + i] = t[i];
        ys[AST_GRAPH_HDR + i] = d[i];
    }

    /* the window takes its own copies */
    graph_window_open_vars("Asteroid Impact Screening", PLOT_ASTEROID,
                           "", "", xs, ys, n);

    g_free(info); g_free(t); g_free(d);
    g_free(xs);   g_free(ys);
}
