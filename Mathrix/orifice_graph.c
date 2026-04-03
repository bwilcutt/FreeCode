#include "orifice_graph.h"
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

/* ═══════════════════════════════════════════════════════════
   LEFT PANEL — tank / orifice diagram
   ═══════════════════════════════════════════════════════════ */

static void draw_tank_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double Cd, double A, double h,
                             double Q, double V)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── tank geometry ── */
    double tank_x0  = px + pw * 0.12;
    double tank_x1  = px + pw * 0.52;
    double tank_y0  = py + ph * 0.12;
    double tank_y1  = py + ph * 0.85;
    double tank_w   = tank_x1 - tank_x0;
    double tank_h   = tank_y1 - tank_y0;

    /* orifice position — centred vertically on tank wall */
    double ori_h_px = fmax(8.0, tank_h * 0.06);   /* orifice height in px */
    double ori_cy   = tank_y1 - ori_h_px * 0.5;   /* orifice centre y     */

    /* water level y — based on head h */
    double water_y  = ori_cy - (h / (h * 1.3)) * (tank_h * 0.75);
    water_y = fmax(tank_y0 + 8, fmin(ori_cy - ori_h_px, water_y));

    /* ── tank walls ── */
    /* left wall */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 2.5);
    cairo_move_to(cr, tank_x0, tank_y0);
    cairo_line_to(cr, tank_x0, tank_y1);
    cairo_stroke(cr);

    /* bottom wall */
    cairo_move_to(cr, tank_x0, tank_y1);
    cairo_line_to(cr, tank_x1, tank_y1);
    cairo_stroke(cr);

    /* right wall — top part (above orifice) */
    cairo_move_to(cr, tank_x1, tank_y0);
    cairo_line_to(cr, tank_x1, ori_cy - ori_h_px/2.0);
    cairo_stroke(cr);

    /* right wall — bottom part (below orifice) */
    cairo_move_to(cr, tank_x1, ori_cy + ori_h_px/2.0);
    cairo_line_to(cr, tank_x1, tank_y1);
    cairo_stroke(cr);

    /* ── water fill ── */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.25);
    cairo_rectangle(cr, tank_x0 + 1.5, water_y,
                    tank_w - 3.0, tank_y1 - water_y);
    cairo_fill(cr);

    /* ── water surface (wavy line) ── */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    double wave_amp = 3.0;
    double wave_len = 20.0;
    cairo_move_to(cr, tank_x0 + 2, water_y);
    for (double wx = tank_x0 + 2; wx < tank_x1 - 2; wx += 2)
    {
        double wy = water_y + wave_amp *
                    sin((wx - tank_x0) / wave_len * 2.0 * M_PI);
        cairo_line_to(cr, wx, wy);
    }
    cairo_stroke(cr);

    /* ── head dimension line ── */
    {
        double dim_x = tank_x0 - 18.0;
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, dim_x, water_y);
        cairo_line_to(cr, dim_x, ori_cy);
        cairo_stroke(cr);
        /* tick marks */
        cairo_move_to(cr, dim_x - 4, water_y);
        cairo_line_to(cr, dim_x + 4, water_y);
        cairo_move_to(cr, dim_x - 4, ori_cy);
        cairo_line_to(cr, dim_x + 4, ori_cy);
        cairo_stroke(cr);
        /* arrowheads */
        cairo_move_to(cr, dim_x, water_y);
        cairo_line_to(cr, dim_x - 3, water_y + 6);
        cairo_move_to(cr, dim_x, water_y);
        cairo_line_to(cr, dim_x + 3, water_y + 6);
        cairo_stroke(cr);
        cairo_move_to(cr, dim_x, ori_cy);
        cairo_line_to(cr, dim_x - 3, ori_cy - 6);
        cairo_move_to(cr, dim_x, ori_cy);
        cairo_line_to(cr, dim_x + 3, ori_cy - 6);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "h=%.3g", h);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, dim_x - te.width - 4,
                      (water_y + ori_cy)/2.0 + 4);
        cairo_show_text(cr, label);
    }

    /* ── orifice highlight ── */
    cairo_set_source_rgba(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B, 0.8);
    cairo_rectangle(cr, tank_x1 - 3, ori_cy - ori_h_px/2.0,
                    6, ori_h_px);
    cairo_fill(cr);

    /* ── jet ── */
    /* jet widens slightly (vena contracta then expansion) */
    double jet_x0   = tank_x1 + 3;
    double jet_x1   = px + pw * 0.92;
    double jet_len  = jet_x1 - jet_x0;

    /* vena contracta at ~40% of jet length */
    double vc_x     = jet_x0 + jet_len * 0.35;
    double jet_r0   = ori_h_px / 2.0;           /* at orifice */
    double jet_r_vc = jet_r0 * Cd;              /* narrowest point */
    double jet_r1   = jet_r0 * 0.85;            /* at exit */

    /* jet fill */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.35);
    cairo_move_to(cr, jet_x0, ori_cy - jet_r0);
    cairo_curve_to(cr, vc_x, ori_cy - jet_r_vc,
                       vc_x, ori_cy - jet_r_vc,
                       jet_x1, ori_cy - jet_r1);
    cairo_line_to(cr, jet_x1, ori_cy + jet_r1);
    cairo_curve_to(cr, vc_x, ori_cy + jet_r_vc,
                       vc_x, ori_cy + jet_r_vc,
                       jet_x0, ori_cy + jet_r0);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* jet outline */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.2);
    cairo_move_to(cr, jet_x0, ori_cy - jet_r0);
    cairo_curve_to(cr, vc_x, ori_cy - jet_r_vc,
                       vc_x, ori_cy - jet_r_vc,
                       jet_x1, ori_cy - jet_r1);
    cairo_stroke(cr);
    cairo_move_to(cr, jet_x0, ori_cy + jet_r0);
    cairo_curve_to(cr, vc_x, ori_cy + jet_r_vc,
                       vc_x, ori_cy + jet_r_vc,
                       jet_x1, ori_cy + jet_r1);
    cairo_stroke(cr);

    /* vena contracta label */
    cairo_set_font_size(cr, 8.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_move_to(cr, vc_x - 16, ori_cy - jet_r_vc - 6);
    cairo_show_text(cr, "vena contracta");

    /* flow arrow inside jet */
    {
        double ax  = (jet_x0 + vc_x) / 2.0;
        double alen = jet_len * 0.15;
        cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
        cairo_set_line_width(cr, 1.5);
        cairo_move_to(cr, ax, ori_cy);
        cairo_line_to(cr, ax + alen, ori_cy);
        cairo_stroke(cr);
        /* arrowhead */
        double tip = ax + alen;
        cairo_move_to(cr, tip, ori_cy);
        cairo_line_to(cr, tip - 7, ori_cy - 3);
        cairo_move_to(cr, tip, ori_cy);
        cairo_line_to(cr, tip - 7, ori_cy + 3);
        cairo_stroke(cr);
    }

    /* ── input / result labels ── */
    double ry = py + 16.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    snprintf(label, sizeof(label), "Cd = %.3g", Cd);
    cairo_move_to(cr, tank_x0 + 4, ry); ry += 14;
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "A = %.3g m\xc2\xb2", A);
    cairo_move_to(cr, tank_x0 + 4, ry); ry += 14;
    cairo_show_text(cr, label);

    /* result labels */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);

    snprintf(label, sizeof(label), "Q = %.4g m\xc2\xb3/s", Q);
    cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
    cairo_move_to(cr, tank_x0 + 4, tank_y1 - 20);
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "V = %.4g m/s", V);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_move_to(cr, tank_x0 + 4, tank_y1 - 6);
    cairo_show_text(cr, label);
}

