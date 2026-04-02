#include "beam_graph.h"
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

/* ── layout constants ── */
#define BEAM_PAD_X   90.0    /* horizontal padding              */
#define BEAM_PAD_TOP 80.0    /* space above beam for load arrows*/
#define BEAM_PAD_BOT 90.0    /* space below beam for deflection */
#define BEAM_H       6.0     /* beam cross-section height       */
#define DEFL_SCALE   0.35    /* deflection exaggeration factor  */
#define ARROW_HEAD   10.0    /* arrowhead size                  */
#define N_CURVE      64      /* points on deflection curve      */

/* ── helpers ── */
static void draw_arrowhead(cairo_t *cr,
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

static void draw_pin_support(cairo_t *cr, double x, double y,
                              double size)
{
    /* triangle pointing up */
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, x, y);
    cairo_line_to(cr, x - size, y + size * 1.4);
    cairo_line_to(cr, x + size, y + size * 1.4);
    cairo_close_path(cr);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.25);
    cairo_fill_preserve(cr);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_stroke(cr);
    /* ground line */
    cairo_set_line_width(cr, 1.5);
    cairo_move_to(cr, x - size*1.3, y + size*1.4);
    cairo_line_to(cr, x + size*1.3, y + size*1.4);
    cairo_stroke(cr);
    /* hatch below ground */
    for (int i = -2; i <= 2; i++)
    {
        cairo_move_to(cr, x + i*size*0.5,         y + size*1.4);
        cairo_line_to(cr, x + i*size*0.5 - size*0.3, y + size*1.9);
        cairo_stroke(cr);
    }
}

static void draw_fixed_wall(cairo_t *cr, double x, double y0,
                             double height)
{
    double y1 = y0 - height/2.0;
    double y2 = y0 + height/2.0;

    /* wall rectangle */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.25);
    cairo_rectangle(cr, x - 16, y1, 16, y2 - y1);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, x - 16, y1, 16, y2 - y1);
    cairo_stroke(cr);

    /* hatch lines */
    cairo_set_line_width(cr, 0.8);
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.5);
    for (double y = y1; y < y2; y += 10)
    {
        cairo_move_to(cr, x - 16, y);
        cairo_line_to(cr, x - 4,  y + 10);
        cairo_stroke(cr);
    }

    /* vertical line at wall face */
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_move_to(cr, x, y1);
    cairo_line_to(cr, x, y2);
    cairo_stroke(cr);
}

static void draw_roller_support(cairo_t *cr, double x, double y,
                                 double size)
{
    /* circle roller */
    cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                          MX_SAPPHIRE_B, 0.25);
    cairo_arc(cr, x, y + size*0.9, size*0.55, 0, 2*M_PI);
    cairo_fill_preserve(cr);
    cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G, MX_SAPPHIRE_B);
    cairo_set_line_width(cr, 1.5);
    cairo_stroke(cr);
    /* ground line */
    cairo_move_to(cr, x - size*1.3, y + size*1.5);
    cairo_line_to(cr, x + size*1.3, y + size*1.5);
    cairo_stroke(cr);
}

/*************************************************************
 * Function:    draw_beam_plot
 *************************************************************/
