#ifndef BEAM_GRAPH_H
#define BEAM_GRAPH_H

/*************************************************************
 * beam_graph.h — Beam deflection Cairo drawing for Mathrix
 *
 * Lives in calc/Algo/ alongside beam.c and beam.h.
 * Compiled as part of the Mathrix GUI build.
 *
 * Draws:
 *   - Beam line with support symbols (pin/roller or fixed wall)
 *   - Load arrows (point load or UDL)
 *   - Exaggerated deflected shape curve
 *   - Dimension annotations (L, delta_max, P or w)
 *   - Reaction arrows at supports
 *   - Key values labeled
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_beam_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData carrying:
 *                    x_data[0]=L      x_data[1]=P
 *                    x_data[2]=w_udl  x_data[3]=is_cant
 *                    x_data[4]=is_udl
 *                    y_data[0]=delta  y_data[1]=Mmax
 *                    y_data[2]=R
 * Output:      void
 * Description: Draws the complete beam deflection diagram.
 *              Called by graph.c's on_draw() when
 *              plot_type == PLOT_BEAM.
 *************************************************************/
void draw_beam_plot(cairo_t *cr, int w, int h,
                    const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_beam
 * Input:       void — reads $beam_* variables from parse
 * Output:      void
 * Description: Queries parse for all beam variables and opens
 *              an autonomous graph window showing the diagram.
 *************************************************************/
void graph_window_open_beam(void);

#endif /* BEAM_GRAPH_H */
