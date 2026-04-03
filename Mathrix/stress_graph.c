#include "stress_graph.h"
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

/* ── layout ── */
#define ARROW_HEAD   10.0
#define MEMBER_H     48.0    /* member rectangle height in pixels */

/* ── helper: draw a horizontal arrowhead ── */
static void draw_h_arrow(cairo_t *cr,
                          double x, double y,
                          double dx,          /* positive = pointing right */
                          double size)
{
    double dir = (dx >= 0) ? 1.0 : -1.0;
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x - dir*size, y - size*0.4);
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x - dir*size, y + size*0.4);
    cairo_stroke(cr);
}

/* ═══════════════════════════════════════════════════════════
   LEFT PANEL — member diagram
   ═══════════════════════════════════════════════════════════ */

static void draw_member_panel(cairo_t *cr,
                               double px, double py,
                               double pw, double ph,
                               double F, double A, double L,
                               double sigma, double eps, double delta)
{
    char   label[64];
    double cx    = px + pw / 2.0;
    double cy    = py + ph / 2.0 - 10.0;

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── member bar ── */
    double bar_x0 = px + pw * 0.18;
    double bar_x1 = px + pw * 0.82;
    double bar_w  = bar_x1 - bar_x0;
    double bar_y0 = cy - MEMBER_H / 2.0;

    /* fill — tension = blue tint, compression = red tint */
    if (F >= 0)
        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.20);
    else
        cairo_set_source_rgba(cr, MX_RED_R, MX_RED_G, MX_RED_B, 0.20);
    cairo_rectangle(cr, bar_x0, bar_y0, bar_w, MEMBER_H);
    cairo_fill(cr);

    /* outline */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, bar_x0, bar_y0, bar_w, MEMBER_H);
    cairo_stroke(cr);

    /* centre-line */
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.5);
    cairo_set_line_width(cr, 0.8);
    cairo_set_dash(cr, (double[]){6.0, 4.0}, 2, 0);
    cairo_move_to(cr, bar_x0, cy);
    cairo_line_to(cr, bar_x1, cy);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── force arrows ── */
    double arrow_len = pw * 0.14;
    int    tension   = (F >= 0);

    cairo_set_source_rgb(cr, tension ? MX_SAPPHIRE_R : MX_RED_R,
                             tension ? MX_SAPPHIRE_G : MX_RED_G,
                             tension ? MX_SAPPHIRE_B : MX_RED_B);
    cairo_set_line_width(cr, 2.0);

    if (tension)
    {
        /* arrows point outward */
        /* left arrow: shaft from bar left edge outward */
        cairo_move_to(cr, bar_x0, cy);
        cairo_line_to(cr, bar_x0 - arrow_len, cy);
        cairo_stroke(cr);
        draw_h_arrow(cr, bar_x0 - arrow_len, cy, -1, ARROW_HEAD);

        /* right arrow */
        cairo_move_to(cr, bar_x1, cy);
        cairo_line_to(cr, bar_x1 + arrow_len, cy);
        cairo_stroke(cr);
        draw_h_arrow(cr, bar_x1 + arrow_len, cy, 1, ARROW_HEAD);
    }
    else
    {
        /* arrows point inward */
        cairo_move_to(cr, bar_x0 - arrow_len, cy);
        cairo_line_to(cr, bar_x0, cy);
        cairo_stroke(cr);
        draw_h_arrow(cr, bar_x0, cy, 1, ARROW_HEAD);

        cairo_move_to(cr, bar_x1 + arrow_len, cy);
        cairo_line_to(cr, bar_x1, cy);
        cairo_stroke(cr);
        draw_h_arrow(cr, bar_x1, cy, -1, ARROW_HEAD);
    }

    /* F label on left arrow */
    snprintf(label, sizeof(label), "F=%.3g", F);
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, bar_x0 - arrow_len/2.0 - te.width/2.0,
                      cy - 10.0);
        cairo_show_text(cr, label);
    }

    /* ── L dimension line (below bar) ── */
    if (L > 0)
    {
        double dim_y = bar_y0 + MEMBER_H + 28.0;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, bar_x0, dim_y);
        cairo_line_to(cr, bar_x1, dim_y);
        cairo_stroke(cr);
        /* ticks */
        cairo_move_to(cr, bar_x0, dim_y - 4); cairo_line_to(cr, bar_x0, dim_y + 4);
        cairo_move_to(cr, bar_x1, dim_y - 4); cairo_line_to(cr, bar_x1, dim_y + 4);
        cairo_stroke(cr);
        snprintf(label, sizeof(label), "L = %.3g m", L);
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, cx - te.width/2.0, dim_y + 13.0);
        cairo_show_text(cr, label);
    }

    /* ── cross-section annotation (right side of bar) ── */
    {
        double sx = bar_x1 + arrow_len + 14.0;
        double sy = cy - MEMBER_H * 0.6;

        /* small square representing cross-section */
        double sq = 16.0;
        cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                              MX_SURFACE1_B, 0.6);
        cairo_rectangle(cr, sx, sy, sq, sq);
        cairo_fill(cr);
        cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G,
                             MX_SUBTEXT1_B);
        cairo_set_line_width(cr, 1.0);
        cairo_rectangle(cr, sx, sy, sq, sq);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "A=%.3g", A);
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_move_to(cr, sx, sy + sq + 13.0);
        cairo_show_text(cr, label);
    }

    /* ── results labels ── */
    double ry   = bar_y0 - 18.0;
    double rx   = px + 12.0;
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    /* sigma */
    snprintf(label, sizeof(label), "\xcf\x83 = %.4g Pa", sigma);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    cairo_move_to(cr, rx, ry);
    cairo_show_text(cr, label);
    ry -= 16.0;

    /* eps */
    if (eps != 0.0)
    {
        snprintf(label, sizeof(label), "\xce\xb5 = %.4g", eps);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_move_to(cr, rx, ry);
        cairo_show_text(cr, label);
        ry -= 16.0;
    }

    /* delta */
    if (delta != 0.0)
    {
        snprintf(label, sizeof(label), "\xce\xb4 = %.4g m", delta);
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_move_to(cr, rx, ry);
        cairo_show_text(cr, label);
    }

    /* ── tension / compression label ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, tension ? MX_SAPPHIRE_R : MX_RED_R,
                             tension ? MX_SAPPHIRE_G : MX_RED_G,
                             tension ? MX_SAPPHIRE_B : MX_RED_B);
    cairo_move_to(cr, cx - 28.0, bar_y0 + MEMBER_H + 14.0);
    cairo_show_text(cr, tension ? "tension" : "compression");
}

/* ═══════════════════════════════════════════════════════════
   RIGHT PANEL — stress-strain plot
   ═══════════════════════════════════════════════════════════ */

