/* =============================================================================
 * File:         navier_graph.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Navier-Stokes lid-driven cavity plot for Mathrix.
 *
 *               Two side-by-side panels, laid out the way Ghia, Ghia & Shin
 *               (1982) and most CFD papers show them:
 *                 left  — horizontal velocity u against height y, along the
 *                         vertical line through the middle of the box
 *                 right — vertical velocity v against x, along the
 *                         horizontal line through the middle of the box
 *               Each panel draws this solution as a line and, when Re is
 *               one Ghia published (100, 400, 1000), Ghia's points as dots.
 *               A banner gives Re, grid, the main vortex and how well the
 *               result matches the benchmark, in plain English.
 *
 *               GraphData packing (set by graph_window_open_navier):
 *                 x_data[0 .. NG_HDR-1] = header:
 *                   [0] Re          [1] grid points per side
 *                   [2] psi min     [3] vortex x    [4] vortex y
 *                   [5] worst difference from Ghia (-1 = no benchmark)
 *                   [6] 1 = steady state reached
 *                   [7] nG, Ghia points per profile (0 = none)
 *                 y_data[0 .. NG_HDR-1] = unused (0)
 *                 then four sections, back to back, after the header:
 *                   N  points:  x = y position,  y = u      (left curve)
 *                   N  points:  x = x position,  y = v      (right curve)
 *                   nG points:  x = Ghia y,      y = Ghia u (left dots)
 *                   nG points:  x = Ghia x,      y = Ghia v (right dots)
 * ============================================================================= */

#ifndef NAVIER_GRAPH_H
#define NAVIER_GRAPH_H

#include <cairo.h>
#include "graph_data.h"

/* header length in GraphData.x_data — see the packing above */
#define NG_HDR  8

/*************************************************************
 * Function:    draw_navier_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws both centreline panels and the banner.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_NAVIER.
 *************************************************************/
void draw_navier_plot(cairo_t *cr, int w, int h, const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_navier
 * Input:       void — reads the $navier_* results from parse
 * Output:      void
 * Description: Fetches the cavity results and opens an
 *              autonomous graph window.  Called by input_form.c
 *              when plot_type == PLOT_NAVIER.
 *************************************************************/
void graph_window_open_navier(void);

#endif /* NAVIER_GRAPH_H */
