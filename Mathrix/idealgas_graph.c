/*************************************************************
 * idealgas_graph.c — Ideal Gas Law Cairo diagram for Mathrix
 *
 * Left panel:  schematic container showing gas molecules,
 *              pressure arrows on walls, temperature label,
 *              and a piston with the applied force / pressure.
 *
 * Right panel: PV diagram with the operating point plotted on
 *              the PV = nRT isotherm for the current temperature,
 *              with labelled axes and an annotated dot.
 *
 * GraphData packing (set by graph_window_open_idealgas):
 *   x_data[0] = P          pressure
 *   x_data[1] = V          volume
 *   x_data[2] = n          moles / lbmol
 *   x_data[3] = T          temperature
 *   x_data[4] = R          gas constant (SI or US)
 *************************************************************/

#include "idealgas_graph.h"
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

/* number of points on the PV isotherm curve */
#define N_ISOTHERM  120

/* ── helper: draw a small filled circle ── */
static void fill_circle(cairo_t *cr, double x, double y, double r)
{
    cairo_arc(cr, x, y, r, 0, 2 * M_PI);
    cairo_fill(cr);
}

/* ── helper: draw centred text ── */
static void draw_centred(cairo_t *cr, double cx, double cy, const char *txt)
{
    cairo_text_extents_t te;
    cairo_text_extents(cr, txt, &te);
    cairo_move_to(cr, cx - te.width / 2.0, cy + te.height / 2.0);
    cairo_show_text(cr, txt);
}

/*************************************************************
 * LEFT PANEL — container schematic
 *************************************************************/
