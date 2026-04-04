/*************************************************************
 * heatcond_graph.c — Heat Conduction Cairo diagram for Mathrix
 *
 * Left panel:  cross-section of a planar wall showing the
 *              hot and cold faces, colour-gradient fill
 *              representing the temperature profile, thickness
 *              dimension line, and heat flux arrows.
 *
 * Right panel: temperature profile plot T(x) = T1 - (T1-T2)/L * x
 *              with the operating parameters annotated and a
 *              filled area showing heat flow direction.
 *
 * GraphData packing (set by graph_window_open_heatcond):
 *   x_data[0] = k     thermal conductivity  (W/m·K or BTU·in/hr·ft²·°F)
 *   x_data[1] = A     cross-sectional area  (m² or ft²)
 *   x_data[2] = L     thickness             (m or ft)
 *   x_data[3] = T1    hot-face temperature
 *   x_data[4] = T2    cold-face temperature
 *   x_data[5] = Q     heat flow rate        (W or BTU/hr)
 *   x_data[6] = q     heat flux             (W/m² or BTU/hr·ft²)
 *************************************************************/
 
#include "heatcond_graph.h"
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
 
/* ── color aliases ── */
#define COL_BG_R     MX_BASE_R
#define COL_BG_G     MX_BASE_G
#define COL_BG_B     MX_BASE_B
#define COL_PANEL_R  MX_MANTLE_R
#define COL_PANEL_G  MX_MANTLE_G
#define COL_PANEL_B  MX_MANTLE_B
#define COL_TEXT_R   MX_TEXT_R
#define COL_TEXT_G   MX_TEXT_G
#define COL_TEXT_B   MX_TEXT_B
 
/* hot face: peach,  cold face: sapphire */
#define HOT_R  MX_PEACH_R
#define HOT_G  MX_PEACH_G
#define HOT_B  MX_PEACH_B
#define COLD_R MX_SAPPHIRE_R
#define COLD_G MX_SAPPHIRE_G
#define COLD_B MX_SAPPHIRE_B
 
/* number of vertical strips for the colour gradient fill */
#define N_STRIPS 80
 
/* ── helper: draw centred text ── */
static void hc_centred(cairo_t *cr, double cx, double cy, const char *txt)
{
    cairo_text_extents_t te;
    cairo_text_extents(cr, txt, &te);
    cairo_move_to(cr, cx - te.width / 2.0, cy + te.height / 2.0);
    cairo_show_text(cr, txt);
}
 
/* ── helper: horizontal dimension line with end ticks ── */
static void hc_dim_line(cairo_t *cr,
                         double x0, double x1, double y,
                         const char *lbl)
{
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, x0, y);
    cairo_line_to(cr, x1, y);
    cairo_stroke(cr);
    cairo_move_to(cr, x0, y - 5); cairo_line_to(cr, x0, y + 5); cairo_stroke(cr);
    cairo_move_to(cr, x1, y - 5); cairo_line_to(cr, x1, y + 5); cairo_stroke(cr);
 
    if (lbl)
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, lbl, &te);
        cairo_move_to(cr, (x0 + x1) / 2.0 - te.width / 2.0, y + 13);
        cairo_show_text(cr, lbl);
    }
}
 
/* ── helper: draw a horizontal heat-flux arrow ── */
static void hc_flux_arrow(cairo_t *cr,
                            double x, double y, double length,
                            double r, double g2, double b)
{
    cairo_set_source_rgb(cr, r, g2, b);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x + length, y);
    cairo_stroke(cr);
    /* arrowhead */
    double dir  = (length >= 0) ? 1.0 : -1.0;
    double tip  = x + length;
    double size = 8.0;
    cairo_move_to(cr, tip, y);
    cairo_line_to(cr, tip - dir * size, y - size * 0.4);
    cairo_move_to(cr, tip, y);
    cairo_line_to(cr, tip - dir * size, y + size * 0.4);
    cairo_stroke(cr);
}
 
/*************************************************************
 * LEFT PANEL — wall cross-section schematic
 *************************************************************/
