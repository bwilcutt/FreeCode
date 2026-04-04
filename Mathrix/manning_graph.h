#ifndef MANNING_GRAPH_H
#define MANNING_GRAPH_H
 
/*************************************************************
 * manning_graph.h — Manning's Equation Cairo drawing for Mathrix
 *
 * Left panel:  trapezoidal open-channel cross-section with
 *              water body, flow arrow annotated with V,
 *              hydraulic radius dashed line, slope indicator,
 *              roughness label, and optional Q / Fr results.
 *
 * Right panel: horizontal bar chart of the three Manning's
 *              equation factors (k/n, R^2/3, S^1/2) showing
 *              their relative magnitudes, plus the resulting
 *              V bar and optional Q and Fr values below.
 *
 * GraphData packing (set by graph_window_open_manning):
 *   x_data[0] = n    roughness coefficient
 *   x_data[1] = R    hydraulic radius
 *   x_data[2] = S    channel slope
 *   x_data[3] = A    flow area        (0 if not supplied)
 *   x_data[4] = D    hydraulic depth  (0 if not supplied)
 *   x_data[5] = k    unit conv factor (1.0 SI, 1.486 US)
 *   y_data[0] = V    flow velocity
 *   y_data[1] = Q    discharge        (0 if not computed)
 *   y_data[2] = Fr   Froude number    (0 if not computed)
 *************************************************************/
 
#include <cairo.h>
#include "graph_data.h"
 
/*************************************************************
 * Function:    draw_manning_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData packed as above
 * Output:      void
 * Description: Draws the complete Manning's Equation diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_MANNING.
 *************************************************************/
void draw_manning_plot(cairo_t *cr, int w, int h,
                        const GraphData *gd);
 
/*************************************************************
 * Function:    graph_window_open_manning
 * Input:       void — reads $manning_* variables from parse
 * Output:      void
 * Description: Queries parse for all Manning's variables and
 *              opens an autonomous graph window.
 *              Note: $manning_k and $manning_n/$manning_R/$manning_S
 *              must be stored by run_manning() for this to work.
 *************************************************************/
void graph_window_open_manning(void);
 
#endif /* MANNING_GRAPH_H */