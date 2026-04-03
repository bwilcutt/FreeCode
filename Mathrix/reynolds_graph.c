#include "reynolds_graph.h"
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

/* ── regime colors ── */
#define LAM_R   MX_SAPPHIRE_R
#define LAM_G   MX_SAPPHIRE_G
#define LAM_B   MX_SAPPHIRE_B
#define TRANS_R MX_YELLOW_R
#define TRANS_G MX_YELLOW_G
#define TRANS_B MX_YELLOW_B
#define TURB_R  MX_RED_R
#define TURB_G  MX_RED_G
#define TURB_B  MX_RED_B

/* ═══════════════════════════════════════════════════════════
   LEFT PANEL — pipe cross-section with velocity profile
   ═══════════════════════════════════════════════════════════ */
static void draw_pipe_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double V, double D,
                             double nu, double rho, double mu,
                             double Re, int regime)
{
    char   label[64];
    double cx  = px + pw / 2.0;
    double cy  = py + ph / 2.0;

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── pipe geometry ── */
    double pipe_r  = ph * 0.28;
    double pipe_x0 = px + pw * 0.12;
    double pipe_x1 = px + pw * 0.88;
    double pipe_w  = pipe_x1 - pipe_x0;

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
                          MX_SURFACE1_B, 0.3);
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

    /* pipe interior fill */
    cairo_set_source_rgba(cr, MX_CRUST_R, MX_CRUST_G, MX_CRUST_B, 0.5);
    cairo_rectangle(cr, pipe_x0, cy - pipe_r, pipe_w, pipe_r * 2);
    cairo_fill(cr);

    /* ── velocity profile ── */
    double pr, pg, pb;
    if (regime == 0)      { pr = LAM_R;   pg = LAM_G;   pb = LAM_B;   }
    else if (regime == 1) { pr = TRANS_R; pg = TRANS_G; pb = TRANS_B; }
    else                  { pr = TURB_R;  pg = TURB_G;  pb = TURB_B;  }

    double prof_max = pipe_w * 0.38;
    int    n_pts    = 48;
    double x_prof   = pipe_x0 + pipe_w * 0.35;

    /* filled profile area */
    cairo_set_source_rgba(cr, pr, pg, pb, 0.20);
    cairo_move_to(cr, x_prof, cy - pipe_r);
    for (int i = 0; i <= n_pts; i++)
    {
        double t   = (double)i / n_pts;
        double r   = (t - 0.5) * 2.0;
        double vel;
        if (regime == 0)
            vel = prof_max * (1.0 - r*r);
        else if (regime == 1)
            vel = prof_max * pow(1.0 - fabs(r), 1.0/5.0);
        else
            vel = prof_max * pow(1.0 - fabs(r), 1.0/7.0);
        cairo_line_to(cr, x_prof + vel, cy - pipe_r + t * pipe_r * 2);
    }
    cairo_line_to(cr, x_prof, cy + pipe_r);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* profile outline */
    cairo_set_source_rgb(cr, pr, pg, pb);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, x_prof, cy - pipe_r);
    for (int i = 0; i <= n_pts; i++)
    {
        double t   = (double)i / n_pts;
        double r   = (t - 0.5) * 2.0;
        double vel;
        if (regime == 0)
            vel = prof_max * (1.0 - r*r);
        else if (regime == 1)
            vel = prof_max * pow(1.0 - fabs(r), 1.0/5.0);
        else
            vel = prof_max * pow(1.0 - fabs(r), 1.0/7.0);
        cairo_line_to(cr, x_prof + vel, cy - pipe_r + t * pipe_r * 2);
    }
    cairo_stroke(cr);

    /* ── flow arrows ── */
    int    n_arrows   = 7;
    double arrow_x0   = pipe_x0 + pipe_w * 0.62;
    double arrow_head = 7.0;

    cairo_set_source_rgb(cr, pr, pg, pb);
    cairo_set_line_width(cr, 1.5);
    for (int i = 0; i < n_arrows; i++)
    {
        double t   = (double)i / (n_arrows - 1);
        double r   = (t - 0.5) * 2.0;
        double ay  = cy - pipe_r + t * pipe_r * 2;
        double vel;
        if (regime == 0)
            vel = prof_max * (1.0 - r*r);
        else if (regime == 1)
            vel = prof_max * pow(1.0 - fabs(r), 1.0/5.0);
        else
            vel = prof_max * pow(1.0 - fabs(r), 1.0/7.0);

        double ax1 = arrow_x0;
        double ax2 = arrow_x0 + vel;
        if (ax2 <= ax1 + 4) continue;

        cairo_move_to(cr, ax1, ay);
        cairo_line_to(cr, ax2, ay);
        cairo_stroke(cr);
        cairo_move_to(cr, ax2, ay);
        cairo_line_to(cr, ax2 - arrow_head, ay - arrow_head * 0.4);
        cairo_move_to(cr, ax2, ay);
        cairo_line_to(cr, ax2 - arrow_head, ay + arrow_head * 0.4);
        cairo_stroke(cr);
    }

    /* ── diameter dimension line ── */
    {
        double dim_x = pipe_x0 - 22.0;
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
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, dim_x - te.width/2.0, cy + pipe_r + 14);
        cairo_show_text(cr, label);
    }

    /* ── labels ── */
    double ry = py + 18.0;
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    snprintf(label, sizeof(label), "V = %.3g m/s", V);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_move_to(cr, px + 8, ry); ry += 15;
    cairo_show_text(cr, label);

    if (nu > 0)
    {
        snprintf(label, sizeof(label), "\xce\xbd = %.3g m\xc2\xb2/s", nu);
        cairo_move_to(cr, px + 8, ry); ry += 15;
        cairo_show_text(cr, label);
    }
    else
    {
        snprintf(label, sizeof(label), "\xcf\x81 = %.3g kg/m\xc2\xb3", rho);
        cairo_move_to(cr, px + 8, ry); ry += 15;
        cairo_show_text(cr, label);
        snprintf(label, sizeof(label), "\xce\xbc = %.3g Pa\xc2\xb7s", mu);
        cairo_move_to(cr, px + 8, ry); ry += 15;
        cairo_show_text(cr, label);
    }

    /* ── regime label ── */
    const char *regime_str = (regime == 0) ? "Laminar"
                           : (regime == 1) ? "Transitional"
                                           : "Turbulent";
    cairo_set_font_size(cr, 13.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, pr, pg, pb);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, regime_str, &te);
        cairo_move_to(cr, cx - te.width/2.0, py + ph - 14.0);
        cairo_show_text(cr, regime_str);
    }
}

