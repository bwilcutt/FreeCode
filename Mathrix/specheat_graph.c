/*************************************************************
 * specheat_graph.c — Specific Heat Cairo diagram for Mathrix
 *
 * Left panel:  calorimeter schematic — insulated cup with a
 *              thermometer, showing the material mass, the
 *              initial and final temperatures, and a heat-
 *              source arrow at the bottom (or drain arrow if
 *              dT is negative).
 *
 * Right panel: stacked energy bar chart — one bar for the
 *              current substance showing the contributions
 *              from mass, specific heat, and temperature
 *              change, with the total Q labelled at the top.
 *              A second "reference" bar for water is drawn
 *              for comparison when c != c_water.
 *
 * GraphData packing (set by graph_window_open_specheat):
 *   x_data[0] = Q     heat energy
 *   x_data[1] = m     mass
 *   x_data[2] = c     specific heat
 *   x_data[3] = dT    temperature change
 *************************************************************/

#include "specheat_graph.h"
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

/* Water reference specific heat (SI, J/kg·K) */
#define C_WATER  4186.0

/* ── helper: centred text ── */
static void sh_centred(cairo_t *cr, double cx, double cy, const char *txt)
{
    cairo_text_extents_t te;
    cairo_text_extents(cr, txt, &te);
    cairo_move_to(cr, cx - te.width / 2.0, cy + te.height / 2.0);
    cairo_show_text(cr, txt);
}

/* ── helper: filled rounded rect ── */
static void sh_rounded_rect(cairo_t *cr,
                              double x, double y,
                              double w, double h, double r)
{
    cairo_move_to(cr,  x + r, y);
    cairo_line_to(cr,  x + w - r, y);
    cairo_arc(cr, x + w - r, y + r, r, -M_PI/2, 0);
    cairo_line_to(cr,  x + w, y + h - r);
    cairo_arc(cr, x + w - r, y + h - r, r, 0, M_PI/2);
    cairo_line_to(cr,  x + r, y + h);
    cairo_arc(cr, x + r, y + h - r, r, M_PI/2, M_PI);
    cairo_line_to(cr,  x, y + r);
    cairo_arc(cr, x + r, y + r, r, M_PI, -M_PI/2);
    cairo_close_path(cr);
}

/*************************************************************
 * LEFT PANEL — calorimeter schematic
 *************************************************************/
