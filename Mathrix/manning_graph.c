/*************************************************************
 * manning_graph.c — Manning's Equation Cairo diagram for Mathrix
 *
 * Left panel:  trapezoidal open-channel cross-section showing
 *              water surface, channel walls, flow-direction arrow,
 *              hydraulic radius annotation, slope exaggeration,
 *              and key dimension labels.
 *
 * Right panel: horizontal bar chart showing the three Manning's
 *              equation factors (k/n, R^2/3, S^1/2) and how
 *              they multiply to give V, plus optional Q and Fr
 *              results annotated below.
 *
 * GraphData packing (set by graph_window_open_manning):
 *   x_data[0] = n       roughness coefficient
 *   x_data[1] = R       hydraulic radius
 *   x_data[2] = S       channel slope
 *   x_data[3] = A       flow area   (0 if not supplied)
 *   x_data[4] = D       hydraulic depth (0 if not supplied)
 *   x_data[5] = k       unit conv factor (1.0 SI, 1.486 US)
 *   y_data[0] = V       flow velocity
 *   y_data[1] = Q       discharge      (0 if not computed)
 *   y_data[2] = Fr      Froude number  (0 if not computed)
 *************************************************************/

#include "manning_graph.h"
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

/* water: sapphire tinted */
#define WATER_R  MX_SAPPHIRE_R
#define WATER_G  MX_SAPPHIRE_G
#define WATER_B  MX_SAPPHIRE_B

/* ── helper: centred text ── */
static void mn_centred(cairo_t *cr, double cx, double cy, const char *txt)
{
    cairo_text_extents_t te;
    cairo_text_extents(cr, txt, &te);
    cairo_move_to(cr, cx - te.width / 2.0, cy + te.height / 2.0);
    cairo_show_text(cr, txt);
}

/* ── helper: right-aligned text ── */
static void mn_right(cairo_t *cr, double rx, double cy, const char *txt)
{
    cairo_text_extents_t te;
    cairo_text_extents(cr, txt, &te);
    cairo_move_to(cr, rx - te.width, cy + te.height / 2.0);
    cairo_show_text(cr, txt);
}

/* ── helper: horizontal dimension line ── */
static void mn_dim_h(cairo_t *cr,
                      double x0, double x1, double y,
                      const char *lbl)
{
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, x0, y); cairo_line_to(cr, x1, y); cairo_stroke(cr);
    cairo_move_to(cr, x0, y - 4); cairo_line_to(cr, x0, y + 4); cairo_stroke(cr);
    cairo_move_to(cr, x1, y - 4); cairo_line_to(cr, x1, y + 4); cairo_stroke(cr);
    if (lbl) mn_centred(cr, (x0 + x1) / 2.0, y + 12, lbl);
}

/*************************************************************
 * LEFT PANEL — channel cross-section
 *************************************************************/
