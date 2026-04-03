#ifndef REYNOLDS_GRAPH_H
#define REYNOLDS_GRAPH_H

/*************************************************************
 * reynolds_graph.h — Reynolds Number Cairo drawing for Mathrix
 *
 * Draws two side-by-side panels:
 *   Left:  pipe cross-section with velocity profile and flow
 *          arrows — parabolic for laminar, flatter for turbulent
 *   Right: horizontal log-scale Re bar with colored zones
 *          (laminar=blue, transitional=yellow, turbulent=red)
 *          and a marker showing the current Re value
 *
 * GraphData packing (set by graph_window_open_reynolds):
 *   x_data[0] = V      flow velocity
 *   x_data[1] = D      characteristic length (diameter)
 *   x_data[2] = nu     kinematic viscosity (0 if not used)
 *   x_data[3] = rho    fluid density       (0 if not used)
 *   x_data[4] = mu     dynamic viscosity   (0 if not used)
 *
 *   y_data[0] = Re     Reynolds number
 *   y_data[1] = regime 0=laminar, 1=transitional, 2=turbulent
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_reynolds_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete Reynolds number diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_REYNOLDS.
 *************************************************************/
void draw_reynolds_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_reynolds
 * Input:       void — reads $reynolds_* variables from parse
 * Output:      void
 * Description: Queries parse for all Reynolds variables and
 *              opens an autonomous graph window showing the
 *              diagram.  Called by input_form.c when
 *              plot_type == PLOT_REYNOLDS.
 *************************************************************/
void graph_window_open_reynolds(void);

#endif /* REYNOLDS_GRAPH_H */
