#include "mohr_graph.h"
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

/* ── local Cairo color aliases (same as graph.c) ── */
#define COL_PANEL_R  MX_GRAPH_PANEL_R
#define COL_PANEL_G  MX_GRAPH_PANEL_G
#define COL_PANEL_B  MX_GRAPH_PANEL_B
#define COL_GRID_R   MX_GRAPH_GRID_R
#define COL_GRID_G   MX_GRAPH_GRID_G
#define COL_GRID_B   MX_GRAPH_GRID_B
#define COL_TEXT_R   MX_GRAPH_TEXT_R
#define COL_TEXT_G   MX_GRAPH_TEXT_G
#define COL_TEXT_B   MX_GRAPH_TEXT_B

/* ── forward declaration of draw_stress_element ── */
static void draw_stress_element_impl(cairo_t *cr,
                                     double ex, double ey,
                                     double epw, double eph,
                                     double sig_x, double sig_y,
                                     double tau_xy, double angle_deg,
                                     const char *title);

/* nice_range is needed for grid lines — local copy ── */
static void mohr_nice_range(double lo, double hi,
                             double *out_lo, double *out_hi,
                             double *out_step)
{
    double range = hi - lo;
    double mag, step;
    if (range < 1e-12) range = 1.0;
    mag  = pow(10.0, floor(log10(range / 6.0)));
    step = mag;
    if      (range / (mag * 10) < 1.5) step = mag;
    else if (range / (mag * 10) < 3.5) step = mag * 2;
    else if (range / (mag * 10) < 7.5) step = mag * 5;
    else                                step = mag * 10;
    *out_step = step;
    *out_lo   = floor(lo / step) * step;
    *out_hi   = ceil (hi / step) * step;
}

/*************************************************************
 * Function:    draw_mohr_plot
 *************************************************************/
