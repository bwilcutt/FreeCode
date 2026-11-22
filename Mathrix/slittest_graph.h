/* =============================================================================
 * File:         slittest_graph.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  Two-slits-against-one plot for Mathrix.
 *
 *               Top, a 2 x 2 grid of screen patterns at the Reynolds
 *               number where the fluid came closest to the waves:
 *                              two slits open      one slit open
 *                 fluid        particle landings   particle landings
 *                 waves        bright bands        bright bands
 *               All four share one vertical scale, so they can be
 *               compared by eye.
 *               Bottom, full width: how well the fluid matched the
 *               waves at every Reynolds number in the sweep — a line
 *               for two slits, dots for one.
 *               Banner: which Re is shown, the fitted wavelength, and a
 *               plain-English verdict.
 *
 *               GraphData packing (set by graph_window_open_slittest):
 *                 x_data[0 .. SG_HDR-1] = header, see the SG_H_* indices
 *                 y_data[0 .. SG_HDR-1] = unused (0)
 *                 then, back to back after the header:
 *                   nb points: x = screen height (m), y = fluid, two slits
 *                   nb points: x = fluid, one slit,   y = waves, two slits
 *                   nb points: x = waves, one slit,   y = unused (0)
 *                   nr points: x = log10(Re),         y = two-slit match
 *                   nr points: x = one-slit match,    y = unused (0)
 *                 Patterns are shares of the screen (each sums to 1);
 *                 matches are 0..1.  Reynolds numbers whose runs gave
 *                 no result are left out of the nr section.
 * ============================================================================= */

#ifndef SLITTEST_GRAPH_H
#define SLITTEST_GRAPH_H

#include <cairo.h>
#include "graph_data.h"

/* header slots in GraphData.x_data */
#define SG_H_NB       0     /* screen bins                                */
#define SG_H_NR       1     /* Reynolds numbers with a result             */
#define SG_H_RE       2     /* Reynolds number shown in the grid          */
#define SG_H_LAMBDA   3     /* wavelength fitted there, m                 */
#define SG_H_MATCH2   4     /* two-slit match there, 0..1                 */
#define SG_H_MATCH1   5     /* one-slit match there, 0..1                 */
#define SG_H_BUMPS2   6     /* fluid bumps, two slits                     */
#define SG_H_BUMPS1   7     /* fluid bumps, one slit                      */
#define SG_H_BANDS2   8     /* wave bands, two slits                      */
#define SG_H_BANDS1   9     /* wave bands, one slit                       */
#define SG_H_NFAIL   10     /* Reynolds numbers that gave no result       */
#define SG_HDR       11     /* header length                              */

/*************************************************************
 * Function:    draw_slittest_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the banner, the four screen patterns and the
 *              match-against-Reynolds panel.  Called by graph.c
 *              on_draw() when plot_type == PLOT_SLITTEST.
 *************************************************************/
void draw_slittest_plot(cairo_t *cr, int w, int h, const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_slittest
 * Input:       void — reads the $slit_* results from parse
 * Output:      void
 * Description: Fetches the sweep, picks the Reynolds number with
 *              the best two-slit match (the one parse names in its
 *              verdict), and opens an autonomous graph window.
 *              Called by input_form.c when plot_type == PLOT_SLITTEST.
 *************************************************************/
void graph_window_open_slittest(void);

#endif /* SLITTEST_GRAPH_H */
