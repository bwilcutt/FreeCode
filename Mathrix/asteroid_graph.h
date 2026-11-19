/* =============================================================================
 * File:        asteroid_graph.h
 * Author:      Bryan Wilcutt
 * Date Started: 2026-11-06
 * Description: Asteroid Impact Screening plot for Mathrix.
 *
 *              One full-width panel: the asteroid's distance from Earth's
 *              centre against days into the search window, on a LOG scale so
 *              a 3,000 km pass shows its real depth next to a curve that
 *              starts tens of millions of km out.  Dashed reference lines
 *              mark Earth's surface, Earth's capture radius and the Moon's
 *              distance; a callout at the bottom of the dip gives the
 *              closest-approach distance, date and speed; a banner gives the
 *              verdict and the impact probability.
 *
 *              GraphData packing (set by graph_window_open_asteroid):
 *                x_data[0 .. AST_GRAPH_HDR-1] = $asteroid_info, in order:
 *                  [0] start JD      [1] span, days   [2] TCA, JD
 *                  [3] dmin, km      [4] vrel, km/s   [5] capture radius, km
 *                  [6] hit 0/1       [7] probability  [8] probability 1-sigma
 *                  [9] clones used   [10] epoch JD
 *                y_data[0 .. AST_GRAPH_HDR-1] = unused (0)
 *                x_data[AST_GRAPH_HDR ..] = days after start
 *                y_data[AST_GRAPH_HDR ..] = distance, lunar distances
 * ============================================================================= */

#ifndef ASTEROID_GRAPH_H
#define ASTEROID_GRAPH_H

#include <cairo.h>
#include "graph_data.h"

/* entries in $asteroid_info — must match AST_INFO_LEN in calc's asteroid.c */
#define AST_GRAPH_HDR  11

/*************************************************************
 * Function:    draw_asteroid_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete asteroid distance plot.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_ASTEROID.
 *************************************************************/
void draw_asteroid_plot(cairo_t *cr, int w, int h, const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_asteroid
 * Input:       void — reads $asteroid_info, $asteroid_t and
 *              $asteroid_d from parse
 * Output:      void
 * Description: Fetches the asteroid results and opens an
 *              autonomous graph window.  Called by input_form.c
 *              when plot_type == PLOT_ASTEROID.
 *************************************************************/
void graph_window_open_asteroid(void);

#endif /* ASTEROID_GRAPH_H */