/* ═══════════════════════════════════════════════════════════
   RIGHT PANEL — Q vs h curve
   ═══════════════════════════════════════════════════════════ */

static void draw_qh_panel(cairo_t *cr,
                           double px, double py,
                           double pw, double ph,
                           double Cd, double A, double g,
                           double h, double Q)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── plot area ── */
    double pad_l = 54.0, pad_r = 16.0, pad_t = 32.0, pad_b = 38.0;
    double ax  = px + pad_l;
    double ay  = py + pad_t;
    double aw  = pw - pad_l - pad_r;
    double ah  = ph - pad_t - pad_b;

    /* axis ranges */
    double h_max  = h * 2.2;
    double Q_max  = Cd * A * sqrt(2.0 * g * h_max) * 1.1;
    if (Q_max < 1e-12) Q_max = 1.0;

#define QX(hv)  (ax + (hv) / h_max * aw)
#define QY(qv)  (ay + ah - (qv) / Q_max * ah)

    /* ── axes ── */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_stroke(cr);
    cairo_move_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);

    /* ── grid lines ── */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 0.5);
    cairo_set_dash(cr, (double[]){4.0, 4.0}, 2, 0);
    int n_grid = 4;
    for (int i = 1; i <= n_grid; i++)
    {
        double gx = ax + aw * i / n_grid;
        double gy = ay + ah * i / n_grid;
        cairo_move_to(cr, gx, ay);
        cairo_line_to(cr, gx, ay + ah);
        cairo_stroke(cr);
        cairo_move_to(cr, ax, gy);
        cairo_line_to(cr, ax + aw, gy);
        cairo_stroke(cr);
    }
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── Q = Cd*A*sqrt(2gh) curve ── */
    int    n_pts = 80;

    /* shadow */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.4);
    cairo_set_line_width(cr, 3.0);
    cairo_move_to(cr, QX(0) + 1, QY(0) + 1);
    for (int i = 1; i <= n_pts; i++)
    {
        double hv = h_max * i / n_pts;
        double qv = Cd * A * sqrt(2.0 * g * hv);
        cairo_line_to(cr, QX(hv) + 1, QY(qv) + 1);
    }
    cairo_stroke(cr);

    /* filled area under curve */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.15);
    cairo_move_to(cr, QX(0), QY(0));
    for (int i = 1; i <= n_pts; i++)
    {
        double hv = h_max * i / n_pts;
        double qv = Cd * A * sqrt(2.0 * g * hv);
        cairo_line_to(cr, QX(hv), QY(qv));
    }
    cairo_line_to(cr, QX(h_max), QY(0));
    cairo_close_path(cr);
    cairo_fill(cr);

    /* main curve */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, QX(0), QY(0));
    for (int i = 1; i <= n_pts; i++)
    {
        double hv = h_max * i / n_pts;
        double qv = Cd * A * sqrt(2.0 * g * hv);
        cairo_line_to(cr, QX(hv), QY(qv));
    }
    cairo_stroke(cr);

    /* ── operating point ── */
    double dot_x = QX(h);
    double dot_y = QY(Q);

    /* dashed drop lines */
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.6);
    cairo_set_line_width(cr, 0.8);
    cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
    cairo_move_to(cr, dot_x, dot_y);
    cairo_line_to(cr, dot_x, ay + ah);
    cairo_stroke(cr);
    cairo_move_to(cr, dot_x, dot_y);
    cairo_line_to(cr, ax, dot_y);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* dot shadow */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
    cairo_arc(cr, dot_x + 1, dot_y + 1, 6.0, 0, 2*M_PI);
    cairo_fill(cr);

    /* dot */
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    cairo_arc(cr, dot_x, dot_y, 6.0, 0, 2*M_PI);
    cairo_fill(cr);

    /* ── axis tick labels ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    /* h tick at operating point */
    snprintf(label, sizeof(label), "%.3g", h);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, dot_x - te.width/2.0, ay + ah + 12);
        cairo_show_text(cr, label);
    }

    /* Q tick at operating point */
    snprintf(label, sizeof(label), "%.3g", Q);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax - te.width - 5, dot_y + 4);
        cairo_show_text(cr, label);
    }

    /* ── axis labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    /* X label */
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Head  h (m)", &te);
        cairo_move_to(cr, ax + aw/2.0 - te.width/2.0, ay + ah + 26);
        cairo_show_text(cr, "Head  h (m)");
    }

    /* Y label (rotated) */
    cairo_save(cr);
    cairo_translate(cr, px + 12, ay + ah/2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Q (m\xc2\xb3/s)", &te);
        cairo_move_to(cr, -te.width/2.0, te.height/2.0);
        cairo_show_text(cr, "Q (m\xc2\xb3/s)");
    }
    cairo_restore(cr);

    /* ── panel title ── */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    {
        const char *t = "Q vs h";
        cairo_text_extents_t te;
        cairo_text_extents(cr, t, &te);
        cairo_move_to(cr, px + pw/2.0 - te.width/2.0, py + 16.0);
        cairo_show_text(cr, t);
    }

