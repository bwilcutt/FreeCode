#ifndef BERNOULLI_GRAPH_H
#define BERNOULLI_GRAPH_H

/*************************************************************
 * bernoulli_graph.h — Bernoulli's Equation Cairo drawing
 *
 * Draws two side-by-side panels:
 *   Left:  pipe cross-section at two elevations showing
 *          different pipe widths (velocity), pressure arrows,
 *          elevation markers, and flow direction
 *   Right: stacked head component bar chart at section 1
 *          and section 2 showing:
 *            - Elevation head z         (yellow)
 *            - Pressure head P/(rho*g)  (blue)
 *            - Velocity head V²/(2g)    (green)
 *          Total head shown equal at both sections
 *
 * GraphData packing (set by graph_window_open_bernoulli):
 *   x_data[0] = rho    fluid density
 *   x_data[1] = g      gravity
 *
 *   y_data[0] = P1     pressure section 1
 *   y_data[1] = V1     velocity section 1
 *   y_data[2] = z1     elevation section 1
 *   y_data[3] = P2     pressure section 2
 *   y_data[4] = V2     velocity section 2
 *   y_data[5] = z2     elevation section 2
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_bernoulli_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete Bernoulli diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_BERNOULLI.
 *************************************************************/
void draw_bernoulli_plot(cairo_t *cr, int w, int h,
                          const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_bernoulli
 * Input:       void — reads $bern_* variables from parse
 * Output:      void
 * Description: Queries parse for all Bernoulli variables and
 *              opens an autonomous graph window.
 *              Called by input_form.c when
 *              plot_type == PLOT_BERNOULLI.
 *************************************************************/
void graph_window_open_bernoulli(void);

#endif /* BERNOULLI_GRAPH_H */