static void draw_channel_panel(cairo_t *cr,
                                double px, double py,
                                double pw, double ph,
                                double n, double R, double S,
                                double A, double D, double k,
                                double V, double Q, double Fr)
{
    char label[80];
    int  us = (k > 1.0);

    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* panel title */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    mn_centred(cr, px + pw / 2.0, py + 16.0, "Channel Cross-Section");

    /* ── channel geometry ── */
    double margin  = 24.0;
    double ch_cx   = px + pw / 2.0;          /* channel centre x        */
    double ch_top  = py + 38.0;              /* top of drawing area     */
    double ch_bot  = py + ph - 100.0;        /* bottom (channel invert) */
    double ch_h    = ch_bot - ch_top;        /* total drawing height    */
    double ch_w    = pw - margin * 2.5;      /* channel top width       */
    double slope_w = ch_w * 0.18;            /* side slope width        */

    /* channel invert corners */
    double inv_left  = ch_cx - ch_w / 2.0 + slope_w;
    double inv_right = ch_cx + ch_w / 2.0 - slope_w;

    /* water depth — fixed fraction of channel height for display */
    double water_frac = 0.62;
    double water_y    = ch_top + ch_h * (1.0 - water_frac);  /* water surface y */

    /* water surface corners (trapezoidal sides) */
    double ws_left  = ch_cx - ch_w / 2.0 + slope_w * (1.0 - water_frac);
    double ws_right = ch_cx + ch_w / 2.0 - slope_w * (1.0 - water_frac);

    /* ── channel walls (trapezoid outline) ── */
    /* left bank */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 2.5);
    cairo_move_to(cr, ch_cx - ch_w / 2.0, ch_top);
    cairo_line_to(cr, inv_left,  ch_bot);
    cairo_line_to(cr, inv_right, ch_bot);
    cairo_line_to(cr, ch_cx + ch_w / 2.0, ch_top);
    cairo_stroke(cr);

    /* channel invert hatch */
    cairo_set_line_width(cr, 0.8);
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.6);
    for (double hx = inv_left; hx < inv_right; hx += 10.0)
    {
        cairo_move_to(cr, hx,        ch_bot);
        cairo_line_to(cr, hx + 7.0,  ch_bot + 8.0);
        cairo_stroke(cr);
    }

    /* ── water body ── */
    cairo_set_source_rgba(cr, WATER_R, WATER_G, WATER_B, 0.18);
    cairo_move_to(cr, ws_left,  water_y);
    cairo_line_to(cr, ws_right, water_y);
    cairo_line_to(cr, inv_right, ch_bot);
    cairo_line_to(cr, inv_left,  ch_bot);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* water surface line */
    cairo_set_source_rgba(cr, WATER_R, WATER_G, WATER_B, 0.85);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, ws_left,  water_y);
    cairo_line_to(cr, ws_right, water_y);
    cairo_stroke(cr);

    /* ── flow arrow (horizontal, inside water) ── */
    {
        double ay   = water_y + (ch_bot - water_y) * 0.45;
        double ax0  = ch_cx - ch_w * 0.18;
        double ax1  = ch_cx + ch_w * 0.18;
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_set_line_width(cr, 2.0);
        cairo_move_to(cr, ax0, ay);
        cairo_line_to(cr, ax1, ay);
        cairo_stroke(cr);
        /* arrowhead */
        cairo_move_to(cr, ax1, ay);
        cairo_line_to(cr, ax1 - 10, ay - 5);
        cairo_move_to(cr, ax1, ay);
        cairo_line_to(cr, ax1 - 10, ay + 5);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "V = %.4g %s",
                 V, us ? "ft/s" : "m/s");
        cairo_set_font_size(cr, 9.5);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        mn_centred(cr, ch_cx, ay - 12, label);
    }

    /* ── slope indicator (small diagonal arrow at top-right) ── */
    {
        double sx  = ch_cx + ch_w * 0.30;
        double sy  = water_y - 18.0;
        double slen = 28.0;
        double sang = atan(S * 80.0);   /* exaggerated for visibility */
        if (sang > 0.35) sang = 0.35;
        double sdx = cos(sang) * slen;
        double sdy = sin(sang) * slen;

        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_set_line_width(cr, 1.5);
        cairo_move_to(cr, sx, sy);
        cairo_line_to(cr, sx + sdx, sy + sdy);
        cairo_stroke(cr);
        cairo_move_to(cr, sx + sdx, sy + sdy);
        cairo_line_to(cr, sx + sdx - 8, sy + sdy - 3);
        cairo_move_to(cr, sx + sdx, sy + sdy);
        cairo_line_to(cr, sx + sdx - 3, sy + sdy - 8);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "S=%.4g", S);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_move_to(cr, sx + sdx + 4, sy + sdy);
        cairo_show_text(cr, label);
    }

    /* ── hydraulic radius annotation ── */
    {
        double ry = ch_bot - (ch_bot - water_y) * 0.30;
        cairo_set_source_rgba(cr, MX_MAUVE_R, MX_MAUVE_G, MX_MAUVE_B, 0.8);
        cairo_set_line_width(cr, 1.0);
        cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
        cairo_move_to(cr, inv_left + 4, ry);
        cairo_line_to(cr, inv_right - 4, ry);
        cairo_stroke(cr);
        cairo_set_dash(cr, NULL, 0, 0);

        snprintf(label, sizeof(label), "R = %.4g %s", R, us ? "ft" : "m");
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_MAUVE_R, MX_MAUVE_G, MX_MAUVE_B);
        mn_centred(cr, ch_cx, ry + 12, label);
    }

    /* ── n label ── */
    snprintf(label, sizeof(label), "n = %.4g", n);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    mn_centred(cr, ch_cx, ch_top + 14, label);

    /* ── results table below channel ── */
    double ty = ch_bot + 18.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    struct { const char *sym; double val; double r, g, b; int show; } rows[] = {
        { "V", V,  MX_GREEN_R,   MX_GREEN_G,   MX_GREEN_B,   1        },
        { "Q", Q,  MX_SAPPHIRE_R,MX_SAPPHIRE_G,MX_SAPPHIRE_B, Q  > 0  },
        { "Fr",Fr, MX_YELLOW_R,  MX_YELLOW_G,  MX_YELLOW_B,  Fr > 0  },
    };

    for (int i = 0; i < 3; i++)
    {
        if (!rows[i].show) continue;
        snprintf(label, sizeof(label), "%s = %.5g", rows[i].sym, rows[i].val);
        cairo_set_source_rgb(cr, rows[i].r, rows[i].g, rows[i].b);
        cairo_move_to(cr, px + margin, ty);
        cairo_show_text(cr, label);
        ty += 15.0;
    }

    /* Froude regime label */
    if (Fr > 0)
    {
        const char *regime = Fr < 1.0 ? "subcritical" :
                             Fr > 1.0 ? "supercritical" : "critical";
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_move_to(cr, px + margin, ty);
        cairo_show_text(cr, regime);
    }
}

