/* =============================================================================
 * File:         navier_graph.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Cairo drawing for the Navier-Stokes lid-driven cavity plot.
 *               See navier_graph.h for the layout and the GraphData packing.
 *               All the numbers come from parse ($navier_*); this file only
 *               fetches and draws them.
 * ============================================================================= */

#include "navier_graph.h"
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

/* ── layout ── */
#define NG_PAD_TOP      110.0    /* title + two banner lines + legend       */
#define NG_PAD_BOTTOM   52.0     /* x tick labels + axis label              */
#define NG_PAD_LEFT     66.0     /* y tick labels + rotated axis label      */
#define NG_PAD_RIGHT    18.0
#define NG_PANEL_GAP    56.0     /* room for the right panel's y labels     */
#define NG_RANGE_PAD    0.05     /* margin added to each speed axis range   */

/* a "good match" with Ghia, as a fraction of the lid speed */
#define NG_GOOD_MATCH   0.02

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_navier_plot
   ═══════════════════════════════════════════════════════════ */

void draw_navier_plot(cairo_t *cr, int w, int h, const GraphData *gd)
{
    /* ── unpack the header ── */
    double Re      = gd->x_data[0];
    int    N       = (int)gd->x_data[1];
    double psimin  = gd->x_data[2];
    double xc      = gd->x_data[3];
    double yc      = gd->x_data[4];
    double err     = gd->x_data[5];
    int    steady  = gd->x_data[6] > 0.5;
    int    nG      = (int)gd->x_data[7];

    /* ── the four sections after the header (see navier_graph.h) ── */
    int           n    = (gd->n - NG_HDR - 2 * nG) / 2;
    const double *ypos = gd->x_data + NG_HDR;          /* left curve  */
    const double *u    = gd->y_data + NG_HDR;
    const double *xpos = gd->x_data + NG_HDR + n;      /* right curve */
    const double *v    = gd->y_data + NG_HDR + n;
    const double *gy   = gd->x_data + NG_HDR + 2 * n;  /* left dots   */
    const double *gu   = gd->y_data + NG_HDR + 2 * n;
    const double *gx   = gd->x_data + NG_HDR + 2 * n + nG;  /* right dots */
    const double *gv   = gd->y_data + NG_HDR + 2 * n + nG;

    double  pw, ph, lx, rx, py;
    double  lo, hi;
    double  leg_x;
    GraphAxis  posAxis, uAxis, vAxis;
    char    txt[200];

    if (n < 2) return;

    /* ── background ── */
    cairo_set_source_rgb(cr, MX_GRAPH_BG_R, MX_GRAPH_BG_G, MX_GRAPH_BG_B);
    cairo_paint(cr);

    /* ── title ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TITLE_R, MX_GRAPH_TITLE_G, MX_GRAPH_TITLE_B);
    show_text_at(cr, w / 2.0, 22.0, "Navier-Stokes — Lid-Driven Cavity", 0.5);

    /* ── banner line 1: what was solved and what came out ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    snprintf(txt, sizeof(txt),
             "Re = %g   •   %d × %d grid   •   main vortex centre (%.3f, %.3f), "
             "strength %.4f",
             Re, N, N, xc, yc, psimin);
    show_text_at(cr, w / 2.0, 42.0, txt, 0.5);

    /* ── banner line 2: should you believe it? ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    if (!steady)
    {
        cairo_set_source_rgb(cr, MX_RED_R, MX_RED_G, MX_RED_B);
        snprintf(txt, sizeof(txt),
                 "Not settled yet — the flow was still changing.  "
                 "Raise \"Max steps\" and run again.");
    }
    else if (err < 0.0)
    {
        cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
        snprintf(txt, sizeof(txt),
                 "No published answer to compare against "
                 "(Ghia et al. 1982 covers Re = 100, 400 and 1000)");
    }
    else if (err < NG_GOOD_MATCH)
    {
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        snprintf(txt, sizeof(txt),
                 "Matches Ghia et al. (1982) — worst point is off by %.1f%% of "
                 "the lid speed", err * 100.0);
    }
    else
    {
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "Off from Ghia et al. (1982) by up to %.1f%% of the lid speed — "
                 "use a finer grid (more grid points)", err * 100.0);
    }
    show_text_at(cr, w / 2.0, 60.0, txt, 0.5);

    /* ── legend: line = this solution, dot = Ghia (only if dots exist) ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    leg_x = w / 2.0 - (nG > 0 ? 120.0 : 50.0);

    cairo_set_source_rgb(cr, MX_GRAPH_LINE_R, MX_GRAPH_LINE_G, MX_GRAPH_LINE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, leg_x,        74.0);
    cairo_line_to(cr, leg_x + 22.0, 74.0);
    cairo_stroke(cr);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    show_text_at(cr, leg_x + 28.0, 78.0, "This solution", 0.0);

    if (nG > 0)
    {
        /* drop the pen first — show_text leaves it parked at the end of the
           label, and cairo_arc would happily draw a line from there */
        cairo_new_path(cr);
        cairo_arc(cr, leg_x + 135.0, 74.0, GRAPH_DOT_RADIUS, 0, 2 * M_PI);
        cairo_set_source_rgb(cr, MX_GRAPH_DOT_R, MX_GRAPH_DOT_G, MX_GRAPH_DOT_B);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, leg_x + 144.0, 78.0, "Ghia et al. 1982", 0.0);
    }

    /* ── two equal panels side by side ── */
    pw = (w - NG_PAD_LEFT - NG_PANEL_GAP - NG_PAD_RIGHT) / 2.0;
    ph = h - NG_PAD_TOP - NG_PAD_BOTTOM;
    if (pw < 80 || ph < 80) return;      /* window dragged too small to be useful */
    lx = NG_PAD_LEFT;
    rx = NG_PAD_LEFT + pw + NG_PANEL_GAP;
    py = NG_PAD_TOP;

    /* ── axis ranges: position is always the box, 0 to 1; speeds come
          from the data, dots included, via graph.c's nice_range() ── */
    nice_range(0.0, 1.0, &posAxis.lo, &posAxis.hi, &posAxis.step);
    graph_data_range(u, n, gu, nG, NG_RANGE_PAD, &lo, &hi);
    nice_range(lo, hi, &uAxis.lo, &uAxis.hi, &uAxis.step);
    graph_data_range(v, n, gv, nG, NG_RANGE_PAD, &lo, &hi);
    nice_range(lo, hi, &vAxis.lo, &vAxis.hi, &vAxis.step);

    /* ── left: u against height, so the curve stands up like the
          vertical centreline it was measured on ── */
    graph_xy_panel(cr, lx, py, pw, ph,
                   "Up the vertical centre line",
                   "Horizontal speed u  (fraction of lid speed)",
                   "Height y  (fraction of box)",
                   u, ypos, n, gu, gy, nG, NAN,
                   uAxis, posAxis);

    /* ── right: v against x, lying along the horizontal centreline ── */
    graph_xy_panel(cr, rx, py, pw, ph,
                   "Across the horizontal centre line",
                   "Position x  (fraction of box)",
                   "Vertical speed v  (fraction of lid speed)",
                   xpos, v, n, gx, gv, nG, NAN,
                   posAxis, vAxis);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_navier
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_navier(void)
{
    double  hdr[NG_HDR] = { 0 };
    double *yv = NULL, *uv = NULL, *xv = NULL, *vv = NULL;
    double *gy = NULL, *gu = NULL, *gx = NULL, *gv = NULL;
    double *xs = NULL, *ys = NULL;
    int     n_y = 0, n_u = 0, n_x = 0, n_v = 0;
    int     n_gy = 0, n_gu = 0, n_gx = 0, n_gv = 0;
    int     nG = 0;
    int     n;
    int     k;
    int     i;

    /* ── the four centreline vectors ── */
    yv = graph_fetch_vector("navier_y", &n_y);
    uv = graph_fetch_vector("navier_u", &n_u);
    xv = graph_fetch_vector("navier_x", &n_x);
    vv = graph_fetch_vector("navier_v", &n_v);

    if (!yv || !uv || !xv || !vv || n_y < 2 ||
        n_u != n_y || n_x != n_y || n_v != n_y)
    {
        app_status_set("No cavity results yet — run Navier-Stokes Cavity first");
        g_free(yv); g_free(uv); g_free(xv); g_free(vv);
        return;
    }

    /* ── scalars for the banner ── */
    hdr[0] = graph_fetch_scalar("navier_Re");
    hdr[1] = n_y;
    hdr[2] = graph_fetch_scalar("navier_psimin");
    hdr[3] = graph_fetch_scalar("navier_xc");
    hdr[4] = graph_fetch_scalar("navier_yc");
    hdr[5] = graph_fetch_scalar("navier_err");
    hdr[6] = graph_fetch_scalar("navier_conv");

    /* ── benchmark dots, only when THIS run had a benchmark.  The
          $navier_g* vectors survive from older runs, so a run at Re=250
          after one at Re=100 would otherwise wear Re=100's dots. ── */
    if (hdr[5] >= 0.0)
    {
        gy = graph_fetch_vector("navier_gy", &n_gy);
        gu = graph_fetch_vector("navier_gu", &n_gu);
        gx = graph_fetch_vector("navier_gx", &n_gx);
        gv = graph_fetch_vector("navier_gv", &n_gv);
        if (gy && gu && gx && gv &&
            n_gy == n_gu && n_gx == n_gv && n_gy == n_gx)
            nG = n_gy;
    }
    hdr[7] = nG;

    /* ── pack: header, curve L, curve R, dots L, dots R ── */
    n  = NG_HDR + 2 * n_y + 2 * nG;
    xs = g_new0(double, n);
    ys = g_new0(double, n);

    for (i = 0; i < NG_HDR; i++) xs[i] = hdr[i];
    k = NG_HDR;
    for (i = 0; i < n_y; i++, k++) { xs[k] = yv[i]; ys[k] = uv[i]; }
    for (i = 0; i < n_y; i++, k++) { xs[k] = xv[i]; ys[k] = vv[i]; }
    for (i = 0; i < nG;  i++, k++) { xs[k] = gy[i]; ys[k] = gu[i]; }
    for (i = 0; i < nG;  i++, k++) { xs[k] = gx[i]; ys[k] = gv[i]; }

    /* the window takes its own copies */
    graph_window_open_vars("Navier-Stokes Cavity", PLOT_NAVIER,
                           "", "", xs, ys, n);

    g_free(yv); g_free(uv); g_free(xv); g_free(vv);
    g_free(gy); g_free(gu); g_free(gx); g_free(gv);
    g_free(xs); g_free(ys);
}