static void draw_calorimeter_panel(cairo_t *cr,
                                    double px, double py,
                                    double pw, double ph,
                                    double Q, double m,
                                    double c, double dT)
{
    char label[80];
    int  heating = (dT >= 0);

    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* panel title */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    sh_centred(cr, px + pw / 2.0, py + 16.0, "Calorimeter");

    /* ── outer insulating cup ── */
    double margin  = 22.0;
    double cup_x   = px + margin + 14.0;
    double cup_y   = py + 38.0;
    double cup_w   = pw - margin * 2.0 - 28.0;
    double cup_h   = ph - 38.0 - 90.0;
    if (cup_w < 40.0) cup_w = 40.0;
    if (cup_h < 60.0) cup_h = 60.0;

    double wall_t  = 10.0;  /* insulation thickness */

    /* outer wall (insulation) */
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.55);
    sh_rounded_rect(cr, cup_x, cup_y, cup_w, cup_h, 8.0);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.5);
    sh_rounded_rect(cr, cup_x, cup_y, cup_w, cup_h, 8.0);
    cairo_stroke(cr);

    /* inner liquid area */
    double ix  = cup_x + wall_t;
    double iy  = cup_y + wall_t;
    double iw  = cup_w - wall_t * 2.0;
    double ih  = cup_h - wall_t * 2.0;

    /* temperature-tinted fill — blend sapphire↔peach based on dT sign */
    double fill_r = heating ? MX_PEACH_R    : MX_SAPPHIRE_R;
    double fill_g = heating ? MX_PEACH_G    : MX_SAPPHIRE_G;
    double fill_b = heating ? MX_PEACH_B    : MX_SAPPHIRE_B;

    cairo_set_source_rgba(cr, fill_r, fill_g, fill_b, 0.18);
    cairo_rectangle(cr, ix, iy, iw, ih);
    cairo_fill(cr);

    /* liquid surface (wavy suggestion — just a horizontal line) */
    double liquid_top = iy + ih * 0.18;
    cairo_set_source_rgba(cr, fill_r, fill_g, fill_b, 0.5);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, ix, liquid_top);
    for (double wx = ix; wx <= ix + iw; wx += 8.0)
    {
        cairo_curve_to(cr,
            wx + 2, liquid_top - 3,
            wx + 6, liquid_top + 3,
            wx + 8, liquid_top);
    }
    cairo_stroke(cr);

    /* ── thermometer ── */
    double th_x  = cup_x + cup_w * 0.62;
    double th_y0 = cup_y - 14.0;
    double th_y1 = cup_y + cup_h * 0.70;
    double th_r  = 3.5;

    /* stem */
    cairo_set_source_rgba(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G,
                          MX_SUBTEXT0_B, 0.8);
    cairo_set_line_width(cr, 6.0);
    cairo_move_to(cr, th_x, th_y0);
    cairo_line_to(cr, th_x, th_y1);
    cairo_stroke(cr);

    /* mercury fill — height proportional to |dT| */
    double merc_frac = fmin(1.0, fabs(dT) / fmax(fabs(dT) + 50.0, 100.0));
    double merc_top  = th_y1 - merc_frac * (th_y1 - th_y0 - 10.0);
    cairo_set_source_rgb(cr, fill_r, fill_g, fill_b);
    cairo_set_line_width(cr, 4.0);
    cairo_move_to(cr, th_x, merc_top);
    cairo_line_to(cr, th_x, th_y1);
    cairo_stroke(cr);

    /* bulb */
    cairo_set_source_rgb(cr, fill_r, fill_g, fill_b);
    cairo_arc(cr, th_x, th_y1 + th_r, th_r + 1.5, 0, 2 * M_PI);
    cairo_fill(cr);

    /* ── thermometer dT label ── */
    snprintf(label, sizeof(label), "\xce\x94T=%.4g", dT);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, fill_r, fill_g, fill_b);
    cairo_move_to(cr, th_x + 8, (th_y0 + th_y1) / 2.0 + 4);
    cairo_show_text(cr, label);

    /* ── mass label inside cup ── */
    snprintf(label, sizeof(label), "m = %.4g", m);
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    sh_centred(cr, ix + iw * 0.38, iy + ih * 0.62, label);

    /* ── specific heat label inside cup ── */
    snprintf(label, sizeof(label), "c = %.4g", c);
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
    sh_centred(cr, ix + iw * 0.38, iy + ih * 0.78, label);

    /* ── heat source / sink arrow below cup ── */
    {
        double base_y = cup_y + cup_h + 10.0;
        double arrow_h = 20.0;
        double mid_x  = cup_x + cup_w / 2.0;

        if (heating)
        {
            /* flame-style arrow pointing up into cup */
            cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
            cairo_set_line_width(cr, 2.5);
            cairo_move_to(cr, mid_x, base_y + arrow_h);
            cairo_line_to(cr, mid_x, base_y);
            cairo_stroke(cr);
            cairo_move_to(cr, mid_x, base_y);
            cairo_line_to(cr, mid_x - 6, base_y + 10);
            cairo_move_to(cr, mid_x, base_y);
            cairo_line_to(cr, mid_x + 6, base_y + 10);
            cairo_stroke(cr);

            cairo_set_font_size(cr, 9.5);
            cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                                   CAIRO_FONT_WEIGHT_NORMAL);
            cairo_move_to(cr, mid_x + 10, base_y + arrow_h / 2.0 + 4);
            cairo_show_text(cr, "heat source");
        }
        else
        {
            /* cooling — arrow pointing down (heat leaving) */
            cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                                 MX_SAPPHIRE_B);
            cairo_set_line_width(cr, 2.5);
            cairo_move_to(cr, mid_x, base_y);
            cairo_line_to(cr, mid_x, base_y + arrow_h);
            cairo_stroke(cr);
            cairo_move_to(cr, mid_x, base_y + arrow_h);
            cairo_line_to(cr, mid_x - 6, base_y + arrow_h - 10);
            cairo_move_to(cr, mid_x, base_y + arrow_h);
            cairo_line_to(cr, mid_x + 6, base_y + arrow_h - 10);
            cairo_stroke(cr);

            cairo_set_font_size(cr, 9.5);
            cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                                   CAIRO_FONT_WEIGHT_NORMAL);
            cairo_move_to(cr, mid_x + 10, base_y + arrow_h / 2.0 + 4);
            cairo_show_text(cr, "heat sink");
        }
    }

    /* ── results table ── */
    double ty = cup_y + cup_h + 50.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    struct { const char *sym; double val; double r, g, b; } rows[] = {
        { "Q",  Q,  MX_PEACH_R,   MX_PEACH_G,   MX_PEACH_B   },
        { "m",  m,  MX_SAPPHIRE_R,MX_SAPPHIRE_G, MX_SAPPHIRE_B},
        { "c",  c,  MX_GREEN_R,   MX_GREEN_G,   MX_GREEN_B   },
        { "dT", dT, MX_YELLOW_R,  MX_YELLOW_G,  MX_YELLOW_B  },
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
 * RIGHT PANEL — energy bar chart (substance vs water ref)
 *************************************************************/
static void draw_energy_panel(cairo_t *cr,
                               double px, double py,
                               double pw, double ph,
                               double Q, double m,
                               double c, double dT)
{
    char label[80];

    /* panel background */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* panel title */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    sh_centred(cr, px + pw / 2.0, py + 16.0, "Energy Comparison");

    /* ── axes layout ── */
    double pad_l = 52.0, pad_r = 18.0;
    double pad_t = 30.0, pad_b = 44.0;
    double ax = px + pad_l;
    double ay = py + pad_t;
    double aw = pw - pad_l - pad_r;
    double ah = ph - pad_t - pad_b;

    /* compute bar heights */
    double Q_substance = Q;                          /* the solved quantity */
    double Q_water     = m * C_WATER * fabs(dT);    /* reference */
    double Q_max       = fmax(fabs(Q_substance), Q_water) * 1.20;
    if (Q_max < 1.0) Q_max = 1.0;

#define BAR_H(q)  (fabs(q) / Q_max * ah)
#define BAR_Y(q)  (ay + ah - BAR_H(q))

    /* ── grid ── */
    int n_grid = 5;
    cairo_set_line_width(cr, 0.5);
    cairo_set_source_rgba(cr, MX_GRAPH_GRID_R, MX_GRAPH_GRID_G,
                          MX_GRAPH_GRID_B, MX_GRAPH_GRID_A);
    for (int i = 0; i <= n_grid; i++)
    {
        double gy = ay + ah * i / n_grid;
        cairo_move_to(cr, ax, gy);
        cairo_line_to(cr, ax + aw, gy);
        cairo_stroke(cr);
    }

    /* ── two bars ── */
    double bar_w   = aw * 0.25;
    double gap     = aw * 0.12;
    double total_w = bar_w * 2.0 + gap;
    double bar_x1  = ax + (aw - total_w) / 2.0;
    double bar_x2  = bar_x1 + bar_w + gap;

    /* substance bar — three stacked segments: m, c, dT contributions */
    /* We shade the bar in three equal-height bands to suggest mc·dT */
    {
        double bh    = BAR_H(Q_substance);
        double by    = BAR_Y(Q_substance);
        double seg_h = bh / 3.0;

        /* m contribution band — sapphire */
        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.75);
        cairo_rectangle(cr, bar_x1, by, bar_w, seg_h);
        cairo_fill(cr);

        /* c contribution band — green */
        cairo_set_source_rgba(cr, MX_GREEN_R, MX_GREEN_G,
                              MX_GREEN_B, 0.75);
        cairo_rectangle(cr, bar_x1, by + seg_h, bar_w, seg_h);
        cairo_fill(cr);

        /* dT contribution band — yellow */
        cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G,
                              MX_YELLOW_B, 0.75);
        cairo_rectangle(cr, bar_x1, by + seg_h * 2.0, bar_w, seg_h);
        cairo_fill(cr);

        /* outline */
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_set_line_width(cr, 1.5);
        cairo_rectangle(cr, bar_x1, by, bar_w, bh);
        cairo_stroke(cr);

        /* Q label above bar */
        snprintf(label, sizeof(label), "%.4g", Q_substance);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        sh_centred(cr, bar_x1 + bar_w / 2.0, by - 10.0, label);
    }

    /* water reference bar — single sapphire block */
    {
        double bh = BAR_H(Q_water);
        double by = BAR_Y(Q_water);

        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.35);
        cairo_rectangle(cr, bar_x2, by, bar_w, bh);
        cairo_fill(cr);

        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.7);
        cairo_set_line_width(cr, 1.5);
        cairo_rectangle(cr, bar_x2, by, bar_w, bh);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.4g", Q_water);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.85);
        sh_centred(cr, bar_x2 + bar_w / 2.0, by - 10.0, label);
    }

    /* ── bar X labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);

    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    sh_centred(cr, bar_x1 + bar_w / 2.0, ay + ah + 14.0, "Substance");

    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.85);
    sh_centred(cr, bar_x2 + bar_w / 2.0, ay + ah + 14.0, "Water");

    /* ── legend ── */
    double lx = px + pw - 72.0;
    double ly = py + 30.0;
    double ls = 10.0;

    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    struct { double r, g, b; const char *lbl; } legend[] = {
        { MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B, "m  (mass)"    },
        { MX_GREEN_R,    MX_GREEN_G,    MX_GREEN_B,    "c  (sp. heat)"},
        { MX_YELLOW_R,   MX_YELLOW_G,   MX_YELLOW_B,   "\xce\x94T (temp)"     },
    };

    for (int i = 0; i < 3; i++)
    {
        cairo_set_source_rgba(cr, legend[i].r, legend[i].g, legend[i].b, 0.75);
        cairo_rectangle(cr, lx, ly, ls, ls);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_move_to(cr, lx + ls + 4, ly + ls - 1);
        cairo_show_text(cr, legend[i].lbl);
        ly += 14.0;
    }

    /* ── Y axis ticks and labels ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    for (int i = 0; i <= n_grid; i++)
    {
        double qv = Q_max * (n_grid - i) / n_grid;
        double gy = ay + ah * i / n_grid;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, ax - 4, gy); cairo_line_to(cr, ax, gy); cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.3g", qv);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax - te.width - 6, gy + te.height / 2.0);
        cairo_show_text(cr, label);
    }

    /* ── axes ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G,
                         MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);

    /* Y axis label */
    cairo_save(cr);
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_translate(cr, px + 12.0, ay + ah / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Q  (heat energy)", &te);
        cairo_move_to(cr, -te.width / 2.0, te.height / 2.0);
        cairo_show_text(cr, "Q  (heat energy)");
    }
    cairo_restore(cr);

    /* equation reminder at bottom */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    sh_centred(cr, ax + aw / 2.0, ay + ah + 34.0, "Q = m \xc2\xb7 c \xc2\xb7 \xce\x94T");