/*************************************************************
 * RIGHT PANEL — Manning's factor bar chart
 *
 * Shows three horizontal bars proportional to:
 *   factor 1: k/n
 *   factor 2: R^(2/3)
 *   factor 3: S^(1/2)
 * and their product V = (k/n) * R^(2/3) * S^(1/2)
 *************************************************************/
static void draw_factors_panel(cairo_t *cr,
                                double px, double py,
                                double pw, double ph,
                                double n, double R, double S,
                                double A, double D, double k,
                                double V, double Q, double Fr)
{
    char label[80];
    int  us = (k > 1.0);

    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* panel title */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    mn_centred(cr, px + pw / 2.0, py + 16.0, "Equation Factors");

    /* ── factor values ── */
    double f1 = k / n;                          /* k/n             */
    double f2 = pow(R, 2.0 / 3.0);             /* R^(2/3)         */
    double f3 = sqrt(S);                        /* S^(1/2)         */
    double f_max = fmax(f1, fmax(f2, f3));
    if (f_max < 1e-12) f_max = 1.0;

    /* ── bar layout ── */
    double pad_l  = 80.0;
    double pad_r  = 16.0;
    double pad_t  = 32.0;
    double pad_b  = 140.0;   /* room for results below */
    double bx     = px + pad_l;
    double bw_max = pw - pad_l - pad_r;
    double bar_h  = 22.0;
    double gap    = 14.0;

    struct {
        const char *name;
        const char *expr;
        double      val;
        double      r, g, b;
    } factors[] = {
        { "k/n",     "k/n",      f1, MX_PEACH_R,   MX_PEACH_G,   MX_PEACH_B   },
        { "R^(2/3)", "R^(2/3)",  f2, MX_MAUVE_R,   MX_MAUVE_G,   MX_MAUVE_B   },
        { "S^(1/2)", "S^(1/2)",  f3, MX_SAPPHIRE_R,MX_SAPPHIRE_G,MX_SAPPHIRE_B},
    };

    double by = py + pad_t + 16.0;

    for (int i = 0; i < 3; i++)
    {
        double bar_w = (factors[i].val / f_max) * bw_max;
        if (bar_w < 2.0) bar_w = 2.0;

        /* bar fill */
        cairo_set_source_rgba(cr, factors[i].r, factors[i].g,
                              factors[i].b, 0.65);
        cairo_rectangle(cr, bx, by, bar_w, bar_h);
        cairo_fill(cr);

        /* bar outline */
        cairo_set_source_rgb(cr, factors[i].r, factors[i].g, factors[i].b);
        cairo_set_line_width(cr, 1.2);
        cairo_rectangle(cr, bx, by, bar_w, bar_h);
        cairo_stroke(cr);

        /* factor name label (left of bar) */
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, factors[i].r, factors[i].g, factors[i].b);
        mn_right(cr, bx - 6, by + bar_h / 2.0, factors[i].expr);

        /* value label — centred inside bar, dark bg colour for contrast */
        snprintf(label, sizeof(label), "%.4g", factors[i].val);
        cairo_set_font_size(cr, 9.5);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        {
            cairo_text_extents_t te;
            cairo_text_extents(cr, label, &te);
            double lx = bx + bar_w / 2.0 - te.width / 2.0;
            double ly = by + bar_h / 2.0 + te.height / 2.0;
            /* if bar is too narrow to fit, draw just to the right */
            if (te.width + 8 > bar_w)
            {
                cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
                cairo_move_to(cr, bx + bar_w + 4, ly);
            }
            else
            {
                cairo_set_source_rgb(cr, MX_BASE_R, MX_BASE_G, MX_BASE_B);
                cairo_move_to(cr, lx, ly);
            }
            cairo_show_text(cr, label);
        }

        by += bar_h + gap;
    }

    /* ── separator line ── */
    by += 4.0;
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, bx - 4, by);
    cairo_line_to(cr, bx + bw_max, by);
    cairo_stroke(cr);
    by += 10.0;

    /* ── V result bar ── */
    {
        double v_bar_w = bw_max * 0.85;   /* fixed reference width for V */

        cairo_set_source_rgba(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B, 0.70);
        cairo_rectangle(cr, bx, by, v_bar_w, bar_h);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_set_line_width(cr, 1.5);
        cairo_rectangle(cr, bx, by, v_bar_w, bar_h);
        cairo_stroke(cr);

        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_BOLD);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        mn_right(cr, bx - 6, by + bar_h / 2.0, "V");

        /* V value centred inside bar */
        snprintf(label, sizeof(label), "%.5g %s", V, us ? "ft/s" : "m/s");
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        {
            cairo_text_extents_t te;
            cairo_text_extents(cr, label, &te);
            double lx = bx + v_bar_w / 2.0 - te.width / 2.0;
            double ly = by + bar_h / 2.0 + te.height / 2.0;
            if (te.width + 8 > v_bar_w)
            {
                cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
                cairo_move_to(cr, bx + v_bar_w + 4, ly);
            }
            else
            {
                cairo_set_source_rgb(cr, MX_BASE_R, MX_BASE_G, MX_BASE_B);
                cairo_move_to(cr, lx, ly);
            }
            cairo_show_text(cr, label);
        }

        by += bar_h + gap + 8.0;
    }

    /* ── optional Q and Fr results ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    if (Q > 0)
    {
        snprintf(label, sizeof(label), "Q = %.5g %s",
                 Q, us ? "cfs" : "m3/s");
        cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
        cairo_move_to(cr, bx, by);
        cairo_show_text(cr, label);
        by += 18.0;
    }

    if (Fr > 0)
    {
        snprintf(label, sizeof(label), "Fr = %.4g  (%s)",
                 Fr,
                 Fr < 1.0 ? "subcritical" :
                 Fr > 1.0 ? "supercritical" : "critical");
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_move_to(cr, bx, by);
        cairo_show_text(cr, label);
        by += 18.0;
    }

    /* ── Manning's equation reminder ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    {
        const char *eq = us ? "V = (1.486/n) R^(2/3) S^(1/2)"
                            : "V = (1/n) R^(2/3) S^(1/2)";
        cairo_text_extents_t te;
        cairo_text_extents(cr, eq, &te);
        cairo_move_to(cr, px + pw - te.width - 10,
                      py + ph - 14);
        cairo_show_text(cr, eq);
    }
}

/*************************************************************
 * draw_manning_plot — public entry called by graph.c
 *************************************************************/