static void draw_ss_panel(cairo_t *cr,
                           double px, double py,
                           double pw, double ph,
                           double sigma, double eps, double E)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* only draw σ-ε plot when E is known */
    if (E <= 0 || eps == 0.0)
    {
        cairo_set_font_size(cr, 11.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_OVERLAY0_R, MX_OVERLAY0_G,
                             MX_OVERLAY0_B);
        cairo_move_to(cr, px + pw/2.0 - 60, py + ph/2.0);
        cairo_show_text(cr, "provide E for \xcf\x83-\xce\xb5 plot");
        return;
    }

    /* ── plot area ── */
    double pad_l = 54.0, pad_r = 16.0, pad_t = 28.0, pad_b = 38.0;
    double ax = px + pad_l;
    double ay = py + pad_t;
    double aw = pw - pad_l - pad_r;
    double ah = ph - pad_t - pad_b;

    /* ── determine axis ranges ── */
    /* show ±20% beyond the operating point, always including origin */
    double eps_max  = fabs(eps)  * 1.4;
    double sig_max  = fabs(sigma) * 1.4;
    if (eps_max  < 1e-12) eps_max  = 1.0;
    if (sig_max  < 1e-12) sig_max  = 1.0;

    /* symmetric about origin */
    double eps_lo  = (eps  < 0) ? -eps_max  : 0.0;
    double eps_hi  = (eps  > 0) ?  eps_max  : 0.0;
    double sig_lo  = (sigma < 0) ? -sig_max : 0.0;
    double sig_hi  = (sigma > 0) ?  sig_max : 0.0;

    /* ensure origin is always visible */
    if (eps_lo  > 0)  eps_lo  = 0.0;
    if (eps_hi  < 0)  eps_hi  = 0.0;
    if (sig_lo  > 0)  sig_lo  = 0.0;
    if (sig_hi  < 0)  sig_hi  = 0.0;

    double eps_range = eps_hi - eps_lo;
    double sig_range = sig_hi - sig_lo;

