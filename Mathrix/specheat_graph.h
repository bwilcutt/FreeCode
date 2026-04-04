#ifndef SPECHEAT_GRAPH_H
#define SPECHEAT_GRAPH_H

/*************************************************************
 * specheat_graph.h — Specific Heat Cairo drawing for Mathrix
 *
 * Left panel:  calorimeter schematic — insulated cup with
 *              thermometer, temperature-tinted liquid fill,
 *              heat source/sink arrow, and state variable
 *              table.
 *
 * Right panel: energy bar chart comparing the substance's Q
 *              against an equal-mass water reference, with
 *              three-band shading (m / c / dT contributions)
 *              and a colour legend.
 *
 * GraphData packing (set by graph_window_open_specheat):
 *   x_data[0] = Q     heat energy
 *   x_data[1] = m     mass
 *   x_data[2] = c     specific heat capacity
 *   x_data[3] = dT    temperature change
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_specheat_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData packed as above
 * Output:      void
 * Description: Draws the complete specific heat diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_SPECHEAT.
 *************************************************************/
void draw_specheat_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_specheat
 * Input:       void — reads $heat_* variables from parse
 * Output:      void
 * Description: Queries parse for all specific heat variables
 *              and opens an autonomous graph window.
 *************************************************************/
void graph_window_open_specheat(void);

#endif /* SPECHEAT_GRAPH_H */