void draw_manning_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd)
{
    double n  = gd->x_data[0];
    double R  = gd->x_data[1];
    double S  = gd->x_data[2];
    double A  = gd->x_data[3];
    double D  = gd->x_data[4];
    double k  = gd->x_data[5];
    double V  = gd->y_data[0];
    double Q  = gd->y_data[1];
    double Fr = gd->y_data[2];

    if (k  < 0.5)  k  = 1.0;
    if (n  < 1e-9) n  = 0.013;
    if (R  < 1e-9) R  = 1.0;
    if (S  < 1e-9) S  = 0.001;

    /* full background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);

    /* ── overall title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    mn_centred(cr, w / 2.0, 26.0, "Manning's Equation");

    /* unit system subtitle */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    mn_centred(cr, w / 2.0, 40.0,
               k > 1.0 ? "US customary  (ft, ft/s, cfs)"
                       : "SI  (m, m/s, m3/s)");

    /* ── two panels ── */
    double pad = 12.0;
    double top = 50.0;
    double bot = 12.0;
    double mid = w / 2.0;

    draw_channel_panel(cr,
                       pad, top,
                       mid - pad * 1.5, h - top - bot,
                       n, R, S, A, D, k, V, Q, Fr);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_factors_panel(cr,
                       mid + pad * 0.5, top,
                       mid - pad * 1.5, h - top - bot,
                       n, R, S, A, D, k, V, Q, Fr);
}