#undef QX
#undef QY
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_orifice_plot
   ═══════════════════════════════════════════════════════════ */

void draw_orifice_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd)
{
    double Cd = gd->x_data[0];
    double A  = gd->x_data[1];
    double hv = gd->x_data[2];
    double g  = gd->x_data[3];
    double Q  = gd->y_data[0];
    double V  = gd->y_data[1];

    /* background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);

    /* ── overall title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 14.0);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    {
        const char *title = "Orifice Flow";
        cairo_text_extents_t te;
        cairo_text_extents(cr, title, &te);
        cairo_move_to(cr, w/2.0 - te.width/2.0, 26.0);
        cairo_show_text(cr, title);
    }

    /* ── two side-by-side panels ── */
    double pad = 12.0;
    double top = 38.0;
    double bot = 12.0;
    double mid = w / 2.0;

    draw_tank_panel(cr,
                    pad, top,
                    mid - pad * 1.5, h - top - bot,
                    Cd, A, hv, Q, V);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_qh_panel(cr,
                  mid + pad * 0.5, top,
                  mid - pad * 1.5, h - top - bot,
                  Cd, A, g, hv, Q);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_orifice
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_orifice(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    Cd, A, hv, g, Q, V;
    double    x_data[5] = {0};
    double    y_data[5] = {0};

    pipe_transact("$orifice_Cd\n", buf, sizeof(buf)); Cd = atof(buf);
    pipe_transact("$orifice_A\n",  buf, sizeof(buf)); A  = atof(buf);
    pipe_transact("$orifice_h\n",  buf, sizeof(buf)); hv = atof(buf);
    pipe_transact("$orifice_g\n",  buf, sizeof(buf)); g  = atof(buf);
    pipe_transact("$orifice_Q\n",  buf, sizeof(buf)); Q  = atof(buf);
    pipe_transact("$orifice_V\n",  buf, sizeof(buf)); V  = atof(buf);

    if (g < 1.0) g = 9.81;

    x_data[0] = Cd;
    x_data[1] = A;
    x_data[2] = hv;
    x_data[3] = g;

    y_data[0] = Q;
    y_data[1] = V;

    graph_window_open_vars("Orifice Flow", PLOT_ORIFICE,
                           "", "",
                           x_data, y_data, 4);
}