#undef BAR_H
#undef BAR_Y
}

/*************************************************************
 * draw_specheat_plot — public entry called by graph.c
 *************************************************************/
void draw_specheat_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd)
{
    double Q  = gd->x_data[0];
    double m  = gd->x_data[1];
    double c  = gd->x_data[2];
    double dT = gd->x_data[3];

    /* full background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);

    /* ── overall title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    sh_centred(cr, w / 2.0, 26.0, "Specific Heat  Q = mc\xce\x94T");

    /* subtitle */
    char sub[64];
    snprintf(sub, sizeof(sub),
             "c\xe2\x82\x99\xe2\x82\x98\xe2\x82\x90\xe2\x82\x9c\xe2\x82\x91\xe2\x82\x9f = 4186 J/kg\xc2\xb7K  (reference)");
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SUBTEXT0_R, MX_SUBTEXT0_G, MX_SUBTEXT0_B);
    sh_centred(cr, w / 2.0, 40.0,
               "c\u2098\u2099\u2100\u209b = 4186 J/kg\xc2\xb7K  (reference)");

    /* ── two panels ── */
    double pad = 12.0;
    double top = 50.0;
    double bot = 12.0;
    double mid = w / 2.0;

    draw_calorimeter_panel(cr,
                           pad, top,
                           mid - pad * 1.5, h - top - bot,
                           Q, m, c, dT);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_energy_panel(cr,
                      mid + pad * 0.5, top,
                      mid - pad * 1.5, h - top - bot,
                      Q, m, c, dT);
}

/*************************************************************
 * graph_window_open_specheat — queries parse and opens window
 *************************************************************/
void graph_window_open_specheat(void)
{
    char   buf[256];
    double Q, m, c, dT;
    double x_data[8] = {0};
    double y_dummy[1] = {0};

    pipe_transact("$heat_Q\n",  buf, sizeof(buf)); Q  = atof(buf);
    pipe_transact("$heat_m\n",  buf, sizeof(buf)); m  = atof(buf);
    pipe_transact("$heat_c\n",  buf, sizeof(buf)); c  = atof(buf);
    pipe_transact("$heat_dT\n", buf, sizeof(buf)); dT = atof(buf);

    x_data[0] = Q;
    x_data[1] = m;
    x_data[2] = c;
    x_data[3] = dT;

    graph_window_open_vars("Specific Heat", PLOT_SPECHEAT,
                           "", "",
                           x_data, y_dummy, 4);
}
