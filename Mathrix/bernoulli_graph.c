#include "bernoulli_graph.h"
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

/* ── head component colors ── */
/* elevation head z      — yellow */
/* pressure head P/ρg    — blue   */
/* velocity head V²/2g   — green  */

/* ── helper: draw a pressure arrow ── */
static void draw_pressure_arrow(cairo_t *cr,
                                 double x, double y,
                                 double length,   /* positive = pointing right */
                                 double r, double g, double b)
{
    cairo_set_source_rgb(cr, r, g, b);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x + length, y);
    cairo_stroke(cr);

    /* arrowhead */
    double dir  = (length >= 0) ? 1.0 : -1.0;
    double tip  = x + length;
    double size = 8.0;
    cairo_move_to(cr, tip, y);
    cairo_line_to(cr, tip - dir*size, y - size*0.4);
    cairo_move_to(cr, tip, y);
    cairo_line_to(cr, tip - dir*size, y + size*0.4);
    cairo_stroke(cr);
}

/* ═══════════════════════════════════════════════════════════
   LEFT PANEL — pipe cross-section at two elevations
   ═══════════════════════════════════════════════════════════ */

static void draw_pipe_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double P1, double V1, double z1,
                             double P2, double V2, double z2,
                             double rho, double g)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── ground datum line ── */
    double datum_y = py + ph * 0.80;
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.5);
    cairo_set_line_width(cr, 1.0);
    cairo_set_dash(cr, (double[]){6.0, 4.0}, 2, 0);
    cairo_move_to(cr, px + 8, datum_y);
    cairo_line_to(cr, px + pw - 8, datum_y);
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* datum label */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_move_to(cr, px + 8, datum_y + 11);
    cairo_show_text(cr, "datum (z = 0)");

    /* ── pipe geometry ── */
    /* pipe radius proportional to 1/V (continuity: wider pipe = slower flow) */
    double v_max    = fmax(fabs(V1), fabs(V2));
    if (v_max < 1e-9) v_max = 1.0;

    double r_base   = ph * 0.10;
    double r1       = r_base * (v_max / fmax(fabs(V1), 1e-9));
    double r2       = r_base * (v_max / fmax(fabs(V2), 1e-9));
    /* clamp radii */
    r1 = fmin(r1, ph * 0.18);
    r2 = fmin(r2, ph * 0.18);
    r1 = fmax(r1, ph * 0.05);
    r2 = fmax(r2, ph * 0.05);

    /* elevation pixels — z=0 at datum_y */
    double z_max  = fmax(fabs(z1), fabs(z2));
    if (z_max < 1e-9) z_max = 1.0;
    double z_scale = ph * 0.55 / z_max;   /* pixels per unit elevation */

    double cy1    = datum_y - z1 * z_scale;
    double cy2    = datum_y - z2 * z_scale;

    /* clamp to panel */
    double pad_v  = ph * 0.28;
    cy1 = fmax(py + pad_v, fmin(py + ph - pad_v, cy1));
    cy2 = fmax(py + pad_v, fmin(py + ph - pad_v, cy2));

    double cx1    = px + pw * 0.22;
    double cx2    = px + pw * 0.72;

    /* ── connecting pipe (trapezoid) ── */
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.25);
    cairo_move_to(cr, cx1, cy1 - r1);
    cairo_line_to(cr, cx2, cy2 - r2);
    cairo_line_to(cr, cx2, cy2 + r2);
    cairo_line_to(cr, cx1, cy1 + r1);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* pipe outline */
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, cx1, cy1 - r1);
    cairo_line_to(cr, cx2, cy2 - r2);
    cairo_stroke(cr);
    cairo_move_to(cr, cx1, cy1 + r1);
    cairo_line_to(cr, cx2, cy2 + r2);
    cairo_stroke(cr);

    /* ── section 1 pipe face ── */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.3);
    cairo_rectangle(cr, cx1 - 6, cy1 - r1, 6, r1 * 2);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, cx1 - 6, cy1 - r1, 6, r1 * 2);
    cairo_stroke(cr);

    /* ── section 2 pipe face ── */
    cairo_set_source_rgba(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B, 0.3);
    cairo_rectangle(cr, cx2, cy2 - r2, 6, r2 * 2);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, cx2, cy2 - r2, 6, r2 * 2);
    cairo_stroke(cr);

    /* ── flow arrow inside pipe ── */
    cairo_set_source_rgb(cr, MX_TEXT_R, MX_TEXT_G, MX_TEXT_B);
    cairo_set_line_width(cr, 1.5);
    double mid_x = (cx1 + cx2) / 2.0;
    double mid_y = (cy1 + cy2) / 2.0;
    double alen  = pw * 0.08;
    cairo_move_to(cr, mid_x - alen/2, mid_y);
    cairo_line_to(cr, mid_x + alen/2, mid_y);
    cairo_stroke(cr);
    {
        double dx = cx2 - cx1, dy = cy2 - cy1;
        double len = sqrt(dx*dx + dy*dy);
        double ux = dx/len, uy = dy/len;
        double tip_x = mid_x + alen/2;
        double tip_y = mid_y;
        double size = 7.0;
        cairo_move_to(cr, tip_x, tip_y);
        cairo_line_to(cr, tip_x - ux*size + uy*size*0.4,
                          tip_y - uy*size - ux*size*0.4);
        cairo_move_to(cr, tip_x, tip_y);
        cairo_line_to(cr, tip_x - ux*size - uy*size*0.4,
                          tip_y - uy*size + ux*size*0.4);
        cairo_stroke(cr);
    }

    /* ── pressure arrows at each section ── */
    double p_max  = fmax(fabs(P1), fabs(P2));
    if (p_max < 1e-9) p_max = 1.0;
    double p_scale = pw * 0.14 / p_max;

    /* section 1 pressure arrow (pointing left = into section) */
    draw_pressure_arrow(cr, cx1 - 6, cy1,
                        -P1 * p_scale,
                        MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);

    /* section 2 pressure arrow (pointing right = out of section) */
    draw_pressure_arrow(cr, cx2 + 6, cy2,
                        P2 * p_scale,
                        MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);

    /* ── elevation dimension lines ── */
    /* section 1 */
    {
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, cx1 - 22, cy1);
        cairo_line_to(cr, cx1 - 22, datum_y);
        cairo_stroke(cr);
        cairo_move_to(cr, cx1 - 26, cy1);
        cairo_line_to(cr, cx1 - 18, cy1);
        cairo_move_to(cr, cx1 - 26, datum_y);
        cairo_line_to(cr, cx1 - 18, datum_y);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "z1=%.3g", z1);
        cairo_set_font_size(cr, 9.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, cx1 - 22 - te.width - 2,
                      (cy1 + datum_y)/2.0 + 4);
        cairo_show_text(cr, label);
    }

    /* section 2 */
    {
        cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, cx2 + 24, cy2);
        cairo_line_to(cr, cx2 + 24, datum_y);
        cairo_stroke(cr);
        cairo_move_to(cr, cx2 + 20, cy2);
        cairo_line_to(cr, cx2 + 28, cy2);
        cairo_move_to(cr, cx2 + 20, datum_y);
        cairo_line_to(cr, cx2 + 28, datum_y);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "z2=%.3g", z2);
        cairo_set_font_size(cr, 9.0);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, cx2 + 30, (cy2 + datum_y)/2.0 + 4);
        cairo_show_text(cr, label);
    }

    /* ── section labels ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);

    /* section 1 */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_move_to(cr, cx1 - 10, cy1 - r1 - 22);
    cairo_show_text(cr, "① ");

    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    snprintf(label, sizeof(label), "P1=%.3g", P1);
    cairo_move_to(cr, cx1 - 30, cy1 - r1 - 10);
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "V1=%.3g", V1);
    cairo_move_to(cr, cx1 - 30, cy1 - r1 - 0);
    cairo_show_text(cr, label);

    /* section 2 */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_move_to(cr, cx2 + 2, cy2 - r2 - 22);
    cairo_show_text(cr, "②");

    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    snprintf(label, sizeof(label), "P2=%.3g", P2);
    cairo_move_to(cr, cx2 + 10, cy2 - r2 - 10);
    cairo_show_text(cr, label);

    snprintf(label, sizeof(label), "V2=%.3g", V2);
    cairo_move_to(cr, cx2 + 10, cy2 - r2 - 0);
    cairo_show_text(cr, label);
}