void draw_beam_plot(cairo_t *cr, int w, int h,
                    const GraphData *gd)
{
    /* ── unpack ── */
    double L       = gd->x_data[0];
    double P       = gd->x_data[1];
    double w_udl   = gd->x_data[2];
    int    is_cant = (int)(gd->x_data[3] + 0.5);
    int    is_udl  = (int)(gd->x_data[4] + 0.5);
    double delta   = gd->y_data[0];
    double Mmax    = gd->y_data[1];
    double R       = gd->y_data[2];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_paint(cr);

    /* ── beam geometry ── */
    double bx0  = BEAM_PAD_X;
    double bx1  = w - BEAM_PAD_X;
    double blen = bx1 - bx0;
    double by   = h / 2.0 - 10.0;   /* beam centreline y      */
    double defl_px = delta > 0
                   ? fmin(h * DEFL_SCALE, (h - BEAM_PAD_TOP - BEAM_PAD_BOT) * 0.5)
                   : 0.0;
    if (L < 1e-12) L = 1.0;
    double scale = blen / L;         /* pixels per unit length */

    char label[64];

    /* ── supports ── */
    if (is_cant)
    {
        /* fixed wall on left */
        draw_fixed_wall(cr, bx0, by, 60.0);
        /* free end marker */
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, bx1, by - BEAM_H*2);
        cairo_line_to(cr, bx1, by + BEAM_H*2);
        cairo_stroke(cr);
    }
    else
    {
        /* pin left, roller right */
        draw_pin_support(cr, bx0, by + BEAM_H/2.0, 12.0);
        draw_roller_support(cr, bx1, by + BEAM_H/2.0, 12.0);
    }

    /* ── load arrows ── */
    if (is_udl)
    {
        /* UDL — row of downward arrows */
        int    n_arrows = (int)(blen / 28);
        if (n_arrows < 3) n_arrows = 3;
        double spacing  = blen / n_arrows;
        double arrow_len = 28.0;

        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_set_line_width(cr, 1.5);

        /* top line */
        cairo_move_to(cr, bx0, by - arrow_len);
        cairo_line_to(cr, bx1, by - arrow_len);
        cairo_stroke(cr);

        for (int i = 0; i <= n_arrows; i++)
        {
            double ax = bx0 + i * spacing;
            cairo_move_to(cr, ax, by - arrow_len);
            cairo_line_to(cr, ax, by - BEAM_H/2.0);
            cairo_stroke(cr);
            draw_arrowhead(cr, ax, by - BEAM_H/2.0, 0, 1, 7.0);
        }

        /* label */
        snprintf(label, sizeof(label), "w = %.3g", w_udl);
        cairo_set_font_size(cr, 11.0);
        cairo_select_font_face(cr, "Sans",
                               CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_move_to(cr, bx0 + blen/2.0 - 30, by - arrow_len - 8);
        cairo_show_text(cr, label);
    }
    else
    {
        /* Point load — single arrow at centre (SS) or free end (cant) */
        double ax      = is_cant ? bx1 : bx0 + blen/2.0;
        double arrow_len = 36.0;

        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_set_line_width(cr, 2.0);
        cairo_move_to(cr, ax, by - arrow_len);
        cairo_line_to(cr, ax, by - BEAM_H/2.0);
        cairo_stroke(cr);
        draw_arrowhead(cr, ax, by - BEAM_H/2.0, 0, 1, ARROW_HEAD);

        snprintf(label, sizeof(label), "P = %.3g", P);
        cairo_set_font_size(cr, 11.0);
        cairo_select_font_face(cr, "Sans",
                               CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        cairo_set_source_rgb(cr, MX_PEACH_R, MX_PEACH_G, MX_PEACH_B);
        cairo_move_to(cr, ax + 8, by - arrow_len/2.0);
        cairo_show_text(cr, label);
    }

    /* ── reaction arrows ── */
    cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
    cairo_set_line_width(cr, 2.0);
    if (is_cant)
    {
        /* single upward reaction at wall */
        double arrow_len = 32.0;
        cairo_move_to(cr, bx0, by + BEAM_H/2.0 + arrow_len);
        cairo_line_to(cr, bx0, by + BEAM_H/2.0);
        cairo_stroke(cr);
        draw_arrowhead(cr, bx0, by + BEAM_H/2.0, 0, -1, ARROW_HEAD);
        snprintf(label, sizeof(label), "R=%.3g", R);
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_move_to(cr, bx0 + 6, by + BEAM_H/2.0 + arrow_len/2.0 + 4);
        cairo_show_text(cr, label);
    }
    else
    {
        /* two upward reactions at each end */
        double arrow_len = 28.0;
        double r_each    = R / 2.0;
        double xs[2]     = { bx0, bx1 };
        for (int i = 0; i < 2; i++)
        {
            cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
            cairo_move_to(cr, xs[i], by + BEAM_H/2.0 + arrow_len);
            cairo_line_to(cr, xs[i], by + BEAM_H/2.0);
            cairo_stroke(cr);
            draw_arrowhead(cr, xs[i], by + BEAM_H/2.0, 0, -1, ARROW_HEAD);
            snprintf(label, sizeof(label), "R/2=%.3g", r_each);
            cairo_set_font_size(cr, 10.0);
            cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                                   CAIRO_FONT_WEIGHT_NORMAL);
            cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
            cairo_move_to(cr, xs[i] + 6,
                              by + BEAM_H/2.0 + arrow_len/2.0 + 4);
            cairo_show_text(cr, label);
        }
    }

    /* ── beam rectangle ── */
    cairo_set_source_rgba(cr, MX_SURFACE1_R, MX_SURFACE1_G,
                          MX_SURFACE1_B, 0.6);
    cairo_rectangle(cr, bx0, by - BEAM_H/2.0, blen, BEAM_H);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, MX_SUBTEXT1_R, MX_SUBTEXT1_G, MX_SUBTEXT1_B);
    cairo_set_line_width(cr, 1.5);
    cairo_rectangle(cr, bx0, by - BEAM_H/2.0, blen, BEAM_H);
    cairo_stroke(cr);

    /* ── deflected shape ── */
    if (delta > 1e-12 && defl_px > 0)
    {
        cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                             MX_SAPPHIRE_B);
        cairo_set_line_width(cr, 2.0);

        /* shadow */
        cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.4);
        cairo_set_line_width(cr, 3.5);
        cairo_move_to(cr, bx0 + 1, by + 1);
        for (int i = 1; i <= N_CURVE; i++)
        {
            double xi  = (double)i / N_CURVE;
            double def = 0.0;
            if (!is_cant && !is_udl)
                /* SS point load: cubic with zero at ends */
                def = xi*(1-xi)*(1+xi*(1-xi)) * defl_px * 2.0;
            else if (!is_cant && is_udl)
                /* SS UDL: 4th order polynomial */
                def = xi*(1-xi)*(1+xi-xi*xi) * defl_px * 2.2;
            else if (is_cant && !is_udl)
                /* Cantilever point load at tip */
                def = (3*xi*xi - xi*xi*xi) / 2.0 * defl_px * 2.0;
            else
                /* Cantilever UDL */
                def = (6*xi*xi - 4*xi*xi*xi + xi*xi*xi*xi) / 3.0
                      * defl_px * 1.8;
            cairo_line_to(cr, bx0 + xi*blen + 1, by + def + 1);
        }
        cairo_stroke(cr);

        /* main curve */
        cairo_set_source_rgb(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                             MX_SAPPHIRE_B);
        cairo_set_line_width(cr, 2.0);
        cairo_move_to(cr, bx0, by);
        for (int i = 1; i <= N_CURVE; i++)
        {
            double xi  = (double)i / N_CURVE;
            double def = 0.0;
            if (!is_cant && !is_udl)
                def = xi*(1-xi)*(1+xi*(1-xi)) * defl_px * 2.0;
            else if (!is_cant && is_udl)
                def = xi*(1-xi)*(1+xi-xi*xi) * defl_px * 2.2;
            else if (is_cant && !is_udl)
                def = (3*xi*xi - xi*xi*xi) / 2.0 * defl_px * 2.0;
            else
                def = (6*xi*xi - 4*xi*xi*xi + xi*xi*xi*xi) / 3.0
                      * defl_px * 1.8;
            cairo_line_to(cr, bx0 + xi*blen, by + def);
        }
        cairo_stroke(cr);

        /* fill area between beam and deflected shape */
        cairo_move_to(cr, bx0, by);
        for (int i = 1; i <= N_CURVE; i++)
        {
            double xi  = (double)i / N_CURVE;
            double def = 0.0;
            if (!is_cant && !is_udl)
                def = xi*(1-xi)*(1+xi*(1-xi)) * defl_px * 2.0;
            else if (!is_cant && is_udl)
                def = xi*(1-xi)*(1+xi-xi*xi) * defl_px * 2.2;
            else if (is_cant && !is_udl)
                def = (3*xi*xi - xi*xi*xi) / 2.0 * defl_px * 2.0;
            else
                def = (6*xi*xi - 4*xi*xi*xi + xi*xi*xi*xi) / 3.0
                      * defl_px * 1.8;
            cairo_line_to(cr, bx0 + xi*blen, by + def);
        }
        cairo_line_to(cr, bx1, by);
        cairo_close_path(cr);
        cairo_set_source_rgba(cr, MX_SAPPHIRE_R, MX_SAPPHIRE_G,
                              MX_SAPPHIRE_B, 0.10);
        cairo_fill(cr);

        /* delta arrow — at max deflection location */
        {
            double ax     = is_cant ? bx1 : bx0 + blen/2.0;
            double def_at = is_cant ? defl_px * 1.0 : defl_px;
            if (!is_cant && !is_udl)
                def_at = 0.5*(1-0.5)*(1+0.5*(1-0.5)) * defl_px * 2.0;
            else if (!is_cant && is_udl)
                def_at = 0.5*(1-0.5)*(1+0.5-0.25) * defl_px * 2.2;
            else if (is_cant && !is_udl)
                def_at = (3 - 1.0)/2.0 * defl_px * 2.0;
            else
                def_at = (6 - 4 + 1)/3.0 * defl_px * 1.8;

            /* dashed vertical line */
            cairo_set_source_rgba(cr, MX_YELLOW_R, MX_YELLOW_G,
                                  MX_YELLOW_B, 0.8);
            cairo_set_line_width(cr, 1.0);
            cairo_set_dash(cr, (double[]){4.0, 3.0}, 2, 0);
            cairo_move_to(cr, ax, by);
            cairo_line_to(cr, ax, by + def_at);
            cairo_stroke(cr);
            cairo_set_dash(cr, NULL, 0, 0);

            /* arrow tip */
            draw_arrowhead(cr, ax, by + def_at, 0, 1, 8.0);

            snprintf(label, sizeof(label), "\xce\xb4=%.3g", delta);
            cairo_set_font_size(cr, 11.0);
            cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                                   CAIRO_FONT_WEIGHT_BOLD);
            cairo_set_source_rgb(cr, MX_YELLOW_R, MX_YELLOW_G, MX_YELLOW_B);
            cairo_move_to(cr, ax + 6, by + def_at * 0.55);
            cairo_show_text(cr, label);
        }
    }

    /* ── span dimension line ── */
    {
        double dim_y = by + BEAM_H/2.0 + 56.0;
        cairo_set_source_rgb(cr, MX_OVERLAY1_R, MX_OVERLAY1_G,
                             MX_OVERLAY1_B);
        cairo_set_line_width(cr, 1.0);
        /* horizontal line */
        cairo_move_to(cr, bx0, dim_y);
        cairo_line_to(cr, bx1, dim_y);
        cairo_stroke(cr);
        /* end ticks */
        cairo_move_to(cr, bx0, dim_y - 5); cairo_line_to(cr, bx0, dim_y + 5);
        cairo_move_to(cr, bx1, dim_y - 5); cairo_line_to(cr, bx1, dim_y + 5);
        cairo_stroke(cr);
        /* L label */
        snprintf(label, sizeof(label), "L = %.3g", L);
        cairo_set_font_size(cr, 11.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_ITALIC,
                               CAIRO_FONT_WEIGHT_NORMAL);
        {
            cairo_text_extents_t te;
            cairo_text_extents(cr, label, &te);
            cairo_move_to(cr, bx0 + blen/2.0 - te.width/2.0, dim_y + 14);
            cairo_show_text(cr, label);
        }
    }

    /* ── title ── */
    {
        const char *type_str = is_cant ? "Cantilever" : "Simply Supported";
        const char *load_str = is_udl  ? "UDL"        : "Point Load";
        snprintf(label, sizeof(label), "%s  —  %s", type_str, load_str);
        cairo_select_font_face(cr, "Sans",
                               CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_BOLD);
        cairo_set_font_size(cr, 14.0);
        cairo_set_source_rgb(cr, MX_BLUE_R, MX_BLUE_G, MX_BLUE_B);
        {
            cairo_text_extents_t te;
            cairo_text_extents(cr, label, &te);
            cairo_move_to(cr, w/2.0 - te.width/2.0, 28.0);
            cairo_show_text(cr, label);
        }
    }

    /* ── results box (bottom right) ── */
    {
        double bx = w - BEAM_PAD_X - 10;
        double by2 = h - 14;
        cairo_set_font_size(cr, 10.0);
        cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                               CAIRO_FONT_WEIGHT_NORMAL);

        snprintf(label, sizeof(label), "Mmax = %.4g", Mmax);
        cairo_set_source_rgb(cr, MX_MAUVE_R, MX_MAUVE_G, MX_MAUVE_B);
        cairo_move_to(cr, bx - 160, by2 - 14);
        cairo_show_text(cr, label);

        snprintf(label, sizeof(label), "R = %.4g", R);
        cairo_set_source_rgb(cr, MX_GREEN_R, MX_GREEN_G, MX_GREEN_B);
        cairo_move_to(cr, bx - 160, by2);
        cairo_show_text(cr, label);
    }
}

