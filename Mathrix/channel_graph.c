/* =============================================================================
 * File:         channel_graph.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Cairo drawing for the channel-flow-past-a-cylinder plot.
 *               See channel_graph.h for the layout and GraphData packing.
 *               All the numbers come from parse ($channel_*); this file
 *               only fetches and draws them.  The force panels go through
 *               graph.c's shared graph_xy_panel(), like the cavity plot.
 * ============================================================================= */

#include "channel_graph.h"
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
#define CG_PAD_TOP      112.0    /* title, two banner lines, legend, map title  */
#define CG_PAD_LEFT      66.0
#define CG_PAD_RIGHT     18.0
#define CG_PAD_BOTTOM    52.0    /* force panels' x labels                     */
#define CG_MAP_FRAC      0.42    /* share of the height the map may take       */
#define CG_MAP_GAP       64.0    /* map's x labels + the force panels' titles  */
#define CG_BAR_W         14.0    /* colour key width                           */
#define CG_BAR_GAP       10.0
#define CG_PANEL_GAP     70.0    /* between the two force panels               */
#define CG_RANGE_PAD     0.08    /* margin on the force axes                   */
#define CG_SKIP_START    0.10    /* force axes ignore this first share of the
                                    run: the instant start kicks out a drag
                                    spike ~20x the real value, and a scale
                                    built round it flattens everything else  */

/* the colour scale stops at this share of the swirl values, so the
   two corner spikes at the cylinder don't wash everything else out */
#define CG_SWIRL_PERCENTILE 0.95

/* a "good match" with the DFG benchmark, as a fraction */
#define CG_GOOD_MATCH    0.05

/* DFG reference values (Schäfer & Turek; FeatFlow tables) */
#define CG_DFG1_CD       5.57953523384
#define CG_DFG1_CL       0.010618948146
#define CG_DFG2_CDMAX    3.2200
#define CG_DFG2_CLMAX    0.9859
#define CG_DFG2_ST       0.30188

/*************************************************************
 * Function:    cmp_double
 * Input:       a, b — pointers to doubles
 * Output:      int  — qsort ordering
 * Description: Ascending order, for the percentile in swirl_scale().
 *************************************************************/
static int cmp_double(const void *a, const void *b)
{
    double x = *(const double *)a;
    double y = *(const double *)b;

    return (x > y) - (x < y);
}

/*************************************************************
 * Function:    swirl_scale
 * Input:       w     — vorticity field
 *              solid — 1 inside the cylinder
 *              n     — field size
 * Output:      double — the swirl value that gets full colour
 * Description: The CG_SWIRL_PERCENTILE point of |w| over the fluid.
 *              The sharp cylinder corners spin far harder than the
 *              wake; scaling to the true maximum would paint the
 *              interesting part a uniform dull nothing.
 *************************************************************/
static double swirl_scale(const double *w, const double *solid, int n)
{
    double *a = g_new(double, n);
    double  s;
    int     m = 0;
    int     i;

    for (i = 0; i < n; i++)
        if (solid[i] < 0.5) a[m++] = fabs(w[i]);

    if (m == 0) { g_free(a); return 1.0; }
    qsort(a, m, sizeof(double), cmp_double);
    s = a[(int)(CG_SWIRL_PERCENTILE * (m - 1))];
    g_free(a);
    return (s > 1e-12) ? s : 1.0;
}

/*************************************************************
 * Function:    swirl_colour
 * Input:       t       (double) — swirl / scale, clamped to -1 .. 1
 *              r, g, b (double*) — receive the colour
 * Output:      void
 * Description: Diverging map: still water is the panel colour,
 *              clockwise swirl fades to blue, counter-clockwise to
 *              red.  Printing flips it to light-centred, and blue
 *              and red survive the flip.
 *************************************************************/
