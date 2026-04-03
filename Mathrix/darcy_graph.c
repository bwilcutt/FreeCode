#include "darcy_graph.h"
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

/* ── helper: draw arrowhead on a line ── */
static void draw_arrow_head(cairo_t *cr,
                             double x,  double y,
                             double dx, double dy,
                             double size)
{
    double len = sqrt(dx*dx + dy*dy);
    if (len < 1e-9) return;
    double ux = dx/len, uy = dy/len;
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x - ux*size + uy*size*0.4,
                      y - uy*size - ux*size*0.4);
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x - ux*size - uy*size*0.4,
                      y - uy*size + ux*size*0.4);
    cairo_stroke(cr);
}

/* ═══════════════════════════════════════════════════════════
   LEFT PANEL — pipe cross-section with pressure gradient
   ═══════════════════════════════════════════════════════════ */

static void draw_pipe_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double f, double L, double D,
                             double V, double hf, double dP_rho)
{
    char   label[64];
    double cy  = py + ph / 2.0;

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── pipe geometry ── */
    double pipe_r  = ph * 0.18;
    double pipe_x0 = px + pw * 0.10;
    double pipe_x1 = px + pw * 0.90;
    double pipe_w  = pipe_x1 - pipe_x0;

    /* pressure gradient fill — blue (high) to red (low) */
    /* draw as a series of vertical strips fading from blue to red */
    int    n_strips = 40;
    for (int i = 0; i < n_strips; i++)
    {
        double t  = (double)i / n_strips;
        double x0 = pipe_x0 + t * pipe_w;
        double x1 = pipe_x0 + (t + 1.0/n_strips) * pipe_w;
        /* interpolate sapphire → red */
        double r = MX_SAPPHIRE_R + t * (MX_RED_R - MX_SAPPHIRE_R);
        double g = MX_SAPPHIRE_G + t * (MX_RED_G - MX_SAPPHIRE_G);
        double b = MX_SAPPHIRE_B + t * (MX_RED_B - MX_SAPPHIRE_B);
        cairo_set_source_rgba(cr, r, g, b, 0.35);
        cairo_rectangle(cr, x0, cy - pipe_r, x1 - x0, pipe_r * 2);
        cairo_fill(cr);
    }

    /* pipe walls */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, pipe_x0, cy - pipe_r);
    cairo_line_to(cr, pipe_x1, cy - pipe_r);
    cairo_stroke(cr);
    cairo_move_to(cr, pipe_x0, cy + pipe_r);
    cairo_line_to(cr, pipe_x1, cy + pipe_r);
    cairo_stroke(cr);

    /* pipe wall hatch */
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.4);
    cairo_set_line_width(cr, 0.5);
    for (double hx = pipe_x0; hx < pipe_x1; hx += 8)
    {
        cairo_move_to(cr, hx, cy - pipe_r);
        cairo_line_to(cr, hx, cy - pipe_r - 8);
        cairo_stroke(cr);
        cairo_move_to(cr, hx, cy + pipe_r);
        cairo_line_to(cr, hx, cy + pipe_r + 8);
        cairo_stroke(cr);
    }

    /* ── flow arrows inside pipe ── */
    int n_arrows = 5;
    cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
    cairo_set_line_width(cr, 1.5);
    for (int i = 0; i < n_arrows; i++)
    {
        double ax  = pipe_x0 + pipe_w * (0.15 + i * 0.18);
        double alen = pipe_w * 0.12;
        cairo_move_to(cr, ax, cy);
        cairo_line_to(cr, ax + alen, cy);
        cairo_stroke(cr);
        draw_arrow_head(cr, ax + alen, cy, 1, 0, 7.0);
    }

    /* ── high/low pressure labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_move_to(cr, pipe_x0 + 4, cy - pipe_r - 10);
    cairo_show_text(cr, "High P");

    cairo_set_source_rgb(cr, MX_RED_R, MX_RED_G, MX_RED_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Low P", &te);
        cairo_move_to(cr, pipe_x1 - te.width - 4, cy - pipe_r - 10);
        cairo_show_text(cr, "Low P");
    }

    /* ── L dimension line below pipe ── */
    {
        double dim_y = cy + pipe_r + 28.0;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, pipe_x0, dim_y);
        cairo_line_to(cr, pipe_x1, dim_y);
        cairo_stroke(cr);
        cairo_move_to(cr, pipe_x0, dim_y - 4);
        cairo_line_to(cr, pipe_x0, dim_y + 4);
        cairo_move_to(cr, pipe_x1, dim_y - 4);
        cairo_line_to(cr, pipe_x1, dim_y + 4);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "L = %.3g", L);
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, pipe_x0 + pipe_w/2.0 - te.width/2.0,
                      dim_y + 13);
        cairo_show_text(cr, label);
    }

    /* ── D dimension line on left ── */
    {
        double dim_x = pipe_x0 - 18.0;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, dim_x, cy - pipe_r);
        cairo_line_to(cr, dim_x, cy + pipe_r);
        cairo_stroke(cr);
        cairo_move_to(cr, dim_x - 4, cy - pipe_r);
        cairo_line_to(cr, dim_x + 4, cy - pipe_r);
        cairo_move_to(cr, dim_x - 4, cy + pipe_r);
        cairo_line_to(cr, dim_x + 4, cy + pipe_r);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "D=%.3g", D);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, dim_x - te.width/2.0, cy + pipe_r + 13);
        cairo_show_text(cr, label);
    }

    /* ── input labels (top left) ── */
    double ry = py + 16.0;
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    snprintf(label, sizeof(label), "f = %.4g", f);
    cairo_move_to(cr, px + pw * 0.55, ry); ry += 14;
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "V = %.3g m/s", V);
    cairo_move_to(cr, px + pw * 0.55, ry); ry += 14;
    cairo_show_text(cr, label);

    /* ── result labels (bottom) ── */
    double by2 = py + ph - 10.0;
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);

    snprintf(label, sizeof(label), "hf = %.4g m", hf);
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    cairo_move_to(cr, px + 8, by2 - 14);
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "\xce\x94P/\xcf\x81 = %.4g J/kg", dP_rho);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_move_to(cr, px + 8, by2);
    cairo_show_text(cr, label);
}