static void draw_wall_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double k, double A, double L,
                             double T1, double T2,
                             double Q, double q)
{
    char label[64];
 
    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);
 
    /* panel title */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    hc_centred(cr, px + pw / 2.0, py + 16.0, "Wall Cross-Section");
 
    /* ── wall geometry ── */
    double margin  = 24.0;
    double arrow_w = 28.0;    /* space for flux arrows each side */
    double wx0  = px + margin + arrow_w;
    double wy0  = py + 36.0;
    double ww   = pw - margin * 2.0 - arrow_w * 2.0;
    double wh   = ph - 36.0 - 80.0;  /* 80 px reserved for labels below */
    if (ww < 30.0) ww = 30.0;
    if (wh < 60.0) wh = 60.0;
 
    /* ── colour-gradient fill (N_STRIPS vertical strips) ── */
    for (int i = 0; i < N_STRIPS; i++)
    {
        double t   = (double)i / N_STRIPS;
        double r   = HOT_R + t * (COLD_R - HOT_R);
        double g2  = HOT_G + t * (COLD_G - HOT_G);
        double b   = HOT_B + t * (COLD_B - HOT_B);
        double sx  = wx0 + t * ww;
        double sw  = ww / N_STRIPS + 1.0;   /* +1 to avoid hairline gaps */
        cairo_set_source_rgba(cr, r, g2, b, 0.25);
        cairo_rectangle(cr, sx, wy0, sw, wh);
        cairo_fill(cr);
    }
 
    /* wall outline */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 2.0);
    cairo_rectangle(cr, wx0, wy0, ww, wh);
    cairo_stroke(cr);
 
    /* hot face band */
    cairo_set_source_rgba(cr, HOT_R, HOT_G, HOT_B, 0.55);
    cairo_rectangle(cr, wx0, wy0, 6.0, wh);
    cairo_fill(cr);
 
    /* cold face band */
    cairo_set_source_rgba(cr, COLD_R, COLD_G, COLD_B, 0.55);
    cairo_rectangle(cr, wx0 + ww - 6.0, wy0, 6.0, wh);
    cairo_fill(cr);
 
    /* ── heat flux arrows (left of wall → right, several rows) ── */
    int n_arrows = 4;
    double arrow_len = arrow_w - 6.0;
    double mid_y = wy0 + wh / 2.0;
 
    for (int i = 0; i < n_arrows; i++)
    {
        double ay = wy0 + wh * (i + 1.0) / (n_arrows + 1.0);
 
        /* incoming arrow (left side) */
        hc_flux_arrow(cr,
                      wx0 - arrow_len - 4.0, ay,
                      arrow_len,
                      HOT_R, HOT_G, HOT_B);
 
        /* outgoing arrow (right side) */
        hc_flux_arrow(cr,
                      wx0 + ww + 4.0, ay,
                      arrow_len,
                      COLD_R, COLD_G, COLD_B);
    }
 
    /* ── face temperature labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
 
    snprintf(label, sizeof(label), "T\xe2\x82\x81=%.4g", T1);
    cairo_set_source_rgb(cr, HOT_R, HOT_G, HOT_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, wx0 - te.width / 2.0 + 3, wy0 - 6.0);
        cairo_show_text(cr, label);
    }
 
    snprintf(label, sizeof(label), "T\xe2\x82\x82=%.4g", T2);
    cairo_set_source_rgb(cr, COLD_R, COLD_G, COLD_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, wx0 + ww - te.width / 2.0 - 3, wy0 - 6.0);
        cairo_show_text(cr, label);
    }
 
    /* ── thickness dimension line ── */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    snprintf(label, sizeof(label), "L = %.4g", L);
    hc_dim_line(cr, wx0, wx0 + ww, wy0 + wh + 14.0, label);
 
    /* ── heat flow direction label ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    hc_centred(cr, px + pw / 2.0, wy0 + wh / 2.0 - 4.0,
               (T1 >= T2) ? "\xe2\x86\x92  Q flows left to right"
                          : "\xe2\x86\x90  Q flows right to left");
 
    /* ── results table ── */
    double ty = wy0 + wh + 38.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
 
    struct { const char *sym; double val; double r, g, b; } rows[] = {
        { "k",   k, MX_GREEN_R,   MX_GREEN_G,   MX_GREEN_B   },
        { "A",   A, MX_SUBTEXT1_R,MX_SUBTEXT1_G, MX_SUBTEXT1_B},
        { "Q",   Q, MX_PEACH_R,   MX_PEACH_G,   MX_PEACH_B   },
        { "q''", q, MX_MAUVE_R,   MX_MAUVE_G,   MX_MAUVE_B   },
    };
 
    for (int i = 0; i < 4; i++)
    {
        snprintf(label, sizeof(label), "%s = %.5g", rows[i].sym, rows[i].val);
        cairo_set_source_rgb(cr, rows[i].r, rows[i].g, rows[i].b);
        cairo_move_to(cr, px + margin, ty);
        cairo_show_text(cr, label);
        ty += 15.0;
    }
}
 
/*************************************************************
 * RIGHT PANEL — linear temperature profile T(x)
 *************************************************************/