/*************************************************************
 * Function:    graph_window_open_beam
 *************************************************************/
void graph_window_open_beam(void)
{
    AppState *st = app_state_get();
    char      buf[256];
    double    L, P, w_udl, is_cant, is_udl;
    double    delta, Mmax, R;
    double    x_data[5];
    double    y_data[3];

    pipe_transact("$beam_L\n",    buf, sizeof(buf)); L       = atof(buf);
    pipe_transact("$beam_P\n",    buf, sizeof(buf)); P       = atof(buf);
    pipe_transact("$beam_w\n",    buf, sizeof(buf)); w_udl   = atof(buf);
    pipe_transact("$beam_cant\n", buf, sizeof(buf)); is_cant = atof(buf);
    pipe_transact("$beam_udl\n",  buf, sizeof(buf)); is_udl  = atof(buf);
    pipe_transact("$beam_delta\n",buf, sizeof(buf)); delta   = atof(buf);
    pipe_transact("$beam_Mmax\n", buf, sizeof(buf)); Mmax    = atof(buf);
    pipe_transact("$beam_R\n",    buf, sizeof(buf)); R       = atof(buf);

    x_data[0] = L;       x_data[1] = P;
    x_data[2] = w_udl;   x_data[3] = is_cant;
    x_data[4] = is_udl;

    y_data[0] = delta;
    y_data[1] = Mmax;
    y_data[2] = R;

    graph_window_open_vars("Beam Deflection", PLOT_BEAM,
                           "", "",
                           x_data, y_data, 3);
}