void draw_mohr_plot(cairo_t *cr, int w, int h,
                    const GraphData *gd)
{
    double sx    = gd->x_data[0];
    double sy    = gd->x_data[1];
    double txy   = gd->x_data[2];
    double s1    = gd->y_data[0];
    double s2    = gd->y_data[1];
    double tmax  = gd->y_data[2];

    double s_avg  = (sx + sy) / 2.0;
    double radius = tmax;

    /* ── layout — circle left 60%, elements right 40% ── */
    double circle_w = w * 0.60;
    double pad    = 60.0;
    double cx     = circle_w / 2.0;
    double cy     = h / 2.0;
    double range  = radius * 1.5;
    if (range < 1.0) range = 1.0;

    double avail  = fmin(circle_w - 2*pad, h - 2*pad) / 2.0;
    double scale  = avail / range;

    #define PX(sigma)  (cx + ((sigma) - s_avg) * scale)
    #define PY(tau)    (cy - (tau) * scale)

    char label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, pad/2, pad/2, circle_w - pad, h - pad);
    cairo_fill(cr);

    /* ── grid lines ── */
    cairo_set_source_rgba(cr, COL_GRID_R, COL_GRID_G, COL_GRID_B, 0.9);
    cairo_set_line_width(cr, 1.0);
    cairo_set_dash(cr, (double[]){4.0,4.0}, 2, 0);
    {
        double step, lo, hi;
        mohr_nice_range(-tmax*1.3, tmax*1.3, &lo, &hi, &step);
        for (double t = lo; t <= hi + step*0.01; t += step)
        {
            double py = PY(t);
            if (py < pad/2 || py > h - pad/2) continue;
            cairo_move_to(cr, pad/2, py);
            cairo_line_to(cr, circle_w - pad/2, py);
            cairo_stroke(cr);
        }
    }
    {
        double step, lo, hi;
        mohr_nice_range(s2 - range*0.3, s1 + range*0.3, &lo, &hi, &step);
        for (double s = lo; s <= hi + step*0.01; s += step)
        {
            double px = PX(s);
            if (px < pad/2 || px > circle_w - pad/2) continue;
            cairo_move_to(cr, px, pad/2);
            cairo_line_to(cr, px, h - pad/2);
            cairo_stroke(cr);
        }
    }
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── sigma axis ── */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.8);
    cairo_move_to(cr, pad/2, cy);
    cairo_line_to(cr, circle_w - pad/2, cy);
    cairo_stroke(cr);

    /* ── tau axis ── */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.8);
    cairo_move_to(cr, cx, pad/2);
    cairo_line_to(cr, cx, h - pad/2);
    cairo_stroke(cr);

    /* ── axis labels ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 13.0);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_move_to(cr, circle_w - pad/2 + 4, cy + 5);
    cairo_show_text(cr, "\xcf\x83");   /* σ UTF-8 */
    cairo_move_to(cr, cx + 4, pad/2 - 6);
    cairo_show_text(cr, "\xcf\x84");   /* τ UTF-8 */

    /* ── the circle ── */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
    cairo_arc(cr, cx + 2, cy + 2, radius * scale, 0, 2*M_PI);
    cairo_set_line_width(cr, 3.0);
    cairo_stroke(cr);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_arc(cr, cx, cy, radius * scale, 0, 2*M_PI);
    cairo_stroke(cr);
    cairo_arc(cr, cx, cy, radius * scale, 0, 2*M_PI);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.08);
    cairo_fill(cr);

    /* ── dashed lines A-B and drops ── */
    cairo_set_source_rgba(cr, MX_OVERLAY2_R, MX_OVERLAY2_G,
                          MX_OVERLAY2_B, 0.9);
    cairo_set_line_width(cr, 1.2);
    cairo_set_dash(cr, (double[]){4.0,3.0}, 2, 0);
    cairo_move_to(cr, PX(sx), PY(txy));
    cairo_line_to(cr, PX(sx), cy);
    cairo_stroke(cr);
    cairo_move_to(cr, PX(sy), PY(-txy));
    cairo_line_to(cr, PX(sy), cy);
    cairo_stroke(cr);
    cairo_move_to(cr, PX(sx), PY(txy));
    cairo_line_to(cr, PX(sy), PY(-txy));
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── labeled point helper ── */
    #define DRAW_POINT(px_, py_, r_, gr_, gg_, gb_, lbl_, lx_, ly_) \
    do { \
        cairo_set_source_rgb(cr, 0.05, 0.05, 0.10); \
        cairo_arc(cr, (px_)+1, (py_)+1, (r_)+1, 0, 2*M_PI); \
        cairo_fill(cr); \
        cairo_set_source_rgb(cr, (gr_), (gg_), (gb_)); \
        cairo_arc(cr, (px_), (py_), (r_), 0, 2*M_PI); \
        cairo_fill(cr); \
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B); \
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, \
                               CAIRO_FONT_WEIGHT_NORMAL); \
        cairo_set_font_size(cr, 11.0); \
        cairo_move_to(cr, (lx_), (ly_)); \
        cairo_show_text(cr, (lbl_)); \
    } while(0)

    snprintf(label, sizeof(label), "\xcf\x83\xe2\x82\x82=%.3g", s2);
    DRAW_POINT(PX(s2), cy, 5.0,
               MX_MAUVE_R, MX_MAUVE_G, MX_MAUVE_B,
               label, PX(s2) - 8, cy + 20);

    snprintf(label, sizeof(label), "\xcf\x83\xe2\x82\x81=%.3g", s1);
    DRAW_POINT(PX(s1), cy, 5.0,
               MX_GREEN_R, MX_GREEN_G, MX_GREEN_B,
               label, PX(s1) - 8, cy + 20);

    snprintf(label, sizeof(label), "\xcf\x84max=%.3g", tmax);
    DRAW_POINT(cx, PY(tmax), 5.0,
               MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B,
               label, cx + 8, PY(tmax) - 4);

    snprintf(label, sizeof(label), "A(%.3g, %.3g)", sx, txy);
    DRAW_POINT(PX(sx), PY(txy), 5.0,
               MX_PEACH_R, MX_PEACH_G, MX_PEACH_B,
               label, PX(sx) + 8, PY(txy) - 4);

    snprintf(label, sizeof(label), "B(%.3g, %.3g)", sy, -txy);
    DRAW_POINT(PX(sy), PY(-txy), 5.0,
               MX_PEACH_R, MX_PEACH_G, MX_PEACH_B,
               label, PX(sy) + 8, PY(-txy) + 14);

    snprintf(label, sizeof(label), "C=%.3g", s_avg);
    DRAW_POINT(cx, cy, 4.0,
               MX_TEAL_R, MX_TEAL_G, MX_TEAL_B,
               label, cx + 6, cy - 8);

    /* ── theta annotation ── */
    if (gd->n >= 4)
    {
        double theta = gd->y_data[3];
        snprintf(label, sizeof(label), "\xce\xb8p = %.2f\xc2\xb0", theta);
        cairo_select_font_face(cr, "Sans",
                               CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_font_size(cr, 11.0);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_move_to(cr, pad/2 + 4, h - pad/2 - 6);
        cairo_show_text(cr, label);
    }

    /* ── stress element panels ── */
    {
        double theta = (gd->n >= 4) ? gd->y_data[3] : 0.0;
        double ex    = circle_w + 8;
        double epw   = w - ex - 8;
        double eph   = (h - 50) / 2.0 - 4;
        double ey1   = 30;
        double ey2   = ey1 + eph + 10;

        draw_stress_element_impl(cr, ex, ey1, epw, eph,
                                 sx, sy, txy, 0.0,
                                 "Original element");
        draw_stress_element_impl(cr, ex, ey2, epw, eph,
                                 s1, s2, 0.0, theta,
                                 "Principal element");
    }

    #undef PX
    #undef PY
    #undef DRAW_POINT
}