static void draw_profile_panel(cairo_t *cr,
                                double px, double py,
                                double pw, double ph,
                                double k, double L,
                                double T1, double T2,
                                double Q, double q)
{
    char label[64];
 
    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);
 
    /* panel title */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    hc_centred(cr, px + pw / 2.0, py + 16.0, "Temperature Profile");
 
    /* ── axes layout ── */
    double pad_l = 52.0, pad_r = 20.0;
    double pad_t = 30.0, pad_b = 44.0;
    double ax = px + pad_l;
    double ay = py + pad_t;
    double aw = pw - pad_l - pad_r;
    double ah = ph - pad_t - pad_b;
 
    /* data range */
    double t_lo  = fmin(T1, T2) - fabs(T1 - T2) * 0.15;
    double t_hi  = fmax(T1, T2) + fabs(T1 - T2) * 0.15;
    if (fabs(t_hi - t_lo) < 1.0) { t_hi += 10.0; t_lo -= 10.0; }
 
#define PX_OF_X(x)  (ax + (x) / L * aw)
#define PY_OF_T(t)  (ay + ah - ((t) - t_lo) / (t_hi - t_lo) * ah)
 
    /* ── grid ── */
    int n_grid = 5;
    cairo_set_line_width(cr, 0.5);
    cairo_set_source_rgba(cr, MX_GRAPH_GRID_R, MX_GRAPH_GRID_G,
                          MX_GRAPH_GRID_B, MX_GRAPH_GRID_A);
    for (int i = 0; i <= n_grid; i++)
    {
        double xi = L * i / n_grid;
        cairo_move_to(cr, PX_OF_X(xi), ay);
        cairo_line_to(cr, PX_OF_X(xi), ay + ah);
        cairo_stroke(cr);
 
        double ti = t_lo + (t_hi - t_lo) * i / n_grid;
        cairo_move_to(cr, ax, PY_OF_T(ti));
        cairo_line_to(cr, ax + aw, PY_OF_T(ti));
        cairo_stroke(cr);
    }
 
    /* ── filled gradient area under T(x) line ── */
    /* left fill (hot colour) fading to cold colour */
    for (int i = 0; i < N_STRIPS; i++)
    {
        double t    = (double)i / N_STRIPS;
        double xi   = t * L;
        double xi1  = (t + 1.0 / N_STRIPS) * L;
        double Ti   = T1 + (T2 - T1) * t;
        double Ti1  = T1 + (T2 - T1) * (t + 1.0 / N_STRIPS);
        double r    = HOT_R + t * (COLD_R - HOT_R);
        double g2   = HOT_G + t * (COLD_G - HOT_G);
        double b    = HOT_B + t * (COLD_B - HOT_B);
 
        cairo_set_source_rgba(cr, r, g2, b, 0.18);
        cairo_move_to(cr, PX_OF_X(xi),  PY_OF_T(Ti));
        cairo_line_to(cr, PX_OF_X(xi1), PY_OF_T(Ti1));
        cairo_line_to(cr, PX_OF_X(xi1), ay + ah);
        cairo_line_to(cr, PX_OF_X(xi),  ay + ah);
        cairo_close_path(cr);
        cairo_fill(cr);
    }
 
    /* ── T(x) line ── */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 2.5);
    cairo_move_to(cr, PX_OF_X(0), PY_OF_T(T1));
    cairo_line_to(cr, PX_OF_X(L), PY_OF_T(T2));
    cairo_stroke(cr);
 
    /* ── endpoint dots ── */
    cairo_set_source_rgb(cr, HOT_R, HOT_G, HOT_B);
    cairo_arc(cr, PX_OF_X(0), PY_OF_T(T1), 5.0, 0, 2 * M_PI);
    cairo_fill(cr);
 
    cairo_set_source_rgb(cr, COLD_R, COLD_G, COLD_B);
    cairo_arc(cr, PX_OF_X(L), PY_OF_T(T2), 5.0, 0, 2 * M_PI);
    cairo_fill(cr);
 
    /* ── slope annotation ── */
    {
        double slope = (T2 - T1) / L;
        double mid_x = L / 2.0;
        double mid_t = T1 + (T2 - T1) * 0.5;
        snprintf(label, sizeof(label), "dT/dx = %.3g", slope);
        cairo_set_font_size(cr, 9.5);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, PX_OF_X(mid_x) - te.width / 2.0,
                      PY_OF_T(mid_t) - 10.0);
        cairo_show_text(cr, label);
    }
 
    /* ── Q and q'' labels ── */
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
 
    snprintf(label, sizeof(label), "Q = %.4g", Q);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_move_to(cr, ax + 8, ay + 16);
    cairo_show_text(cr, label);
 
    snprintf(label, sizeof(label), "q'' = %.4g", q);
    cairo_set_source_rgb(cr, MX_MAUVE_R, MX_MAUVE_G, MX_MAUVE_B);
    cairo_move_to(cr, ax + 8, ay + 30);
    cairo_show_text(cr, label);
 
    /* ── Fourier's law label — same row as X label, right-aligned ── */
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    {
        const char *fl = "Q = kA(T1-T2)/L";
        cairo_text_extents_t fle;
        cairo_text_extents(cr, fl, &fle);
        cairo_move_to(cr, ax + aw - fle.width - 4, ay + ah + 26.0);
        cairo_show_text(cr, fl);
    }
 
    /* ── axes ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G,
                         MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);
 
    /* X ticks */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    for (int i = 0; i <= n_grid; i++)
    {
        double xi = L * i / n_grid;
        double gx = PX_OF_X(xi);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, gx, ay + ah); cairo_line_to(cr, gx, ay + ah + 4); cairo_stroke(cr);
 
        snprintf(label, sizeof(label), "%.2g", xi);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, gx - te.width / 2.0, ay + ah + 14); cairo_show_text(cr, label);
    }
 
    /* Y ticks */
    for (int i = 0; i <= n_grid; i++)
    {
        double ti = t_lo + (t_hi - t_lo) * i / n_grid;
        double gy = PY_OF_T(ti);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, ax - 4, gy); cairo_line_to(cr, ax, gy); cairo_stroke(cr);
 
        snprintf(label, sizeof(label), "%.4g", ti);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax - te.width - 6, gy + te.height / 2.0);
        cairo_show_text(cr, label);
    }
 
    /* X label */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    hc_centred(cr, ax + aw / 2.0, ay + ah + 26.0, "x  (position)");
 
    /* Y label (rotated) */
    cairo_save(cr);
    cairo_set_font_size(cr, 10.0);
    cairo_translate(cr, px + 12.0, ay + ah / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "T  (temperature)", &te);
        cairo_move_to(cr, -te.width / 2.0, te.height / 2.0);
        cairo_show_text(cr, "T  (temperature)");
    }
    cairo_restore(cr);
 
