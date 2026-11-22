/* =============================================================================
 * File:         slittest_graph.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  Cairo drawing for the two-slits-against-one plot.
 *               See slittest_graph.h for the layout and GraphData packing.
 *               All the numbers come from parse ($slit_*); this file only
 *               fetches and draws them.  Every panel goes through graph.c's
 *               shared graph_xy_panel(), like the channel and cavity plots.
 * ============================================================================= */

#include "slittest_graph.h"
#include "graph_data.h"
#include "graph.h"
#include "app_state.h"
#include "colors.h"

#include <gtk/gtk.h>
#include <cairo.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* ── layout ── */
#define SG_PAD_TOP      108.0    /* title, two banner lines, legend, panel title */
#define SG_PAD_LEFT      70.0
#define SG_PAD_RIGHT     18.0
#define SG_PAD_BOTTOM    52.0    /* bottom panel's x labels                     */
#define SG_COL_GAP       70.0    /* between the two columns                     */
#define SG_ROW_GAP       64.0    /* x labels of one row + title of the next     */
#define SG_GRID_FRAC     0.66    /* share of the plot height the 2 x 2 grid takes */
#define SG_RANGE_PAD     0.06    /* margin on the vertical axes                 */

/* the same test parse applies in its verdict (slittest.c) */
#define SG_WIN_MATCH     0.80    /* two-slit match at least this ...           */
#define SG_WIN_BUMPS2    4       /* ... a row of at least this many bumps ...  */
#define SG_WIN_BUMPS1    2       /* ... that shrinks to this few with one slit */

/*************************************************************
 * Function:    pattern_panel
 * Input:       cr             — Cairo context
 *              px, py, pw, ph — panel area in pixels
 *              title          — panel heading
 *              ys             — screen heights, m
 *              share          — pattern, each bin a share of the total
 *              nb             — bins
 *              ax, ay         — axis ranges (ay in percent)
 * Output:      void
 * Description: One screen pattern, drawn as percent of all hits so
 *              the axis reads in everyday numbers.  graph_xy_panel()
 *              does the drawing; this just converts to percent.
 *************************************************************/