/* ═══════════════════════════════════════════════════════════
   RIGHT PANEL — EGL / HGL energy diagram
   ═══════════════════════════════════════════════════════════ */

static void draw_egl_panel(cairo_t *cr,
                            double px, double py,
                            double pw, double ph,
                            double L, double V, double g,
                            double hf)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── plot area ── */
    double pad_l = 48.0, pad_r = 16.0, pad_t = 32.0, pad_b = 36.0;
    double ax  = px + pad_l;
    double ay  = py + pad_t;
    double aw  = pw - pad_l - pad_r;
    double ah  = ph - pad_t - pad_b;

    /* velocity head */
    double v_head = (V * V) / (2.0 * g);

    /* total head at inlet = hf + v_head (arbitrary datum = 0 at outlet HGL) */
    double total_range = hf + v_head * 1.5;
    if (total_range < 1e-12) total_range = 1.0;

    /* pixel mapping */
#define EX(x_len) (ax + (x_len) / L * aw)
#define EY(head)  (ay + ah - (head) / total_range * ah)

    /* ── axes ── */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_line_width(cr, 1.0);
    /* horizontal baseline */
    cairo_move_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);
    /* vertical axis */
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_stroke(cr);

    /* ── pipe centerline ── */
    double pipe_y = ay + ah * 0.72;
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.5);
    cairo_set_line_width(cr, 8.0);
    cairo_move_to(cr, ax, pipe_y);
    cairo_line_to(cr, ax + aw, pipe_y);
    cairo_stroke(cr);

    /* pipe outline */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, ax, pipe_y - 4);
    cairo_line_to(cr, ax + aw, pipe_y - 4);
    cairo_stroke(cr);
    cairo_move_to(cr, ax, pipe_y + 4);
    cairo_line_to(cr, ax + aw, pipe_y + 4);
    cairo_stroke(cr);

    /* ── EGL — Energy Grade Line ── */
    /* EGL inlet = hf + v_head above datum, EGL outlet = v_head above datum */
    double egl_in  = hf + v_head;
    double egl_out = v_head;

    /* EGL pixel positions */
    double egl_y0 = EY(egl_in);
    double egl_y1 = EY(egl_out);

    /* shadow */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.4);
    cairo_set_line_width(cr, 3.0);
    cairo_move_to(cr, ax + 1,      egl_y0 + 1);
    cairo_line_to(cr, ax + aw + 1, egl_y1 + 1);
    cairo_stroke(cr);

    /* EGL line */
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, ax,      egl_y0);
    cairo_line_to(cr, ax + aw, egl_y1);
    cairo_stroke(cr);

    /* EGL label */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    cairo_move_to(cr, ax + aw * 0.55, egl_y0 - 6);
    cairo_show_text(cr, "EGL");

    /* ── HGL — Hydraulic Grade Line ── */
    /* HGL = EGL - velocity head (constant for uniform pipe) */
    double hgl_y0 = EY(hf);
    double hgl_y1 = EY(0.0);

    /* HGL dashed line */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    cairo_set_dash(cr, (double[]){6.0, 4.0}, 2, 0);
    cairo_move_to(cr, ax,      hgl_y0);
    cairo_line_to(cr, ax + aw, hgl_y1);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* HGL label */
    cairo_set_font_size(cr, 10.0);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_move_to(cr, ax + aw * 0.55, hgl_y0 + 12);
    cairo_show_text(cr, "HGL");

    /* ── hf vertical arrow (left side) ── */
    {
        double ax0 = ax - 28.0;

        /* dashed lines to EGL and HGL at inlet */
        cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                              MX_OVERLAY1_B, 0.6);
        cairo_set_line_width(cr, 0.8);
        cairo_set_dash(cr, (double[]){3.0, 3.0}, 2, 0);
        cairo_move_to(cr, ax,  egl_y0);
        cairo_line_to(cr, ax0, egl_y0);
        cairo_stroke(cr);
        cairo_move_to(cr, ax,  hgl_y0);
        cairo_line_to(cr, ax0, hgl_y0);
        cairo_stroke(cr);
        cairo_set_dash(cr, NULL, 0, 0);

        /* vertical arrow */
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_set_line_width(cr, 1.5);
        cairo_move_to(cr, ax0, egl_y0);
        cairo_line_to(cr, ax0, hgl_y0);
        cairo_stroke(cr);
        draw_arrow_head(cr, ax0, egl_y0, 0, -1, 6.0);
        draw_arrow_head(cr, ax0, hgl_y0, 0,  1, 6.0);

        /* hf label */
        snprintf(label, sizeof(label), "hf=%.3g", hf);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax0 - te.width - 2,
                      (egl_y0 + hgl_y0)/2.0 + 4);
        cairo_show_text(cr, label);
    }

    /* ── V²/2g velocity head arrow (right side) ── */
    {
        double ax1 = ax + aw + 12.0;

        cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                              MX_OVERLAY1_B, 0.6);
        cairo_set_line_width(cr, 0.8);
        cairo_set_dash(cr, (double[]){3.0, 3.0}, 2, 0);
        cairo_move_to(cr, ax + aw, egl_y1);
        cairo_line_to(cr, ax1 + 16, egl_y1);
        cairo_stroke(cr);
        cairo_move_to(cr, ax + aw, hgl_y1);
        cairo_line_to(cr, ax1 + 16, hgl_y1);
        cairo_stroke(cr);
        cairo_set_dash(cr, NULL, 0, 0);

        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_set_line_width(cr, 1.5);
        cairo_move_to(cr, ax1 + 10, egl_y1);
        cairo_line_to(cr, ax1 + 10, hgl_y1);
        cairo_stroke(cr);
        draw_arrow_head(cr, ax1 + 10, egl_y1, 0, -1, 6.0);
        draw_arrow_head(cr, ax1 + 10, hgl_y1, 0,  1, 6.0);

        /* V²/2g label */
        snprintf(label, sizeof(label), "V\xc2\xb2/2g");
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_move_to(cr, ax1 + 14, (egl_y1 + hgl_y1)/2.0 + 4);
        cairo_show_text(cr, label);
    }

    /* ── axis labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    /* Y axis label (rotated) */
    cairo_save(cr);
    cairo_translate(cr, px + 12, ay + ah/2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    cairo_text_extents_t te;
    cairo_text_extents(cr, "Head (m)", &te);
    cairo_move_to(cr, -te.width/2.0, te.height/2.0);
    cairo_show_text(cr, "Head (m)");
    cairo_restore(cr);

    /* X axis label */
    cairo_text_extents_t te2;
    cairo_text_extents(cr, "Pipe length", &te2);
    cairo_move_to(cr, ax + aw/2.0 - te2.width/2.0, ay + ah + 24);
    cairo_show_text(cr, "Pipe length");

    /* ── panel title ── */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    {
        const char *t = "Energy Grade Lines";
        cairo_text_extents_t te3;
        cairo_text_extents(cr, t, &te3);
        cairo_move_to(cr, px + pw/2.0 - te3.width/2.0, py + 16.0);
        cairo_show_text(cr, t);
    }

#undef EX
#undef EY
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_darcy_plot
   ═══════════════════════════════════════════════════════════ */

void draw_darcy_plot(cairo_t *cr, int w, int h,
                     const GraphData *gd)
{
    double f      = gd->x_data[0];
    double L      = gd->x_data[1];
    double D      = gd->x_data[2];
    double V      = gd->x_data[3];
    double g      = gd->x_data[4];
    double hf     = gd->y_data[0];
    double dP_rho = gd->y_data[1];

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
        const char *title = "Darcy-Weisbach — Pipe Head Loss";
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

    /* left: pipe diagram */
    draw_pipe_panel(cr,
                    pad, top,
                    mid - pad * 1.5, h - top - bot,
                    f, L, D, V, hf, dP_rho);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    /* right: EGL/HGL diagram */
    draw_egl_panel(cr,
                   mid + pad * 0.5, top,
                   mid - pad * 1.5, h - top - bot,
                   L, V, g, hf);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_darcy
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_darcy(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    f, L, D, V, g, hf, dP_rho;
    double    x_data[5];
    double    y_data[5] = {0};

    pipe_transact("$darcy_f\n",     buf, sizeof(buf)); f      = atof(buf);
    pipe_transact("$darcy_L\n",     buf, sizeof(buf)); L      = atof(buf);
    pipe_transact("$darcy_D\n",     buf, sizeof(buf)); D      = atof(buf);
    pipe_transact("$darcy_V\n",     buf, sizeof(buf)); V      = atof(buf);
    pipe_transact("$darcy_g\n",     buf, sizeof(buf)); g      = atof(buf);
    pipe_transact("$darcy_hf\n",    buf, sizeof(buf)); hf     = atof(buf);
    pipe_transact("$darcy_dP_rho\n",buf, sizeof(buf)); dP_rho = atof(buf);

    x_data[0] = f;
    x_data[1] = L;
    x_data[2] = D;
    x_data[3] = V;
    x_data[4] = g;

    y_data[0] = hf;
    y_data[1] = dP_rho;

    graph_window_open_vars("Darcy-Weisbach", PLOT_DARCY,
                           "", "",
                           x_data, y_data, 5);
}