#undef PX_OF_X
#undef PY_OF_T
}
 
/*************************************************************
 * draw_heatcond_plot — public entry called by graph.c
 *************************************************************/
void draw_heatcond_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd)
{
    double k  = gd->x_data[0];
    double A  = gd->x_data[1];
    double L  = gd->x_data[2];
    double T1 = gd->x_data[3];
    double T2 = gd->x_data[4];
    double Q  = gd->x_data[5];
    double q  = gd->x_data[6];
 
    if (L < 1e-12) L = 1.0;
 
    /* full background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);
 
    /* ── overall title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    hc_centred(cr, w / 2.0, 26.0, "Fourier's Law of Heat Conduction");
 
    char sub[64];
    snprintf(sub, sizeof(sub), "Q = kA(T\xe2\x82\x81 \xe2\x88\x92 T\xe2\x82\x82)/L     k = %.4g", k);
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    hc_centred(cr, w / 2.0, 50.0, sub);
 
    /* ── two panels ── */
    double pad = 12.0;
    double top = 50.0;
    double bot = 12.0;
    double mid = w / 2.0;
 
    draw_wall_panel(cr,
                    pad, top,
                    mid - pad * 1.5, h - top - bot,
                    k, A, L, T1, T2, Q, q);
 
    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);
 
    draw_profile_panel(cr,
                       mid + pad * 0.5, top,
                       mid - pad * 1.5, h - top - bot,
                       k, L, T1, T2, Q, q);
}
 
/*************************************************************
 * graph_window_open_heatcond — queries parse and opens window
 *************************************************************/
void graph_window_open_heatcond(void)
{
    char   buf[256];
    double k, A, L, T1, T2, Q, q;
    double x_data[8] = {0};
    double y_dummy[1] = {0};

    pipe_transact("$heatcond_k\n",  buf, sizeof(buf)); k  = atof(buf);
    pipe_transact("$heatcond_A\n",  buf, sizeof(buf)); A  = atof(buf);
    pipe_transact("$heatcond_L\n",  buf, sizeof(buf)); L  = atof(buf);
    pipe_transact("$heatcond_T1\n", buf, sizeof(buf)); T1 = atof(buf);
    pipe_transact("$heatcond_T2\n", buf, sizeof(buf)); T2 = atof(buf);
    pipe_transact("$heatcond_Q\n",  buf, sizeof(buf)); Q  = atof(buf);
    pipe_transact("$heatcond_q\n",  buf, sizeof(buf)); q  = atof(buf);
 
    x_data[0] = k;
    x_data[1] = A;
    x_data[2] = L;
    x_data[3] = T1;
    x_data[4] = T2;
    x_data[5] = Q;
    x_data[6] = q;
 
    graph_window_open_vars("Heat Conduction", PLOT_HEATCOND,
                           "", "",
                           x_data, y_dummy, 7);}
 