/* ═══════════════════════════════════════════════════════════
   RIGHT PANEL — stacked head component bar chart
   ═══════════════════════════════════════════════════════════ */

static void draw_head_panel(cairo_t *cr,
                             double px, double py,
                             double pw, double ph,
                             double P1, double V1, double z1,
                             double P2, double V2, double z2,
                             double rho, double g)
{
    char   label[64];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── compute head components ── */
    double rg      = rho * g;
    double ph1_z   = z1;
    double ph1_p   = (rg > 0) ? P1 / rg : 0.0;
    double ph1_v   = V1 * V1 / (2.0 * g);
    double ph2_z   = z2;
    double ph2_p   = (rg > 0) ? P2 / rg : 0.0;
    double ph2_v   = V2 * V2 / (2.0 * g);

    double H1      = ph1_z + ph1_p + ph1_v;
    double H2      = ph2_z + ph2_p + ph2_v;
    double H_max   = fmax(H1, H2) * 1.15;
    if (H_max < 1e-9) H_max = 1.0;

    /* ── plot area ── */
    double pad_l  = 52.0, pad_r = 16.0, pad_t = 32.0, pad_b = 36.0;
    double ax     = px + pad_l;
    double ay     = py + pad_t;
    double aw     = pw - pad_l - pad_r;
    double ah     = ph - pad_t - pad_b;

    /* bar geometry */
    double bar_w  = aw * 0.28;
    double gap    = aw * 0.16;
    double bx1    = ax + gap;
    double bx2    = ax + gap + bar_w + gap * 1.5;

#define BH(h)  (ah * (h) / H_max)   /* head → pixels */
#define BY(h)  (ay + ah - BH(h))    /* head → y pixel (from bottom) */

    /* ── draw stacked bars ── */

    /* helper lambda via macro: draw one bar segment */
#define DRAW_SEG(bx, bot_h, seg_h, r, g2, b, alpha) \
    do { \
        double sy = BY((bot_h) + (seg_h)); \
        double sh = BH(seg_h); \
        if (sh > 0.5) { \
            cairo_set_source_rgba(cr, (r), (g2), (b), (alpha)); \
            cairo_rectangle(cr, (bx), sy, bar_w, sh); \
            cairo_fill(cr); \
            cairo_set_source_rgba(cr, (r)*0.7, (g2)*0.7, (b)*0.7, 0.8); \
            cairo_set_line_width(cr, 0.5); \
            cairo_rectangle(cr, (bx), sy, bar_w, sh); \
            cairo_stroke(cr); \
        } \
    } while(0)

    /* Section 1 — bottom to top: z, P/ρg, V²/2g */
    DRAW_SEG(bx1, 0,             ph1_z, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.7);
    DRAW_SEG(bx1, ph1_z,         ph1_p, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B, 0.7);
    DRAW_SEG(bx1, ph1_z + ph1_p, ph1_v, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B, 0.7);

    /* Section 2 */
    DRAW_SEG(bx2, 0,             ph2_z, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.7);
    DRAW_SEG(bx2, ph2_z,         ph2_p, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B, 0.7);
    DRAW_SEG(bx2, ph2_z + ph2_p, ph2_v, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B, 0.7);

#undef DRAW_SEG

    /* ── total head markers ── */
    /* section 1 */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, bx1 - 4, BY(H1));
    cairo_line_to(cr, bx1 + bar_w + 4, BY(H1));
    cairo_stroke(cr);

    /* section 2 */
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    cairo_move_to(cr, bx2 - 4, BY(H2));
    cairo_line_to(cr, bx2 + bar_w + 4, BY(H2));
    cairo_stroke(cr);

    /* dashed line connecting total heads */
    cairo_set_source_rgba(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                          MX_OVERLAY1_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_set_dash(cr, (double[]){5.0, 4.0}, 2, 0);
    cairo_move_to(cr, bx1 + bar_w, BY(H1));
    cairo_line_to(cr, bx2,          BY(H2));
    cairo_stroke(cr);
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── Y axis ── */
    cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, ax, ay);
    cairo_line_to(cr, ax, ay + ah);
    cairo_stroke(cr);

    /* baseline */
    cairo_move_to(cr, ax, ay + ah);
    cairo_line_to(cr, ax + aw, ay + ah);
    cairo_stroke(cr);

    /* Y axis ticks */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    int n_ticks = 5;
    for (int i = 0; i <= n_ticks; i++)
    {
        double h  = H_max * i / n_ticks;
        double ty = BY(h);
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G, MX_OVERLAY1_B);
        cairo_set_line_width(cr, 0.5);
        cairo_move_to(cr, ax - 4, ty);
        cairo_line_to(cr, ax, ty);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.2g", h);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, ax - te.width - 6, ty + te.height/2.0);
        cairo_show_text(cr, label);
    }

    /* ── bar labels (below bars) ── */
    cairo_set_font_size(cr, 10.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "①", &te);
        cairo_move_to(cr, bx1 + bar_w/2.0 - te.width/2.0, ay + ah + 16);
        cairo_show_text(cr, "①");
    }
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "②", &te);
        cairo_move_to(cr, bx2 + bar_w/2.0 - te.width/2.0, ay + ah + 16);
        cairo_show_text(cr, "②");
    }

    /* ── total head values above bars ── */
    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    snprintf(label, sizeof(label), "H=%.3g", H1);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, bx1 + bar_w/2.0 - te.width/2.0, BY(H1) - 4);
        cairo_show_text(cr, label);
    }

    snprintf(label, sizeof(label), "H=%.3g", H2);
    cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, label, &te);
        cairo_move_to(cr, bx2 + bar_w/2.0 - te.width/2.0, BY(H2) - 4);
        cairo_show_text(cr, label);
    }

    /* ── legend ── */
    double lx = px + pw - 68.0;
    double ly = py + 28.0;
    double ls = 10.0;

    cairo_set_font_size(cr, 9.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);

    /* elevation */
    cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B, 0.7);
    cairo_rectangle(cr, lx, ly, ls, ls); cairo_fill(cr);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_move_to(cr, lx + ls + 4, ly + ls - 1);
    cairo_show_text(cr, "z");
    ly += 14;

    /* pressure head */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.7);
    cairo_rectangle(cr, lx, ly, ls, ls); cairo_fill(cr);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_move_to(cr, lx + ls + 4, ly + ls - 1);
    cairo_show_text(cr, "P/\xcf\x81g");
    ly += 14;

    /* velocity head */
    cairo_set_source_rgba(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B, 0.7);
    cairo_rectangle(cr, lx, ly, ls, ls); cairo_fill(cr);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_move_to(cr, lx + ls + 4, ly + ls - 1);
    cairo_show_text(cr, "V\xc2\xb2/2g");

    /* ── Y axis label (rotated) ── */
    cairo_save(cr);
    cairo_set_font_size(cr, 10.0);
    cairo_translate(cr, px + 12, ay + ah/2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, "Head (m)", &te);
        cairo_move_to(cr, -te.width/2.0, te.height/2.0);
        cairo_show_text(cr, "Head (m)");
    }
    cairo_restore(cr);

    /* ── panel title ── */
    cairo_set_font_size(cr, 11.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
    {
        const char *t = "Head Components";
        cairo_text_extents_t te;
        cairo_text_extents(cr, t, &te);
        cairo_move_to(cr, px + pw/2.0 - te.width/2.0, py + 16.0);
        cairo_show_text(cr, t);
    }

#undef BH
#undef BY
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — draw_bernoulli_plot
   ═══════════════════════════════════════════════════════════ */

void draw_bernoulli_plot(cairo_t *cr, int w, int h,
                          const GraphData *gd)
{
    double rho = gd->x_data[0];
    double g   = gd->x_data[1];
    double P1  = gd->y_data[0];
    double V1  = gd->y_data[1];
    double z1  = gd->y_data[2];
    double P2  = gd->y_data[3];
    double V2  = gd->y_data[4];
    double z2  = gd->y_data[5];

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
        const char *title = "Bernoulli's Equation";
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
                    P1, V1, z1, P2, V2, z2, rho, g);

    /* vertical separator */
    cairo_set_source_rgba(cr, MX_SURFACE0_R, MX_SURFACE0_G,
                          MX_SURFACE0_B, 0.6);
    cairo_set_line_width(cr, 1.0);
    cairo_move_to(cr, mid, top + 8);
    cairo_line_to(cr, mid, h - bot - 8);
    cairo_stroke(cr);

    draw_head_panel(cr,
                    mid + pad * 0.5, top,
                    mid - pad * 1.5, h - top - bot,
                    P1, V1, z1, P2, V2, z2, rho, g);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open_bernoulli
   ═══════════════════════════════════════════════════════════ */

void graph_window_open_bernoulli(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    P1, V1, z1, P2, V2, z2, rho, g;
    double    x_data[5] = {0};
    double    y_data[8] = {0};

    pipe_transact("$bern_P1\n",  buf, sizeof(buf)); P1  = atof(buf);
    pipe_transact("$bern_V1\n",  buf, sizeof(buf)); V1  = atof(buf);
    pipe_transact("$bern_z1\n",  buf, sizeof(buf)); z1  = atof(buf);
    pipe_transact("$bern_P2\n",  buf, sizeof(buf)); P2  = atof(buf);
    pipe_transact("$bern_V2\n",  buf, sizeof(buf)); V2  = atof(buf);
    pipe_transact("$bern_z2\n",  buf, sizeof(buf)); z2  = atof(buf);
    pipe_transact("$bern_rho\n", buf, sizeof(buf)); rho = atof(buf);
    pipe_transact("$bern_g\n",   buf, sizeof(buf)); g   = atof(buf);

    /* guard against uninitialized g */
    if (g < 1.0) g = 9.81;

    x_data[0] = rho;
    x_data[1] = g;

    y_data[0] = P1;
    y_data[1] = V1;
    y_data[2] = z1;
    y_data[3] = P2;
    y_data[4] = V2;
    y_data[5] = z2;

    graph_window_open_vars("Bernoulli's Equation", PLOT_BERNOULLI,
                           "", "",
                           x_data, y_data, 6);
}