static void draw_container_panel(cairo_t *cr,
                                  double px, double py,
                                  double pw, double ph,
                                  double P, double V,
                                  double n, double T)
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
    draw_centred(cr, px + pw / 2.0, py + 16.0, "Gas Container");

    /* ── container box ── */
    double margin  = 28.0;
    double piston_h = 14.0;
    double cx0 = px + margin;
    double cy0 = py + 38.0;
    double cw  = pw - margin * 2.0;
    double ch  = ph - 38.0 - margin - piston_h - 20.0;
    if (ch < 40.0) ch = 40.0;

    /* container walls (left, bottom, right) */
    cairo_set_source_rgba(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G,
                          MX_SUBTEXT1_B, 0.9);
    cairo_set_line_width(cr, 2.5);
    cairo_move_to(cr, cx0, cy0);
    cairo_line_to(cr, cx0, cy0 + ch);
    cairo_line_to(cr, cx0 + cw, cy0 + ch);
    cairo_line_to(cr, cx0 + cw, cy0);
    cairo_stroke(cr);

    /* container fill (gas color — warm teal) */
    cairo_set_source_rgba(cr, MX_TEAL_R, MX_TEAL_G, MX_TEAL_B, 0.07);
    cairo_rectangle(cr, cx0, cy0, cw, ch);
    cairo_fill(cr);

    /* ── piston at top ── */
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.9);
    cairo_rectangle(cr, cx0, cy0, cw, piston_h);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, cx0, cy0, cw, piston_h);
    cairo_stroke(cr);

    /* piston hatch */
    cairo_set_line_width(cr, 0.8);
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.5);
    for (double hx = cx0 + 4; hx < cx0 + cw - 4; hx += 9)
    {
        cairo_move_to(cr, hx,     cy0 + 2);
        cairo_line_to(cr, hx + 7, cy0 + piston_h - 2);
        cairo_stroke(cr);
    }

    /* pressure arrow on piston (downward) */
    double arrow_len = 20.0;
    double ax = cx0 + cw / 2.0;
    double ay_top = cy0 - arrow_len - 4.0;
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, ax, ay_top);
    cairo_line_to(cr, ax, cy0);
    cairo_stroke(cr);
    /* arrowhead */
    cairo_move_to(cr, ax, cy0);
    cairo_line_to(cr, ax - 5, cy0 - 9);
    cairo_move_to(cr, ax, cy0);
    cairo_line_to(cr, ax + 5, cy0 - 9);
    cairo_stroke(cr);

    snprintf(label, sizeof(label), "P = %.4g", P);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax + 8, ay_top + te.height + 2);
        cairo_show_text(cr, label);
    }

    /* pressure arrows on left and right walls */
    double wall_arrow = 14.0;
    double mid_y = cy0 + ch / 2.0;

    /* left wall → pointing right */
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, cx0 + piston_h, mid_y);
    cairo_line_to(cr, cx0 + piston_h + wall_arrow, mid_y);
    cairo_stroke(cr);
    cairo_move_to(cr, cx0 + piston_h + wall_arrow, mid_y);
    cairo_line_to(cr, cx0 + piston_h + wall_arrow - 6, mid_y - 4);
    cairo_move_to(cr, cx0 + piston_h + wall_arrow, mid_y);
    cairo_line_to(cr, cx0 + piston_h + wall_arrow - 6, mid_y + 4);
    cairo_stroke(cr);

    /* right wall → pointing left */
    cairo_move_to(cr, cx0 + cw - piston_h, mid_y);
    cairo_line_to(cr, cx0 + cw - piston_h - wall_arrow, mid_y);
    cairo_stroke(cr);
    cairo_move_to(cr, cx0 + cw - piston_h - wall_arrow, mid_y);
    cairo_line_to(cr, cx0 + cw - piston_h - wall_arrow + 6, mid_y - 4);
    cairo_move_to(cr, cx0 + cw - piston_h - wall_arrow, mid_y);
    cairo_line_to(cr, cx0 + cw - piston_h - wall_arrow + 6, mid_y + 4);
    cairo_stroke(cr);

    /* ── gas molecules (dots scattered in container) ── */
    /* Use a deterministic pseudo-random layout based on n */
    int n_dots = (int)(n * 6.0 + 8.0);
    if (n_dots > 48) n_dots = 48;
    if (n_dots < 6)  n_dots = 6;

    /* seed-like constants for a fixed but visually pleasing scatter */
    static const double px_frac[] = {
        0.18, 0.45, 0.72, 0.30, 0.60, 0.85, 0.10, 0.55,
        0.77, 0.22, 0.40, 0.65, 0.88, 0.35, 0.50, 0.15,
        0.70, 0.25, 0.80, 0.42, 0.58, 0.92, 0.12, 0.67,
        0.33, 0.48, 0.82, 0.20, 0.75, 0.38, 0.53, 0.90,
        0.17, 0.62, 0.28, 0.73, 0.44, 0.86, 0.08, 0.57,
        0.31, 0.68, 0.95, 0.23, 0.79, 0.41, 0.14, 0.84
    };
    static const double py_frac[] = {
        0.20, 0.55, 0.35, 0.75, 0.15, 0.60, 0.40, 0.80,
        0.25, 0.70, 0.45, 0.30, 0.65, 0.85, 0.18, 0.50,
        0.72, 0.38, 0.58, 0.22, 0.78, 0.42, 0.62, 0.32,
        0.88, 0.12, 0.47, 0.67, 0.27, 0.82, 0.52, 0.17,
        0.70, 0.37, 0.92, 0.23, 0.57, 0.74, 0.44, 0.14,
        0.84, 0.29, 0.64, 0.48, 0.19, 0.76, 0.53, 0.33
    };

    double inner_top  = cy0 + piston_h + 6.0;
    double inner_bot  = cy0 + ch - 6.0;
    double inner_left = cx0 + 6.0;
    double inner_w    = cw - 12.0;
    double inner_h    = inner_bot - inner_top;

    /* Temperature-driven colour: blue (cold) → green → peach (hot) */
    double t_norm = fmin(1.0, fmax(0.0, (T - 200.0) / 1000.0));
    double mol_r  = MX_TEAL_R  + t_norm * (MX_PEACH_R - MX_TEAL_R);
    double mol_g  = MX_TEAL_G  + t_norm * (MX_PEACH_G - MX_TEAL_G);
    double mol_b  = MX_TEAL_B  + t_norm * (MX_PEACH_B - MX_TEAL_B);

    cairo_set_source_rgba(cr, mol_r, mol_g, mol_b, 0.85);
    for (int i = 0; i < n_dots; i++)
    {
        double dx = inner_left + px_frac[i % 48] * inner_w;
        double dy = inner_top  + py_frac[i % 48] * inner_h;
        fill_circle(cr, dx, dy, 3.5);
    }

    /* ── temperature label inside container ── */
    snprintf(label, sizeof(label), "T = %.4g", T);
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, cx0 + cw / 2.0 - te.width / 2.0,
                      cy0 + ch - 8.0);
        cairo_show_text(cr, label);
    }

    /* ── state variable table below container ── */
    double ty = cy0 + ch + 18.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    struct { const char *sym; double val; double r, g, b; } rows[] = {
        { "P",  P, MX_PEACH_R,   MX_PEACH_G,   MX_PEACH_B   },
        { "V",  V, MX_SAPPHIRE_R,MX_SAPPHIRE_G, MX_SAPPHIRE_B},
        { "n",  n, MX_GREEN_R,   MX_GREEN_G,   MX_GREEN_B   },
        { "T",  T, MX_YELLOW_R,  MX_YELLOW_G,  MX_YELLOW_B  },
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
 * RIGHT PANEL — PV diagram with isotherm
 *************************************************************/
static void draw_pv_panel(cairo_t *cr,
                           double px, double py,
                           double pw, double ph,
                           double P, double V,
                           double n, double T, double R)
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
    draw_centred(cr, px + pw / 2.0, py + 16.0, "PV Isotherm");

    /* ── axes layout ── */
    double pad_l = 76.0, pad_r = 20.0;   /* 76: room for tick labels + rotated Y label */
    double pad_t = 30.0, pad_b = 44.0;
    double ax = px + pad_l;
    double ay = py + pad_t;
    double aw = pw - pad_l - pad_r;
    double ah = ph - pad_t - pad_b;

    /* isotherm range: V from 0.1*V to 4*V */
    double v_min = fmax(1e-9, V * 0.15);
    double v_max = V * 4.5;
    double p_min = 0.0;

    /* P_max = nRT / v_min  (clamped sensibly) */
    double nRT   = n * R * T;
    if (nRT < 1e-30) nRT = 1.0;
    double p_max_iso = nRT / v_min;
    double p_max     = p_max_iso * 1.15;

    /* pixel-to-data transforms */
#define PX_OF_V(v)  (ax + ((v) - v_min) / (v_max - v_min) * aw)
#define PY_OF_P(p)  (ay + ah - ((p) - p_min) / (p_max - p_min) * ah)

    /* ── grid ── */
    cairo_set_line_width(cr, 0.5);
    cairo_set_source_rgba(cr, MX_GRAPH_GRID_R, MX_GRAPH_GRID_G,
                          MX_GRAPH_GRID_B, MX_GRAPH_GRID_A);
    int n_grid = 5;
    for (int i = 0; i <= n_grid; i++)
    {
        double gv = v_min + (v_max - v_min) * i / n_grid;
        double gx = PX_OF_V(gv);
        cairo_move_to(cr, gx, ay);
        cairo_line_to(cr, gx, ay + ah);
        cairo_stroke(cr);

        double gp = p_min + (p_max - p_min) * i / n_grid;
        double gy = PY_OF_P(gp);
        cairo_move_to(cr, ax, gy);
        cairo_line_to(cr, ax + aw, gy);
        cairo_stroke(cr);
    }

    /* ── isotherm curve (PV = nRT) ── */
    cairo_set_line_width(cr, 1.5);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.55);

    int started = 0;
    for (int i = 0; i <= N_ISOTHERM; i++)
    {
        double vi = v_min + (v_max - v_min) * i / N_ISOTHERM;
        double pi = nRT / vi;
        if (pi > p_max * 1.02 || pi < p_min) { started = 0; continue; }
        double gx = PX_OF_V(vi);
        double gy = PY_OF_P(pi);
        if (!started) { cairo_move_to(cr, gx, gy); started = 1; }
        else          cairo_line_to(cr, gx, gy);
    }
    cairo_stroke(cr);

    /* isotherm fill */
    started = 0;
    for (int i = 0; i <= N_ISOTHERM; i++)
    {
        double vi = v_min + (v_max - v_min) * i / N_ISOTHERM;
        double pi = nRT / vi;
        if (pi > p_max * 1.02 || pi < p_min) { started = 0; continue; }
        double gx = PX_OF_V(vi);
        double gy = PY_OF_P(pi);
        if (!started) { cairo_move_to(cr, gx, gy); started = 1; }
        else          cairo_line_to(cr, gx, gy);
    }
    cairo_line_to(cr, PX_OF_V(v_max), ay + ah);
    cairo_line_to(cr, PX_OF_V(v_min), ay + ah);
    cairo_close_path(cr);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, MX_GRAPH_FILL_A * 0.5);
    cairo_fill(cr);

    /* ── operating point ── */
    double op_x = PX_OF_V(V);
    double op_y = PY_OF_P(P);

    /* dashed crosshairs */
    cairo_set_line_width(cr, 0.8);
    cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
    cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.6);
    cairo_move_to(cr, op_x, ay + ah);
    cairo_line_to(cr, op_x, op_y);
    cairo_stroke(cr);
    cairo_move_to(cr, ax, op_y);
    cairo_line_to(cr, op_x, op_y);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* dot */
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    fill_circle(cr, op_x, op_y, 5.0);

    /* point label */
    snprintf(label, sizeof(label), "(%.3g, %.3g)", V, P);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    cairo_move_to(cr, op_x + 8, op_y - 6);
    cairo_show_text(cr, label);

    /* isotherm label */
    {
        double label_v = v_min + (v_max - v_min) * 0.72;
        double label_p = nRT / label_v * 0.88;
        if (label_p < p_max)
        {
            snprintf(label, sizeof(label), "T=%.4g", T);
            cairo_set_font_size(cr, 9.0);
            cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                                  MX_SAPPHIRE_B, 0.9);
            cairo_move_to(cr, PX_OF_V(label_v) + 4, PY_OF_P(label_p));
            cairo_show_text(cr, label);
        }
    }

    /* ── axes ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G,
                         MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);

    /* X axis ticks and labels */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    for (int i = 0; i <= n_grid; i++)
    {
        double vi = v_min + (v_max - v_min) * i / n_grid;
        double gx = PX_OF_V(vi);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, gx, ay + ah);
        cairo_line_to(cr, gx, ay + ah + 4);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.2g", vi);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, gx - te.width / 2.0, ay + ah + 14);
        cairo_show_text(cr, label);
    }

    /* Y axis ticks and labels */
    for (int i = 0; i <= n_grid; i++)
    {
        double pi = p_min + (p_max - p_min) * i / n_grid;
        double gy = PY_OF_P(pi);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, ax - 4, gy);
        cairo_line_to(cr, ax, gy);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.3g", pi);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax - te.width - 8, gy + te.height / 2.0);
        cairo_show_text(cr, label);
    }

    /* X axis label */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    draw_centred(cr, ax + aw / 2.0, ay + ah + 34.0, "V  (volume)");

    /* Y axis label (rotated) */
    cairo_save(cr);
    cairo_set_font_size(cr, 10.0);
    cairo_translate(cr, px + 16.0, ay + ah / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "P  (pressure)", &te);
        cairo_move_to(cr, -te.width / 2.0, te.height / 2.0);
        cairo_show_text(cr, "P  (pressure)");
    }
    cairo_restore(cr);

