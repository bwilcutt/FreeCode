#ifndef HEATCOND_GRAPH_H
#define HEATCOND_GRAPH_H

/*************************************************************
 * heatcond_graph.h — Fourier Heat Conduction Cairo drawing
 *
 * Left panel:  planar wall cross-section with colour-gradient
 *              fill (hot→cold), piston-style arrows showing
 *              heat flux direction, face temperature labels,
 *              and thickness dimension line.
 *
 * Right panel: linear temperature profile T(x) plot with
 *              gradient-filled area, slope annotation,
 *              and Q / q'' values.
 *
 * GraphData packing (set by graph_window_open_heatcond):
 *   x_data[0] = k     thermal conductivity
 *   x_data[1] = A     cross-sectional area
 *   x_data[2] = L     wall thickness
 *   x_data[3] = T1    hot-face temperature
 *   x_data[4] = T2    cold-face temperature
 *   x_data[5] = Q     total heat flow rate
 *   x_data[6] = q     heat flux (Q/A)
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_heatcond_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData packed as above
 * Output:      void
 * Description: Draws the complete heat conduction diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_HEATCOND.
 *************************************************************/
void draw_heatcond_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_heatcond
 * Input:       void — reads $heatcond_* variables from parse
 * Output:      void
 * Description: Queries parse for all heat conduction variables
 *              and opens an autonomous graph window.
 *************************************************************/
void graph_window_open_heatcond(void);

#endif /* HEATCOND_GRAPH_H */