/* ═══════════════════════════════════════════════════════════
   RIGHT PANEL — log-scale Re number line
   ═══════════════════════════════════════════════════════════ */
static void draw_re_panel(cairo_t *cr,
                           double px, double py,
                           double pw, double ph,
                           double Re, int regime)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── bar geometry ── */
    double pad_l  = 20.0;
    double pad_r  = 20.0;
    double bar_y  = py + ph * 0.45;
    double bar_h  = 28.0;
    double bar_x0 = px + pad_l;
    double bar_x1 = px + pw - pad_r;
    double bar_w  = bar_x1 - bar_x0;

    double log_lo = log10(100.0);
    double log_hi = log10(1.0e6);

#define REX(re) (bar_x0 + (log10(re) - log_lo) / (log_hi - log_lo) * bar_w)

    double x_lam   = REX(2300.0);
    double x_trans = REX(4000.0);

    /* ── colored zone rectangles ── */
    cairo_set_source_rgba(cr, LAM_R, LAM_G, LAM_B, 0.35);
    cairo_rectangle(cr, bar_x0, bar_y, x_lam - bar_x0, bar_h);
    cairo_fill(cr);

    cairo_set_source_rgba(cr, TRANS_R, TRANS_G, TRANS_B, 0.35);
    cairo_rectangle(cr, x_lam, bar_y, x_trans - x_lam, bar_h);
    cairo_fill(cr);

    cairo_set_source_rgba(cr, TURB_R, TURB_G, TURB_B, 0.35);
    cairo_rectangle(cr, x_trans, bar_y, bar_x1 - x_trans, bar_h);
    cairo_fill(cr);

    /* bar outline */
    cairo_set_source_rgb(cr, MX_SURFACE1_R, MX_SURFACE1_G, MX_SURFACE1_B);
    cairo_set_line_width(cr, 0.5);
    cairo_rectangle(cr, bar_x0, bar_y, bar_w, bar_h);
    cairo_stroke(cr);

    /* zone boundary lines */
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.8);
    cairo_set_line_width(cr, 1.0);
    cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
    cairo_move_to(cr, x_lam,  bar_y);
    cairo_line_to(cr, x_lam,  bar_y + bar_h);
    cairo_stroke(cr);
    cairo_move_to(cr, x_trans, bar_y);
    cairo_line_to(cr, x_trans, bar_y + bar_h);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── zone labels inside bar ── */
    cairo_set_font_size(cr, 9.5);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    double bar_cy = bar_y + bar_h / 2.0 + 4.0;

    cairo_set_source_rgb(cr, LAM_R, LAM_G, LAM_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Laminar", &te);
        double mx = (bar_x0 + x_lam) / 2.0;
        if (te.width < x_lam - bar_x0 - 4)
        {
            cairo_move_to(cr, mx - te.width/2.0, bar_cy);
            cairo_show_text(cr, "Laminar");
        }
    }

    cairo_set_source_rgb(cr, TRANS_R * 0.7, TRANS_G * 0.7, 0.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Trans.", &te);
        double mx = (x_lam + x_trans) / 2.0;
        if (te.width < x_trans - x_lam - 2)
        {
            cairo_move_to(cr, mx - te.width/2.0, bar_cy);
            cairo_show_text(cr, "Trans.");
        }
    }

    cairo_set_source_rgb(cr, TURB_R, TURB_G, TURB_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Turbulent", &te);
        double mx = (x_trans + bar_x1) / 2.0;
        if (te.width < bar_x1 - x_trans - 4)
        {
            cairo_move_to(cr, mx - te.width/2.0, bar_cy);
            cairo_show_text(cr, "Turbulent");
        }
    }

    /* ── log scale tick marks and labels ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    double tick_powers[]      = { 2, 3, 4, 5, 6 };
    const char *tick_labels[] = { "100", "1k", "10k", "100k", "1M" };
    int n_ticks = 5;

    for (int i = 0; i < n_ticks; i++)
    {
        double tx = bar_x0 + (tick_powers[i] - log_lo) /
                    (log_hi - log_lo) * bar_w;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.8);
        cairo_move_to(cr, tx, bar_y + bar_h);
        cairo_line_to(cr, tx, bar_y + bar_h + 5);
        cairo_stroke(cr);

        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, tick_labels[i], &te);
        cairo_move_to(cr, tx - te.width/2.0, bar_y + bar_h + 15);
        cairo_show_text(cr, tick_labels[i]);
    }

    /* boundary value labels */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_font_size(cr, 8.5);
    cairo_move_to(cr, x_lam  - 14, bar_y - 4);
    cairo_show_text(cr, "2300");
    cairo_move_to(cr, x_trans - 14, bar_y - 4);
    cairo_show_text(cr, "4000");

    /* ── current Re marker ── */
    double re_clamped = Re < 100.0 ? 100.0 : (Re > 1e6 ? 1e6 : Re);
    double marker_x   = REX(re_clamped);

    double mr, mg, mb;
    if (regime == 0)      { mr = LAM_R;   mg = LAM_G;   mb = LAM_B;   }
    else if (regime == 1) { mr = TRANS_R; mg = TRANS_G; mb = TRANS_B; }
    else                  { mr = TURB_R;  mg = TURB_G;  mb = TURB_B;  }

    /* shadow */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
    cairo_move_to(cr, marker_x + 1, bar_y - 2);
    cairo_line_to(cr, marker_x + 1, bar_y + bar_h + 2);
    cairo_set_line_width(cr, 3.5);
    cairo_stroke(cr);

    /* marker line */
    cairo_set_source_rgb(cr, mr, mg, mb);
    cairo_set_line_width(cr, 2.5);
    cairo_move_to(cr, marker_x, bar_y - 2);
    cairo_line_to(cr, marker_x, bar_y + bar_h + 2);
    cairo_stroke(cr);

    /* marker triangle above bar */
    cairo_move_to(cr, marker_x,     bar_y - 2);
    cairo_line_to(cr, marker_x - 6, bar_y - 12);
    cairo_line_to(cr, marker_x + 6, bar_y - 12);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* Re value label above marker */
    snprintf(label, sizeof(label), "Re = %.0f", Re);
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        double lx = marker_x - te.width/2.0;
        if (lx < px + 4)                  lx = px + 4;
        if (lx + te.width > px + pw - 4)  lx = px + pw - 4 - te.width;
        cairo_move_to(cr, lx, bar_y - 16);
        cairo_show_text(cr, label);
    }

    /* ── panel title ── */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    cairo_move_to(cr, px + pw/2.0 - 40, py + 14.0);
    cairo_show_text(cr, "Flow regime");