#undef PX_OF_V
#undef PY_OF_P
}

/*************************************************************
 * draw_idealgas_plot — public entry called by graph.c
 *************************************************************/
void draw_idealgas_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd)
{
    double P = gd->x_data[0];
    double V = gd->x_data[1];
    double n = gd->x_data[2];
    double T = gd->x_data[3];
    double R = gd->x_data[4];

    if (R < 1e-9) R = 8.314;
    if (T < 1e-9) T = 273.15;

    /* full background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);

    /* ── overall title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    draw_centred(cr, w / 2.0, 26.0, "Ideal Gas Law  PV = nRT");

    /* equation subtitle */
    char sub[64];
    snprintf(sub, sizeof(sub), "R = %.5g", R);
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    draw_centred(cr, w / 2.0, 40.0, sub);

    /* ── two panels ── */
    double pad = 12.0;
    double top = 50.0;
    double bot = 12.0;
    double mid = w / 2.0;

    draw_container_panel(cr,
                         pad, top,
                         mid - pad * 1.5, h - top - bot,
                         P, V, n, T);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_pv_panel(cr,
                  mid + pad * 0.5, top,
                  mid - pad * 1.5, h - top - bot,
                  P, V, n, T, R);
}

/*************************************************************
 * graph_window_open_idealgas — queries parse and opens window
 *************************************************************/
void graph_window_open_idealgas(void)
{
    char   buf[256];
    double P, V, n, T, R;
    double x_data[8] = {0};
    double y_dummy[1] = {0};

    pipe_transact("$gas_P\n", buf, sizeof(buf)); P = atof(buf);
    pipe_transact("$gas_V\n", buf, sizeof(buf)); V = atof(buf);
    pipe_transact("$gas_n\n", buf, sizeof(buf)); n = atof(buf);
    pipe_transact("$gas_T\n", buf, sizeof(buf)); T = atof(buf);

    /* Detect unit system: if P > 1e4 it's SI (Pa), otherwise US (psi) */
    R = (P > 1e4 || V < 10.0) ? 8.314 : 10.7316;

    x_data[0] = P;
    x_data[1] = V;
    x_data[2] = n;
    x_data[3] = T;
    x_data[4] = R;

    graph_window_open_vars("Ideal Gas Law", PLOT_IDEALGAS,
                           "", "",
                           x_data, y_dummy, 5);
}