static void swirl_colour(double t, double *r, double *g, double *b)
{
    double a = fabs(t);

    if (t < 0.0)
    {
        *r = MX_GRAPH_PANEL_R + a * (MX_BLUE_R - MX_GRAPH_PANEL_R);
        *g = MX_GRAPH_PANEL_G + a * (MX_BLUE_G - MX_GRAPH_PANEL_G);
        *b = MX_GRAPH_PANEL_B + a * (MX_BLUE_B - MX_GRAPH_PANEL_B);
    }
    else
    {
        *r = MX_GRAPH_PANEL_R + a * (MX_RED_R - MX_GRAPH_PANEL_R);
        *g = MX_GRAPH_PANEL_G + a * (MX_RED_G - MX_GRAPH_PANEL_G);
        *b = MX_GRAPH_PANEL_B + a * (MX_RED_B - MX_GRAPH_PANEL_B);
    }
}

/*************************************************************
 * Function:    draw_swirl_map
 * Input:       cr             — Cairo context
 *              mx, my, mw, mh — map area in pixels
 *              w, solid       — vorticity and cylinder mask, row 0 = bottom
 *              nx, ny         — field size
 *              L, H, cx, cy, D — channel and cylinder, m
 * Output:      void
 * Description: The field becomes a small image, one pixel per grid
 *              cell, which Cairo stretches smoothly onto the map.
 *              Then the true circle, the frame, metre ticks and the
 *              colour key go on top.
 *************************************************************/
