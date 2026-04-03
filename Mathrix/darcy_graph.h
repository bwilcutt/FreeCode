#ifndef DARCY_GRAPH_H
#define DARCY_GRAPH_H

/*************************************************************
 * darcy_graph.h — Darcy-Weisbach Cairo drawing for Mathrix
 *
 * Draws two side-by-side panels:
 *   Left:  pipe diagram showing flow direction, pressure
 *          gradient from high (left) to low (right), with
 *          input labels f, L, D, V and result labels hf, ΔP/ρ
 *   Right: energy grade line (EGL) and hydraulic grade line
 *          (HGL) sloping downward over the pipe length,
 *          with hf annotated as the total head drop and
 *          V²/2g shown as the velocity head gap
 *
 * GraphData packing (set by graph_window_open_darcy):
 *   x_data[0] = f       Darcy friction factor
 *   x_data[1] = L       pipe length
 *   x_data[2] = D       pipe diameter
 *   x_data[3] = V       flow velocity
 *   x_data[4] = g       gravity (9.81 or 32.174)
 *
 *   y_data[0] = hf      head loss
 *   y_data[1] = dP_rho  specific pressure loss
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_darcy_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete Darcy-Weisbach diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_DARCY.
 *************************************************************/
void draw_darcy_plot(cairo_t *cr, int w, int h,
                     const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_darcy
 * Input:       void — reads $darcy_* variables from parse
 * Output:      void
 * Description: Queries parse for all Darcy variables and opens
 *              an autonomous graph window showing the diagram.
 *              Called by input_form.c when
 *              plot_type == PLOT_DARCY.
 *************************************************************/
void graph_window_open_darcy(void);

#endif /* DARCY_GRAPH_H */
