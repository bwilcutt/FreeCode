/* =============================================================================
 * File:         channel_graph.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Channel-flow-past-a-cylinder plot for Mathrix.
 *
 *               Top, full width: a colour map of the swirl (vorticity)
 *               over the whole channel, the cylinder drawn in — the wake,
 *               and at higher Re the alternating vortex street.
 *               Bottom: drag and lift coefficients against time, with
 *               the DFG benchmark values as dashed lines when the run is
 *               one of the benchmark cases.
 *               Banner: Re, grid, forces, pressure drop, Strouhal and a
 *               plain-English verdict against the benchmark.
 *
 *               GraphData packing (set by graph_window_open_channel):
 *                 x_data[0 .. CG_HDR-1] = header, see the CG_H_* indices
 *                 y_data[0 .. CG_HDR-1] = unused (0)
 *                 then, back to back after the header:
 *                   nx*ny points: x = vorticity,  y = 1 inside the cylinder
 *                                 (row by row from the bottom of the channel)
 *                   nh points:    x = time,       y = drag coefficient
 *                   nh points:    x = lift coeff, y = unused (0)
 * ============================================================================= */

#ifndef CHANNEL_GRAPH_H
#define CHANNEL_GRAPH_H

#include <cairo.h>
#include "graph_data.h"

/* header slots in GraphData.x_data */
#define CG_H_RE      0     /* Reynolds number                           */
#define CG_H_CD      1     /* drag coefficient (mean when shedding)     */
#define CG_H_CL      2     /* lift coefficient (mean when shedding)     */
#define CG_H_DP      3     /* pressure drop across the cylinder, Pa     */
#define CG_H_ST      4     /* Strouhal number, 0 = no shedding          */
#define CG_H_STEADY  5     /* 1 = settled                               */
#define CG_H_REF     6     /* 0 none, 1 DFG 2D-1, 2 DFG 2D-2            */
#define CG_H_NX      7     /* field columns                             */
#define CG_H_NY      8     /* field rows                                */
#define CG_H_L       9     /* channel length, m                         */
#define CG_H_H      10     /* channel height, m                         */
#define CG_H_CX     11     /* cylinder centre x, m                      */
#define CG_H_CY     12     /* cylinder centre y, m                      */
#define CG_H_D      13     /* cylinder diameter, m                      */
#define CG_H_NH     14     /* force-history points                      */
#define CG_H_CDMAX  15     /* largest drag coefficient, last third      */
#define CG_H_CLMAX  16     /* largest lift coefficient, last third      */
#define CG_HDR      17     /* header length                             */

/*************************************************************
 * Function:    draw_channel_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the swirl map, both force panels and the
 *              banner.  Called by graph.c on_draw() when
 *              plot_type == PLOT_CHANNEL.
 *************************************************************/
void draw_channel_plot(cairo_t *cr, int w, int h, const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_channel
 * Input:       void — reads the $channel_* results from parse
 * Output:      void
 * Description: Fetches the results (the big fields a page at a
 *              time) and opens an autonomous graph window.  Called
 *              by input_form.c when plot_type == PLOT_CHANNEL.
 *************************************************************/
void graph_window_open_channel(void);

#endif /* CHANNEL_GRAPH_H */