static void draw_swirl_map(cairo_t *cr,
                           double mx, double my, double mw, double mh,
                           const double *w, const double *solid,
                           int nx, int ny,
                           double L, double H, double cx, double cy, double D)
{
    cairo_surface_t *img;
    cairo_pattern_t *pat;
    unsigned char   *data;
    guint32         *row;
    int              stride;
    int              i, j, k;
    double           scale, r, g, b, v, step, lo, hi;
    double           bx = mx + mw + CG_BAR_GAP;
    char             s[32];

    scale = swirl_scale(w, solid, nx * ny);

    /* ── field → image.  Image rows run top-down, the field bottom-up ── */
    img    = cairo_image_surface_create(CAIRO_FORMAT_RGB24, nx, ny);
    data   = cairo_image_surface_get_data(img);
    stride = cairo_image_surface_get_stride(img);
    for (j = 0; j < ny; j++)
    {
        row = (guint32 *)(data + (size_t)(ny - 1 - j) * stride);
        for (i = 0; i < nx; i++)
        {
            k = j * nx + i;
            if (solid[k] > 0.5)
            {
                /* inside the cylinder: plain grey, no swirl to speak of */
                r = MX_OVERLAY1_R; g = MX_OVERLAY1_G; b = MX_OVERLAY1_B;
            }
            else
                swirl_colour(fmax(-1.0, fmin(1.0, w[k] / scale)), &r, &g, &b);

            row[i] = ((guint32)(r * 255.0 + 0.5) << 16) |
                     ((guint32)(g * 255.0 + 0.5) <<  8) |
                      (guint32)(b * 255.0 + 0.5);
        }
    }
    cairo_surface_mark_dirty(img);

    /* ── stretch it onto the map, smoothly ── */
    cairo_save(cr);
    cairo_rectangle(cr, mx, my, mw, mh);
    cairo_clip(cr);
    cairo_translate(cr, mx, my);
    cairo_scale(cr, mw / nx, mh / ny);
    cairo_set_source_surface(cr, img, 0, 0);
    pat = cairo_get_source(cr);
    cairo_pattern_set_filter(pat, CAIRO_FILTER_BILINEAR);
    cairo_pattern_set_extend(pat, CAIRO_EXTEND_PAD);
    cairo_paint(cr);
    cairo_restore(cr);
    cairo_surface_destroy(img);

    /* ── the real circle over the blocky grid one ── */
    cairo_new_path(cr);
    cairo_arc(cr, mx + cx / L * mw, my + (1.0 - cy / H) * mh,
              0.5 * D / L * mw, 0, 2 * M_PI);
    cairo_set_source_rgb(cr, MX_GRAPH_PANEL_R, MX_GRAPH_PANEL_G, MX_GRAPH_PANEL_B);
    cairo_fill_preserve(cr);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    cairo_set_line_width(cr, 1.2);
    cairo_stroke(cr);

    /* ── frame: top and bottom are walls, so draw them heavier ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G, MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, mx, my, mw, mh);
    cairo_stroke(cr);
    cairo_set_line_width(cr, 3.0);
    cairo_move_to(cr, mx, my);      cairo_line_to(cr, mx + mw, my);
    cairo_move_to(cr, mx, my + mh); cairo_line_to(cr, mx + mw, my + mh);
    cairo_stroke(cr);

    /* ── metre ticks along the channel, and the height ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    nice_range(0.0, L, &lo, &hi, &step);
    for (v = 0.0; v <= L + step * 1e-6; v += step)
    {
        snprintf(s, sizeof(s), "%g", round(v / step) * step);
        show_text_at(cr, mx + v / L * mw, my + mh + 15.0, s, 0.5);
    }
    show_text_at(cr, mx + mw / 2.0, my + mh + 31.0,
                 "Distance along the channel (m)  —  flow goes left to right", 0.5);
    snprintf(s, sizeof(s), "%g m", H);
    show_text_at(cr, mx - 6.0, my + 10.0, s, 1.0);
    show_text_at(cr, mx - 6.0, my + mh, "0", 1.0);

    /* ── map heading ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.5);
    show_text_at(cr, mx + mw / 2.0, my - 8.0, "Swirl in the flow (vorticity)", 0.5);

    /* ── colour key: red = counter-clockwise on top, blue = clockwise ── */
    for (k = 0; k < (int)mh; k++)
    {
        swirl_colour(1.0 - 2.0 * k / mh, &r, &g, &b);
        cairo_set_source_rgb(cr, r, g, b);
        cairo_rectangle(cr, bx, my + k, CG_BAR_W, 1.0);
        cairo_fill(cr);
    }
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G, MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, bx, my, CG_BAR_W, mh);
    cairo_stroke(cr);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 9.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    cairo_save(cr);
    cairo_translate(cr, bx + CG_BAR_W + 12.0, my + mh / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    show_text_at(cr, 0, 0, "clockwise  ←  spin  →  counter-clockwise", 0.5);
    cairo_restore(cr);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_channel_plot
   ═══════════════════════════════════════════════════════════ */

void draw_channel_plot(cairo_t *cr, int w, int h, const GraphData *gd)
{
    /* ── unpack the header ── */
    const double *hd     = gd->x_data;
    double        Re     = hd[CG_H_RE];
    double        cd     = hd[CG_H_CD];
    double        cl     = hd[CG_H_CL];
    double        dp     = hd[CG_H_DP];
    double        st     = hd[CG_H_ST];
    int           steady = hd[CG_H_STEADY] > 0.5;
    int           ref    = (int)hd[CG_H_REF];
    int           nx     = (int)hd[CG_H_NX];
    int           ny     = (int)hd[CG_H_NY];
    int           nh     = (int)hd[CG_H_NH];
    double        cdmax  = hd[CG_H_CDMAX];
    double        clmax  = hd[CG_H_CLMAX];

    /* ── the sections after the header (see channel_graph.h) ── */
    const double *swirl  = gd->x_data + CG_HDR;
    const double *solid  = gd->y_data + CG_HDR;
    const double *tv     = gd->x_data + CG_HDR + nx * ny;
    const double *cdv    = gd->y_data + CG_HDR + nx * ny;
    const double *clv    = gd->x_data + CG_HDR + nx * ny + nh;

    double     mw, mh, mx, my, pw, ph, py, lx, rx, lo, hi, err, err2;
    int        k0;
    double     ref_cd = NAN, ref_cl = NAN;
    GraphAxis  tAxis, cdAxis, clAxis;
    char       txt[220];

    if (nx < 2 || ny < 2 || nh < 2) return;

    /* ── background and title ── */
    cairo_set_source_rgb(cr, MX_GRAPH_BG_R, MX_GRAPH_BG_G, MX_GRAPH_BG_B);
    cairo_paint(cr);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TITLE_R, MX_GRAPH_TITLE_G, MX_GRAPH_TITLE_B);
    show_text_at(cr, w / 2.0, 22.0, "Channel Flow Past a Cylinder", 0.5);

    /* ── banner line 1: what came out ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    if (st > 0.0)
        snprintf(txt, sizeof(txt),
                 "Re = %.4g   •   %d × %d grid   •   drag %.4g (max %.4g)   •   "
                 "lift up to %.4g   •   vortices shed at Strouhal %.4g",
                 Re, nx, ny, cd, cdmax, clmax, st);
    else
        snprintf(txt, sizeof(txt),
                 "Re = %.4g   •   %d × %d grid   •   drag %.4g   •   lift %.4g   •   "
                 "pressure drop %.4g Pa",
                 Re, nx, ny, cd, cl, dp);
    show_text_at(cr, w / 2.0, 42.0, txt, 0.5);

    /* ── banner line 2: should you believe it? ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    if (!steady && st <= 0.0)
    {
        cairo_set_source_rgb(cr, MX_RED_R, MX_RED_G, MX_RED_B);
        snprintf(txt, sizeof(txt),
                 "Not settled yet — the flow was still changing.  "
                 "Raise \"Longest time\" and run again.");
    }
    else if (ref == 1)
    {
        err = fabs(cd - CG_DFG1_CD) / CG_DFG1_CD;
        ref_cd = CG_DFG1_CD;
        ref_cl = CG_DFG1_CL;
        if (err < CG_GOOD_MATCH)
            cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        else
            cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "%s DFG benchmark 2D-1 (Schäfer & Turek 1996) — drag is off by %.1f%%%s",
                 err < CG_GOOD_MATCH ? "Matches" : "Off from", err * 100.0,
                 err < CG_GOOD_MATCH ? "" : "; use more grid cells");
    }
    else if (ref == 2 && st > 0.0)
    {
        err  = fabs(cdmax - CG_DFG2_CDMAX) / CG_DFG2_CDMAX;
        err2 = fabs(st - CG_DFG2_ST) / CG_DFG2_ST;
        ref_cd = CG_DFG2_CDMAX;
        ref_cl = CG_DFG2_CLMAX;
        if (fmax(err, err2) < CG_GOOD_MATCH)
            cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        else
            cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        snprintf(txt, sizeof(txt),
                 "%s DFG benchmark 2D-2 (Schäfer & Turek 1996) — "
                 "max drag off by %.1f%%, shedding rate off by %.1f%%",
                 fmax(err, err2) < CG_GOOD_MATCH ? "Matches" : "Off from",
                 err * 100.0, err2 * 100.0);
    }
    else
    {
        cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
        snprintf(txt, sizeof(txt),
                 "No published answer to compare against (the DFG benchmark "
                 "covers the default channel at Re = 20 and 100)");
    }
    show_text_at(cr, w / 2.0, 60.0, txt, 0.5);

    /* ── legend: line = this solution, dashed = benchmark (if any) ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    {
        const double dash[] = { 8.0, 5.0 };
        double       lgx    = w / 2.0 - (isnan(ref_cd) ? 50.0 : 130.0);

        cairo_set_source_rgb(cr, MX_GRAPH_LINE_R, MX_GRAPH_LINE_G, MX_GRAPH_LINE_B);
        cairo_set_line_width(cr, 2.0);
        cairo_move_to(cr, lgx, 74.0);
        cairo_line_to(cr, lgx + 22.0, 74.0);
        cairo_stroke(cr);
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, lgx + 28.0, 78.0, "This solution", 0.0);

        if (!isnan(ref_cd))
        {
            cairo_save(cr);
            cairo_set_source_rgb(cr, MX_GRAPH_DOT_R, MX_GRAPH_DOT_G, MX_GRAPH_DOT_B);
            cairo_set_line_width(cr, 1.6);
            cairo_set_dash(cr, dash, 2, 0);
            cairo_move_to(cr, lgx + 130.0, 74.0);
            cairo_line_to(cr, lgx + 160.0, 74.0);
            cairo_stroke(cr);
            cairo_restore(cr);
            cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
            show_text_at(cr, lgx + 166.0,
                         78.0, ref == 2 ? "DFG benchmark peak" : "DFG benchmark", 0.0);
        }
    }

    /* ── swirl map: true channel proportions, as wide as fits ── */
    mw = w - CG_PAD_LEFT - CG_PAD_RIGHT - CG_BAR_GAP - CG_BAR_W - 24.0;
    mh = mw * hd[CG_H_H] / hd[CG_H_L];
    if (mh > (h - CG_PAD_TOP) * CG_MAP_FRAC)
    {
        /* too tall for its share: shrink and centre it instead */
        mh = (h - CG_PAD_TOP) * CG_MAP_FRAC;
        mw = mh * hd[CG_H_L] / hd[CG_H_H];
    }
    mx = CG_PAD_LEFT;
    my = CG_PAD_TOP;
    if (mw < 60.0 || mh < 20.0) return;     /* window dragged too small */

    draw_swirl_map(cr, mx, my, mw, mh, swirl, solid, nx, ny,
                   hd[CG_H_L], hd[CG_H_H], hd[CG_H_CX], hd[CG_H_CY], hd[CG_H_D]);

    /* ── two force panels under the map ── */
    py = my + mh + CG_MAP_GAP;
    ph = h - py - CG_PAD_BOTTOM;
    pw = (w - CG_PAD_LEFT - CG_PANEL_GAP - CG_PAD_RIGHT) / 2.0;
    if (ph < 60.0 || pw < 80.0) return;
    lx = CG_PAD_LEFT;
    rx = CG_PAD_LEFT + pw + CG_PANEL_GAP;

    /* axes: time from the data; the forces from everything after the
       start-up kick, reference line included.  The kick is still drawn —
       it just runs off the top instead of setting the scale */
    nice_range(tv[0], tv[nh - 1], &tAxis.lo, &tAxis.hi, &tAxis.step);
    for (k0 = 0; k0 < nh - 2 && tv[k0] < tv[0] + CG_SKIP_START * (tv[nh - 1] - tv[0]); k0++)
        ;
    graph_data_range(cdv + k0, nh - k0, &ref_cd, isnan(ref_cd) ? 0 : 1,
                     CG_RANGE_PAD, &lo, &hi);
    nice_range(lo, hi, &cdAxis.lo, &cdAxis.hi, &cdAxis.step);
    graph_data_range(clv + k0, nh - k0, &ref_cl, isnan(ref_cl) ? 0 : 1,
                     CG_RANGE_PAD, &lo, &hi);
    nice_range(lo, hi, &clAxis.lo, &clAxis.hi, &clAxis.step);

    graph_xy_panel(cr, lx, py, pw, ph,
                   "Drag — the push downstream",
                   "Time (s)", "Drag coefficient",
                   tv, cdv, nh, NULL, NULL, 0, ref_cd,
                   tAxis, cdAxis);

    graph_xy_panel(cr, rx, py, pw, ph,
                   "Lift — the push sideways",
                   "Time (s)", "Lift coefficient",
                   tv, clv, nh, NULL, NULL, 0, ref_cl,
                   tAxis, clAxis);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_channel
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_channel(void)
{
    double  hdr[CG_HDR] = { 0 };
    double *wf = NULL, *sf = NULL, *tv = NULL, *cdv = NULL, *clv = NULL;
    double *xs = NULL, *ys = NULL;
    int     n_w = 0, n_s = 0, n_t = 0, n_cd = 0, n_cl = 0;
    int     nx, ny, n, k, i;
    double  cellh;

    /* ── the big field arrives a page at a time; see graph_fetch_vector ── */
    wf  = graph_fetch_vector("channel_wfield", &n_w);
    sf  = graph_fetch_vector("channel_solid",  &n_s);
    tv  = graph_fetch_vector("channel_tv",     &n_t);
    cdv = graph_fetch_vector("channel_cdv",    &n_cd);
    clv = graph_fetch_vector("channel_clv",    &n_cl);

    /* ── shape: same arithmetic as channel.c, h = D / res ── */
    hdr[CG_H_L]  = graph_fetch_scalar("channel_L");
    hdr[CG_H_H]  = graph_fetch_scalar("channel_H");
    hdr[CG_H_CX] = graph_fetch_scalar("channel_cx");
    hdr[CG_H_CY] = graph_fetch_scalar("channel_cy");
    hdr[CG_H_D]  = graph_fetch_scalar("channel_D");
    cellh = (graph_fetch_scalar("channel_res") > 0.0)
          ? hdr[CG_H_D] / graph_fetch_scalar("channel_res") : 0.0;
    ny = (cellh > 0.0) ? (int)(hdr[CG_H_H] / cellh + 0.5) : 0;
    nx = (ny > 0) ? n_w / ny : 0;

    if (!wf || !sf || !tv || !cdv || !clv || ny < 2 || nx < 2 ||
        n_s != n_w || nx * ny != n_w || n_t < 2 || n_cd != n_t || n_cl != n_t)
    {
        app_status_set("No channel results yet — run Channel Flow (Cylinder) first");
        g_free(wf); g_free(sf); g_free(tv); g_free(cdv); g_free(clv);
        return;
    }

    /* ── scalars for the banner ── */
    hdr[CG_H_RE]     = graph_fetch_scalar("channel_Re");
    hdr[CG_H_CD]     = graph_fetch_scalar("channel_cd");
    hdr[CG_H_CL]     = graph_fetch_scalar("channel_cl");
    hdr[CG_H_DP]     = graph_fetch_scalar("channel_dp");
    hdr[CG_H_ST]     = graph_fetch_scalar("channel_st");
    hdr[CG_H_STEADY] = graph_fetch_scalar("channel_steady");
    hdr[CG_H_REF]    = graph_fetch_scalar("channel_ref");
    hdr[CG_H_CDMAX]  = graph_fetch_scalar("channel_cdmax");
    hdr[CG_H_CLMAX]  = graph_fetch_scalar("channel_clmax");
    hdr[CG_H_NX]     = nx;
    hdr[CG_H_NY]     = ny;
    hdr[CG_H_NH]     = n_t;

    /* ── pack: header, field, history (see channel_graph.h) ── */
    n  = CG_HDR + n_w + 2 * n_t;
    xs = g_new0(double, n);
    ys = g_new0(double, n);

    for (i = 0; i < CG_HDR; i++) xs[i] = hdr[i];
    k = CG_HDR;
    for (i = 0; i < n_w; i++, k++) { xs[k] = wf[i];  ys[k] = sf[i];  }
    for (i = 0; i < n_t; i++, k++) { xs[k] = tv[i];  ys[k] = cdv[i]; }
    for (i = 0; i < n_t; i++, k++) { xs[k] = clv[i]; }

    /* the window takes its own copies */
    graph_window_open_vars("Channel Flow Past a Cylinder", PLOT_CHANNEL,
                           "", "", xs, ys, n);

    g_free(wf); g_free(sf); g_free(tv); g_free(cdv); g_free(clv);
    g_free(xs); g_free(ys);
}
