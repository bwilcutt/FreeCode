#ifndef IDEALGAS_GRAPH_H
#define IDEALGAS_GRAPH_H

/*************************************************************
 * idealgas_graph.h — Ideal Gas Law Cairo drawing for Mathrix
 *
 * Left panel:  schematic gas container showing piston,
 *              pressure arrows, temperature-tinted molecules,
 *              and state variable table.
 *
 * Right panel: PV isotherm diagram with the operating point
 *              plotted on the PV = nRT curve.
 *
 * GraphData packing (set by graph_window_open_idealgas):
 *   x_data[0] = P   pressure
 *   x_data[1] = V   volume
 *   x_data[2] = n   moles / lbmol
 *   x_data[3] = T   temperature
 *   x_data[4] = R   gas constant
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_idealgas_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData packed as above
 * Output:      void
 * Description: Draws the complete Ideal Gas diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_IDEALGAS.
 *************************************************************/
void draw_idealgas_plot(cairo_t *cr, int w, int h,
                         const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_idealgas
 * Input:       void — reads $gas_* variables from parse
 * Output:      void
 * Description: Queries parse for all ideal gas variables and
 *              opens an autonomous graph window.
 *************************************************************/
void graph_window_open_idealgas(void);

#endif /* IDEALGAS_GRAPH_H */