/*************************************************************
 * Function:    draw_stress_element (public wrapper)
 *************************************************************/
void draw_stress_element(cairo_t *cr,
                          double ex, double ey,
                          double epw, double eph,
                          double sig_x, double sig_y,
                          double tau_xy, double angle_deg,
                          const char *title)
{
    draw_stress_element_impl(cr, ex, ey, epw, eph,
                             sig_x, sig_y, tau_xy,
                             angle_deg, title);
}

/*************************************************************
 * Function:    draw_stress_element_impl (internal)
 *************************************************************/
static void draw_stress_element_impl(cairo_t *cr,
                                     double ex, double ey,
                                     double epw, double eph,
                                     double sig_x, double sig_y,
                                     double tau_xy, double angle_deg,
                                     const char *title)
{
    double cx     = ex + epw / 2.0;
    double cy     = ey + eph / 2.0 + 6;
    double size   = fmin(epw, eph) * 0.18;
    double ang    = angle_deg * M_PI / 180.0;
    double arrow  = size * 0.65;
    double head   = 6.0;
    char   label[32];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, MX_CRUST_R, MX_CRUST_G, MX_CRUST_B);
    cairo_rectangle(cr, ex, ey, epw, eph);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SURFACE0_R, MX_SURFACE0_G, MX_SURFACE0_B);
    cairo_set_line_width(cr, 0.5);
    cairo_rectangle(cr, ex, ey, epw, eph);
    cairo_stroke(cr);

    /* ── panel title ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 10.0);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_move_to(cr, ex + 6, ey + 13);
    cairo_show_text(cr, title);

    /* ── arrow + label helper ── */
    #define ARROW_LBL(x0, y0, dx, dy, r, g, b, lbl, lox, loy) \
    do { \
        double _ex2 = (x0) + (dx); \
        double _ey2 = (y0) + (dy); \
        double _len = sqrt((dx)*(dx)+(dy)*(dy)); \
        double _ux = (_len>0) ? (dx)/_len : 0; \
        double _uy = (_len>0) ? (dy)/_len : 0; \
        cairo_set_source_rgb(cr, (r), (g), (b)); \
        cairo_set_line_width(cr, 1.5); \
        cairo_move_to(cr, (x0), (y0)); \
        cairo_line_to(cr, _ex2, _ey2); \
        cairo_stroke(cr); \
        cairo_move_to(cr, _ex2, _ey2); \
        cairo_line_to(cr, _ex2 - _ux*head + _uy*head*0.4, \
                          _ey2 - _uy*head - _ux*head*0.4); \
        cairo_move_to(cr, _ex2, _ey2); \
        cairo_line_to(cr, _ex2 - _ux*head - _uy*head*0.4, \
                          _ey2 - _uy*head + _ux*head*0.4); \
        cairo_stroke(cr); \
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, \
                               CAIRO_FONT_WEIGHT_NORMAL); \
        cairo_set_font_size(cr, 8.5); \
        cairo_set_source_rgb(cr, (r), (g), (b)); \
        cairo_move_to(cr, (x0)+(dx)+(lox), (y0)+(dy)+(loy)); \
        cairo_show_text(cr, (lbl)); \
    } while(0)

    double ux =  cos(ang);   double uy =  sin(ang);
    double vx = -sin(ang);   double vy =  cos(ang);

    /* ── element square ── */
    cairo_move_to(cr, cx + (-ux-vx)*size, cy + (-uy-vy)*size);
    cairo_line_to(cr, cx + ( ux-vx)*size, cy + ( uy-vy)*size);
    cairo_line_to(cr, cx + ( ux+vx)*size, cy + ( uy+vy)*size);
    cairo_line_to(cr, cx + (-ux+vx)*size, cy + (-uy+vy)*size);
    cairo_close_path(cr);
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.30);
    cairo_fill_preserve(cr);
    cairo_set_source_rgb(cr, MX_SURFACE2_R, MX_SURFACE2_G, MX_SURFACE2_B);
    cairo_set_line_width(cr, 1.5);
    cairo_stroke(cr);

    /* ── normal stress arrows ── */
    snprintf(label, sizeof(label), "%.3g", sig_x);
    {
        double fx = cx + ux*size, fy = cy + uy*size;
        double r_ = sig_x >= 0 ? MX_GREEN_R : MX_RED_R;
        double g_ = sig_x >= 0 ? MX_GREEN_G : MX_RED_G;
        double b_ = sig_x >= 0 ? MX_GREEN_B : MX_RED_B;
        double dir = sig_x >= 0 ? 1.0 : -1.0;
        ARROW_LBL(fx, fy, ux*arrow*dir, uy*arrow*dir, r_, g_, b_, label, 2, -3);
    }
    {
        double fx = cx - ux*size, fy = cy - uy*size;
        double r_ = sig_x >= 0 ? MX_GREEN_R : MX_RED_R;
        double g_ = sig_x >= 0 ? MX_GREEN_G : MX_RED_G;
        double b_ = sig_x >= 0 ? MX_GREEN_B : MX_RED_B;
        double dir = sig_x >= 0 ? -1.0 : 1.0;
        ARROW_LBL(fx, fy, ux*arrow*dir, uy*arrow*dir, r_, g_, b_, label, -28, -3);
    }

    snprintf(label, sizeof(label), "%.3g", sig_y);
    {
        double fx = cx + vx*size, fy = cy + vy*size;
        double r_ = sig_y >= 0 ? MX_GREEN_R : MX_RED_R;
        double g_ = sig_y >= 0 ? MX_GREEN_G : MX_RED_G;
        double b_ = sig_y >= 0 ? MX_GREEN_B : MX_RED_B;
        double dir = sig_y >= 0 ? 1.0 : -1.0;
        ARROW_LBL(fx, fy, vx*arrow*dir, vy*arrow*dir, r_, g_, b_, label, 3, -3);
    }
    {
        double fx = cx - vx*size, fy = cy - vy*size;
        double r_ = sig_y >= 0 ? MX_GREEN_R : MX_RED_R;
        double g_ = sig_y >= 0 ? MX_GREEN_G : MX_RED_G;
        double b_ = sig_y >= 0 ? MX_GREEN_B : MX_RED_B;
        double dir = sig_y >= 0 ? -1.0 : 1.0;
        ARROW_LBL(fx, fy, vx*arrow*dir, vy*arrow*dir, r_, g_, b_, label, 3, 10);
    }

    /* ── shear stress arrows ── */
    if (fabs(tau_xy) > 1e-12)
    {
        snprintf(label, sizeof(label), "%.3g", fabs(tau_xy));
        {
            double fx = cx + ux*size, fy = cy + uy*size;
            double dir = tau_xy >= 0 ? 1.0 : -1.0;
            ARROW_LBL(fx, fy, vx*arrow*0.65*dir, vy*arrow*0.65*dir,
                      MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, label, 3, 0);
        }
        {
            double fx = cx - ux*size, fy = cy - uy*size;
            double dir = tau_xy >= 0 ? -1.0 : 1.0;
            ARROW_LBL(fx, fy, vx*arrow*0.65*dir, vy*arrow*0.65*dir,
                      MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, label, -28, 0);
        }
        {
            double fx = cx + vx*size, fy = cy + vy*size;
            double dir = tau_xy >= 0 ? 1.0 : -1.0;
            ARROW_LBL(fx, fy, ux*arrow*0.65*dir, uy*arrow*0.65*dir,
                      MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, label, 3, -3);
        }
        {
            double fx = cx - vx*size, fy = cy - vy*size;
            double dir = tau_xy >= 0 ? -1.0 : 1.0;
            ARROW_LBL(fx, fy, ux*arrow*0.65*dir, uy*arrow*0.65*dir,
                      MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, label, 3, 10);
        }
    }

    /* ── rotation angle label ── */
    if (fabs(angle_deg) > 0.01)
    {
        snprintf(label, sizeof(label), "\xce\xb8p=%.1f\xc2\xb0", angle_deg);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_move_to(cr, ex + epw - 52, ey + eph - 6);
        cairo_show_text(cr, label);
    }

    #undef ARROW_LBL
}