/*************************************************************
 * graph_window_open_manning — queries parse and opens window
 *************************************************************/
void graph_window_open_manning(void)
{
    char   buf[256];
    double n, R, S, A, D, k, V, Q, Fr;
    double x_data[8] = {0};
    double y_data[4] = {0};
    double y_dummy[1] = {0};

    pipe_transact("$manning_n\n",  buf, sizeof(buf)); n  = atof(buf);
    pipe_transact("$manning_R\n",  buf, sizeof(buf)); R  = atof(buf);
    pipe_transact("$manning_S\n",  buf, sizeof(buf)); S  = atof(buf);
    pipe_transact("$manning_A\n",  buf, sizeof(buf)); A  = atof(buf);
    pipe_transact("$manning_D\n",  buf, sizeof(buf)); D  = atof(buf);
    pipe_transact("$manning_k\n",  buf, sizeof(buf)); k  = atof(buf);
    pipe_transact("$manning_V\n",  buf, sizeof(buf)); V  = atof(buf);
    pipe_transact("$manning_Q\n",  buf, sizeof(buf)); Q  = atof(buf);
    pipe_transact("$manning_Fr\n", buf, sizeof(buf)); Fr = atof(buf);

    /* k defaults to 1.0 (SI) if not stored */
    if (k < 0.5) k = 1.0;

    x_data[0] = n;
    x_data[1] = R;
    x_data[2] = S;
    x_data[3] = A;
    x_data[4] = D;
    x_data[5] = k;

    y_data[0] = V;
    y_data[1] = Q;
    y_data[2] = Fr;

    graph_window_open_vars("Manning's Equation", PLOT_MANNING,
                           "", "",
                           x_data, y_data, 3);
}