#define SPX(e)  (ax + ((e) - eps_lo) / eps_range * aw)
#define SPY(s)  (ay + ah - ((s) - sig_lo) / sig_range * ah)

    /* ── panel border ── */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.5);
    cairo_set_line_width(cr, 0.5);
    cairo_rectangle(cr, ax, ay, aw, ah);
    cairo_stroke(cr);

    /* ── axes ── */
    double ox = SPX(0.0);
    double oy = SPY(0.0);

    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G,
                         MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.2);

    /* horizontal (ε axis) */
    cairo_move_to(cr, ax, oy);
    cairo_line_to(cr, ax + aw, oy);
    cairo_stroke(cr);

    /* vertical (σ axis) */
    cairo_move_to(cr, ox, ay);
    cairo_line_to(cr, ox, ay + ah);
    cairo_stroke(cr);

    /* axis labels */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    /* ε label */
    cairo_move_to(cr, ax + aw - 4, oy + 14.0);
    cairo_show_text(cr, "\xce\xb5");

    /* σ label */
    cairo_move_to(cr, ox + 4, ay + 12.0);
    cairo_show_text(cr, "\xcf\x83");

    /* ── elastic line ── */
    /* draw from (eps_lo, E*eps_lo) to (eps_hi, E*eps_hi) */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                         MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);

    double line_sig_lo = E * eps_lo;
    double line_sig_hi = E * eps_hi;

    /* clamp to panel */
    double x0 = SPX(eps_lo),  y0 = SPY(line_sig_lo);
    double x1 = SPX(eps_hi),  y1 = SPY(line_sig_hi);
    y0 = fmax(ay, fmin(ay + ah, y0));
    y1 = fmax(ay, fmin(ay + ah, y1));

    cairo_move_to(cr, x0, y0);
    cairo_line_to(cr, x1, y1);
    cairo_stroke(cr);

    /* E label on the line */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                         MX_SAPPHIRE_B);
    cairo_move_to(cr, (x0 + x1)/2.0 + 4, (y0 + y1)/2.0 - 4);
    cairo_show_text(cr, "E");

    /* ── operating point dot ── */
    double dot_x = SPX(eps);
    double dot_y = SPY(sigma);

    /* shadow */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
    cairo_arc(cr, dot_x + 1, dot_y + 1, 6.0, 0, 2*M_PI);
    cairo_fill(cr);

    /* dot */
    cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
    cairo_arc(cr, dot_x, dot_y, 6.0, 0, 2*M_PI);
    cairo_fill(cr);

    /* dashed drop lines to axes */
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.6);
    cairo_set_line_width(cr, 0.8);
    cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
    cairo_move_to(cr, dot_x, dot_y); cairo_line_to(cr, dot_x, oy);
    cairo_stroke(cr);
    cairo_move_to(cr, dot_x, dot_y); cairo_line_to(cr, ox, dot_y);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── axis tick labels ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    /* ε value under the dot */
    snprintf(label, sizeof(label), "%.3g", eps);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, dot_x - te.width/2.0, oy + 12.0);
        cairo_show_text(cr, label);
    }

    /* σ value left of the dot */
    snprintf(label, sizeof(label), "%.3g", sigma);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ox - te.width - 4, dot_y + 4.0);
        cairo_show_text(cr, label);
    }

#undef SPX
#undef SPY

    /* ── panel title ── */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    cairo_move_to(cr, px + pw/2.0 - 34, py + 14.0);
    cairo_show_text(cr, "\xcf\x83-\xce\xb5  diagram");
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_stress_plot
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    draw_stress_plot
 *************************************************************/
void draw_stress_plot(cairo_t *cr, int w, int h,
                      const GraphData *gd)
{
    double F     = gd->x_data[0];
    double A     = gd->x_data[1];
    double E     = gd->x_data[2];
    double L     = gd->x_data[3];
    double sigma = gd->y_data[0];
    double eps   = gd->y_data[1];
    double delta = gd->y_data[2];

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
        const char *title = "Axial Stress / Strain";
        cairo_text_extents_t te;
        cairo_text_extents(cr, title, &te);
        cairo_move_to(cr, w/2.0 - te.width/2.0, 26.0);
        cairo_show_text(cr, title);
    }

    /* ── two side-by-side panels ── */
    double pad   = 12.0;
    double top   = 38.0;
    double bot   = 12.0;
    double mid   = w / 2.0;

    /* left: member diagram */
    draw_member_panel(cr,
                      pad, top,
                      mid - pad * 1.5, h - top - bot,
                      F, A, L, sigma, eps, delta);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    /* right: stress-strain plot */
    draw_ss_panel(cr,
                  mid + pad * 0.5, top,
                  mid - pad * 1.5, h - top - bot,
                  sigma, eps, E);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_stress
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    graph_window_open_stress
 *************************************************************/
void graph_window_open_stress(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    F, A, E, L;
    double    sigma, eps, delta;
    double    x_data[4];
    double    y_data[4] = {0};

    pipe_transact("$stress_F\n",     buf, sizeof(buf)); F     = atof(buf);
    pipe_transact("$stress_A\n",     buf, sizeof(buf)); A     = atof(buf);
    pipe_transact("$stress_E\n",     buf, sizeof(buf)); E     = atof(buf);
    pipe_transact("$stress_L\n",     buf, sizeof(buf)); L     = atof(buf);
    pipe_transact("$stress_sigma\n", buf, sizeof(buf)); sigma = atof(buf);
    pipe_transact("$stress_eps\n",   buf, sizeof(buf)); eps   = atof(buf);
    pipe_transact("$stress_delta\n", buf, sizeof(buf)); delta = atof(buf);

    x_data[0] = F;
    x_data[1] = A;
    x_data[2] = E;
    x_data[3] = L;

    y_data[0] = sigma;
    y_data[1] = eps;
    y_data[2] = delta;

    graph_window_open_vars("Axial Stress / Strain", PLOT_STRESS,
                           "", "",
                           x_data, y_data, 4);
}