static void pattern_panel(cairo_t *cr,
                          double px, double py, double pw, double ph,
                          const char *title,
                          const double *ys, const double *share, int nb,
                          GraphAxis ax, GraphAxis ay)
{
    double *pct = g_new(double, nb);
    int     i;

    for (i = 0; i < nb; i++) pct[i] = 100.0 * share[i];

    graph_xy_panel(cr, px, py, pw, ph, title,
                   "Height on the screen (m)", "Share of hits (%)",
                   ys, pct, nb, NULL, NULL, 0, NAN, ax, ay);
    g_free(pct);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_slittest_plot
   ═══════════════════════════════════════════════════════════ */

void draw_slittest_plot(cairo_t *cr, int w, int h, const GraphData *gd)
{
    /* ── unpack the header ── */
    const double *hd     = gd->x_data;
    int           nb     = (int)hd[SG_H_NB];
    int           nr     = (int)hd[SG_H_NR];
    double        Re     = hd[SG_H_RE];
    double        lam    = hd[SG_H_LAMBDA];
    double        m2     = hd[SG_H_MATCH2];
    double        m1     = hd[SG_H_MATCH1];
    int           bumps2 = (int)hd[SG_H_BUMPS2];
    int           bumps1 = (int)hd[SG_H_BUMPS1];
    int           bands2 = (int)hd[SG_H_BANDS2];
    int           bands1 = (int)hd[SG_H_BANDS1];
    int           nfail  = (int)hd[SG_H_NFAIL];

    /* ── the sections after the header (see slittest_graph.h) ── */
    const double *ys     = gd->x_data + SG_HDR;
    const double *ns2    = gd->y_data + SG_HDR;
    const double *ns1    = gd->x_data + SG_HDR + nb;
    const double *wv2    = gd->y_data + SG_HDR + nb;
    const double *wv1    = gd->x_data + SG_HDR + 2 * nb;
    const double *lre    = gd->x_data + SG_HDR + 3 * nb;
    const double *mt2    = gd->y_data + SG_HDR + 3 * nb;
    const double *mt1    = gd->x_data + SG_HDR + 3 * nb + nr;

    double     avail, gh, rh, bh, pw, lx, rx, ty, by, top, lo, hi;
    double    *m2p, *m1p;
    int        i, won;
    GraphAxis  yAxis, pAxis, reAxis, mAxis;
    char       txt[220];
    char       t1[96], t2[96], t3[96], t4[96];

    if (nb < 2 || nr < 1) return;

    /* ── background and title ── */
    cairo_set_source_rgb(cr, MX_GRAPH_BG_R, MX_GRAPH_BG_G, MX_GRAPH_BG_B);
    cairo_paint(cr);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TITLE_R, MX_GRAPH_TITLE_G, MX_GRAPH_TITLE_B);
    show_text_at(cr, w / 2.0, 22.0,
                 "Two Slits Against One — Fluid Particles Against Waves", 0.5);

    /* ── banner line 1: what is on show ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    snprintf(txt, sizeof(txt),
             "Shown: Re = %.4g, where the fluid came closest   •   "
             "wavelength fitted %.3g m   •   match %.0f%% with two slits, %.0f%% with one",
             Re, lam, 100.0 * m2, 100.0 * m1);
    show_text_at(cr, w / 2.0, 42.0, txt, 0.5);

    /* ── banner line 2: the verdict, by the same test parse uses ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    won = (m2 >= SG_WIN_MATCH && bumps2 >= SG_WIN_BUMPS2 && bumps1 <= SG_WIN_BUMPS1);
    if (won)
    {
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        snprintf(txt, sizeof(txt),
                 "The fluid made fringe-like bands that went away when one slit "
                 "closed — the way the waves behave");
    }
    else
    {
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "No interference from the fluid: at no Reynolds number did its "
                 "particles land in a row of bands like the waves'%s",
                 nfail > 0 ? "  (some runs gave no result)" : "");
    }
    show_text_at(cr, w / 2.0, 60.0, txt, 0.5);

    /* ── legend for the bottom panel: line = two slits, dot = one ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    {
        double lgx = w / 2.0 - 120.0;

        cairo_set_source_rgb(cr, MX_GRAPH_LINE_R, MX_GRAPH_LINE_G, MX_GRAPH_LINE_B);
        cairo_set_line_width(cr, 2.0);
        cairo_move_to(cr, lgx, 74.0);
        cairo_line_to(cr, lgx + 22.0, 74.0);
        cairo_stroke(cr);
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, lgx + 28.0, 78.0, "Two slits open", 0.0);

        cairo_new_path(cr);
        cairo_arc(cr, lgx + 140.0, 74.0, GRAPH_DOT_RADIUS, 0, 2 * M_PI);
        cairo_set_source_rgb(cr, MX_GRAPH_DOT_R, MX_GRAPH_DOT_G, MX_GRAPH_DOT_B);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, lgx + 150.0, 78.0, "One slit open", 0.0);
    }

    /* ── geometry: two rows of patterns, then the sweep panel ── */
    avail = h - SG_PAD_TOP - SG_PAD_BOTTOM - 2.0 * SG_ROW_GAP;
    gh    = avail * SG_GRID_FRAC;            /* both pattern rows together */
    rh    = gh / 2.0;                        /* one pattern row            */
    bh    = avail - gh;                      /* the sweep panel            */
    pw    = (w - SG_PAD_LEFT - SG_COL_GAP - SG_PAD_RIGHT) / 2.0;
    if (rh < 50.0 || bh < 50.0 || pw < 80.0) return;   /* window dragged too small */

    lx = SG_PAD_LEFT;
    rx = SG_PAD_LEFT + pw + SG_COL_GAP;
    ty = SG_PAD_TOP;                          /* fluid row     */
    by = ty + rh + SG_ROW_GAP;                /* waves row     */

    /* ── one shared scale for all four, so tall means tall everywhere ── */
    top = 0.0;
    for (i = 0; i < nb; i++)
        top = fmax(top, fmax(fmax(ns2[i], ns1[i]), fmax(wv2[i], wv1[i])));
    nice_range(ys[0] - 0.5 * (ys[1] - ys[0]), ys[nb - 1] + 0.5 * (ys[1] - ys[0]),
               &yAxis.lo, &yAxis.hi, &yAxis.step);
    nice_range(0.0, 100.0 * top * (1.0 + SG_RANGE_PAD),
               &pAxis.lo, &pAxis.hi, &pAxis.step);

    /* titles carry the count — the one number the eye should check */
    snprintf(t1, sizeof(t1), "Fluid particles — two slits (%d bump%s)",
             bumps2, bumps2 == 1 ? "" : "s");
    snprintf(t2, sizeof(t2), "Fluid particles — one slit (%d bump%s)",
             bumps1, bumps1 == 1 ? "" : "s");
    snprintf(t3, sizeof(t3), "Waves — two slits (%d bright band%s)",
             bands2, bands2 == 1 ? "" : "s");
    snprintf(t4, sizeof(t4), "Waves — one slit (%d bright band%s)",
             bands1, bands1 == 1 ? "" : "s");

    pattern_panel(cr, lx, ty, pw, rh, t1, ys, ns2, nb, yAxis, pAxis);
    pattern_panel(cr, rx, ty, pw, rh, t2, ys, ns1, nb, yAxis, pAxis);
    pattern_panel(cr, lx, by, pw, rh, t3, ys, wv2, nb, yAxis, pAxis);
    pattern_panel(cr, rx, by, pw, rh, t4, ys, wv1, nb, yAxis, pAxis);

    /* ── the sweep: match against Reynolds number, in percent ── */
    m2p = g_new(double, nr);
    m1p = g_new(double, nr);
    for (i = 0; i < nr; i++) { m2p[i] = 100.0 * mt2[i]; m1p[i] = 100.0 * mt1[i]; }

    /* a single Reynolds number would make a zero-width axis */
    lo = lre[0];
    hi = lre[nr - 1];
    if (hi - lo < 0.2) { lo -= 0.5; hi += 0.5; }
    nice_range(lo, hi, &reAxis.lo, &reAxis.hi, &reAxis.step);
    mAxis.lo = 0.0; mAxis.hi = 100.0; mAxis.step = 20.0;

    graph_xy_panel(cr, lx, by + rh + SG_ROW_GAP, w - SG_PAD_LEFT - SG_PAD_RIGHT, bh,
                   "How closely the fluid matched the waves, at every Reynolds number",
                   "Reynolds number, log scale  (1 = 10,  2 = 100,  3 = 1000)",
                   "Match (%)",
                   lre, m2p, nr, lre, m1p, nr, NAN, reAxis, mAxis);

    g_free(m2p);
    g_free(m1p);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_slittest
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_slittest(void)
{
    double  hdr[SG_HDR] = { 0 };
    double *re = NULL, *m2 = NULL, *m1 = NULL, *lam = NULL;
    double *b2 = NULL, *b1 = NULL, *w2 = NULL, *w1 = NULL;
    double *ns2 = NULL, *ns1 = NULL, *wv2 = NULL, *wv1 = NULL, *ys = NULL;
    double *xs = NULL, *yv = NULL;
    int     n_re = 0, n_m2 = 0, n_m1 = 0, n_lam = 0, n_b2 = 0, n_b1 = 0;
    int     n_w2 = 0, n_w1 = 0, n_ns2 = 0, n_ns1 = 0, n_wv2 = 0, n_wv1 = 0, n_y = 0;
    int     nr, nb, best, nok, n, k, i, q;

    /* ── the sweep, one value per Reynolds number ── */
    re  = graph_fetch_vector("slit_re",     &n_re);
    m2  = graph_fetch_vector("slit_match2", &n_m2);
    m1  = graph_fetch_vector("slit_match1", &n_m1);
    lam = graph_fetch_vector("slit_lambda", &n_lam);
    b2  = graph_fetch_vector("slit_bumps2", &n_b2);
    b1  = graph_fetch_vector("slit_bumps1", &n_b1);
    w2  = graph_fetch_vector("slit_bands2", &n_w2);
    w1  = graph_fetch_vector("slit_bands1", &n_w1);

    /* ── the patterns: [bins x Re] matrices, stored row by row, so bin b
          of Reynolds number q sits at b * nr + q ── */
    ns2 = graph_fetch_vector("slit_ns2",   &n_ns2);
    ns1 = graph_fetch_vector("slit_ns1",   &n_ns1);
    wv2 = graph_fetch_vector("slit_wave2", &n_wv2);
    wv1 = graph_fetch_vector("slit_wave1", &n_wv1);
    ys  = graph_fetch_vector("slit_y",     &n_y);

    nr = n_re;
    nb = n_y;

    if (!re || !m2 || !m1 || !lam || !b2 || !b1 || !w2 || !w1 ||
        !ns2 || !ns1 || !wv2 || !wv1 || !ys || nr < 1 || nb < 2 ||
        n_m2 != nr || n_m1 != nr || n_lam != nr || n_b2 != nr || n_b1 != nr ||
        n_w2 != nr || n_w1 != nr ||
        n_ns2 != nb * nr || n_ns1 != nb * nr || n_wv2 != nb * nr || n_wv1 != nb * nr)
    {
        app_status_set("No two-slit results yet — run Two Slits Against One first");
        goto done;
    }

    /* ── the Reynolds number to show: best two-slit match, as parse picks
          it.  A failed run is stored as -1 and can never win ── */
    best = -1;
    nok  = 0;
    for (q = 0; q < nr; q++)
    {
        if (m2[q] < 0.0) continue;
        nok++;
        if (best < 0 || m2[q] > m2[best]) best = q;
    }
    if (best < 0)
    {
        app_status_set("Every run in the sweep failed — try more grid cells");
        goto done;
    }

    hdr[SG_H_NB]     = nb;
    hdr[SG_H_NR]     = nok;
    hdr[SG_H_RE]     = re[best];
    hdr[SG_H_LAMBDA] = lam[best];
    hdr[SG_H_MATCH2] = m2[best];
    hdr[SG_H_MATCH1] = m1[best];
    hdr[SG_H_BUMPS2] = b2[best];
    hdr[SG_H_BUMPS1] = b1[best];
    hdr[SG_H_BANDS2] = w2[best];
    hdr[SG_H_BANDS1] = w1[best];
    hdr[SG_H_NFAIL]  = nr - nok;

    /* ── pack: header, the three pattern sections, the two sweep
          sections (see slittest_graph.h) ── */
    n  = SG_HDR + 3 * nb + 2 * nok;
    xs = g_new0(double, n);
    yv = g_new0(double, n);

    for (i = 0; i < SG_HDR; i++) xs[i] = hdr[i];
    k = SG_HDR;
    for (i = 0; i < nb; i++, k++) { xs[k] = ys[i];               yv[k] = ns2[i * nr + best]; }
    for (i = 0; i < nb; i++, k++) { xs[k] = ns1[i * nr + best];  yv[k] = wv2[i * nr + best]; }
    for (i = 0; i < nb; i++, k++) { xs[k] = wv1[i * nr + best]; }

    /* Reynolds numbers on a log scale; failed runs stay off the chart */
    for (q = 0; q < nr; q++)
        if (m2[q] >= 0.0) { xs[k] = log10(re[q]); yv[k] = m2[q]; k++; }
    for (q = 0; q < nr; q++)
        if (m2[q] >= 0.0) { xs[k] = m1[q]; k++; }

    /* the window takes its own copies */
    graph_window_open_vars("Two Slits Against One", PLOT_SLITTEST,
                           "", "", xs, yv, n);

done:
    g_free(re); g_free(m2); g_free(m1); g_free(lam);
    g_free(b2); g_free(b1); g_free(w2); g_free(w1);
    g_free(ns2); g_free(ns1); g_free(wv2); g_free(wv1); g_free(ys);
    g_free(xs); g_free(yv);
}
