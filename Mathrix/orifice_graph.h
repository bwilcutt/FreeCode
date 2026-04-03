#ifndef ORIFICE_GRAPH_H
#define ORIFICE_GRAPH_H

/*************************************************************
 * orifice_graph.h — Orifice Flow Cairo drawing for Mathrix
 *
 * Draws two side-by-side panels:
 *   Left:  tank/reservoir diagram with water level showing
 *          head h, orifice opening in the wall, and exiting
 *          jet with vena contracta, labeled with all inputs
 *          and results
 *   Right: Q vs h curve from 0 to 2*h showing how discharge
 *          varies with head, yellow dot at current operating
 *          point
 *
 * GraphData packing (set by graph_window_open_orifice):
 *   x_data[0] = Cd     discharge coefficient
 *   x_data[1] = A      orifice area
 *   x_data[2] = h      head above orifice
 *   x_data[3] = g      gravity
 *
 *   y_data[0] = Q      discharge flow rate
 *   y_data[1] = V      jet velocity
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_orifice_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete orifice flow diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_ORIFICE.
 *************************************************************/
void draw_orifice_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_orifice
 * Input:       void — reads $orifice_* variables from parse
 * Output:      void
 * Description: Queries parse for all orifice variables and
 *              opens an autonomous graph window.
 *              Called by input_form.c when
 *              plot_type == PLOT_ORIFICE.
 *************************************************************/
void graph_window_open_orifice(void);

#endif /* ORIFICE_GRAPH_H */