/*************************************************************
 * Function:    graph_window_open_mohr
 *************************************************************/
void graph_window_open_mohr(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    sx, sy, txy, s1, s2, tmax, theta;
    double    x_data[3];
    double    y_data[4];

    pipe_transact("$mohrs_s1\n",    buf, sizeof(buf)); s1    = atof(buf);
    pipe_transact("$mohrs_s2\n",    buf, sizeof(buf)); s2    = atof(buf);
    pipe_transact("$mohrs_tmax\n",  buf, sizeof(buf)); tmax  = atof(buf);
    pipe_transact("$mohrs_theta\n", buf, sizeof(buf)); theta = atof(buf);
    pipe_transact("$mohrs_sx\n",    buf, sizeof(buf)); sx    = atof(buf);
    pipe_transact("$mohrs_sy\n",    buf, sizeof(buf)); sy    = atof(buf);
    pipe_transact("$mohrs_txy\n",   buf, sizeof(buf)); txy   = atof(buf);

    x_data[0] = sx;   x_data[1] = sy;   x_data[2] = txy;
    y_data[0] = s1;   y_data[1] = s2;
    y_data[2] = tmax; y_data[3] = theta;

    graph_window_open_vars("Mohr's Circle", PLOT_MOHR,
                           "\xcf\x83", "\xcf\x84",
                           x_data, y_data, 4);
}