#undef REX
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_reynolds_plot
   ═══════════════════════════════════════════════════════════ */

void draw_reynolds_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd)
{
    double V      = gd->x_data[0];
    double D      = gd->x_data[1];
    double nu     = gd->x_data[2];
    double rho    = gd->x_data[3];
    double mu     = gd->x_data[4];
    double Re     = gd->y_data[0];
    int    regime = (int)(gd->y_data[1] + 0.5);

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
        const char *title = "Reynolds Number";
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

    draw_pipe_panel(cr,
                    pad, top,
                    mid - pad * 1.5, h - top - bot,
                    V, D, nu, rho, mu, Re, regime);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_re_panel(cr,
                  mid + pad * 0.5, top,
                  mid - pad * 1.5, h - top - bot,
                  Re, regime);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_reynolds
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_reynolds(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    V, D, nu, rho, mu, Re, regime;
    double    x_data[5];
    double    y_data[5] = {0};

    pipe_transact("$reynolds_V\n",      buf, sizeof(buf)); V      = atof(buf);
    pipe_transact("$reynolds_D\n",      buf, sizeof(buf)); D      = atof(buf);
    pipe_transact("$reynolds_nu\n",     buf, sizeof(buf)); nu     = atof(buf);
    pipe_transact("$reynolds_rho\n",    buf, sizeof(buf)); rho    = atof(buf);
    pipe_transact("$reynolds_mu\n",     buf, sizeof(buf)); mu     = atof(buf);
    pipe_transact("$Re\n",              buf, sizeof(buf)); Re     = atof(buf);
    pipe_transact("$reynolds_regime\n", buf, sizeof(buf)); regime = atof(buf);

    x_data[0] = V;
    x_data[1] = D;
    x_data[2] = nu;
    x_data[3] = rho;
    x_data[4] = mu;

    y_data[0] = Re;
    y_data[1] = regime;

    graph_window_open_vars("Reynolds Number", PLOT_REYNOLDS,
                           "", "",
                           x_data, y_data, 5);
}
