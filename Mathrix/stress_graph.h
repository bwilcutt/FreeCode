#ifndef STRESS_GRAPH_H
#define STRESS_GRAPH_H

/*************************************************************
 * stress_graph.h — Axial stress/strain Cairo drawing for Mathrix
 *
 * Draws two side-by-side panels:
 *   Left:  member diagram — bar with force arrows, cross-section
 *          annotation, and sigma/eps/delta labels
 *   Right: stress-strain plot — linear elastic line from origin,
 *          dot at the current operating point, axes labeled σ/ε
 *
 * GraphData packing (set by graph_window_open_stress):
 *   x_data[0] = F       axial force
 *   x_data[1] = A       cross-sectional area
 *   x_data[2] = E       Young's modulus (0 if not provided)
 *   x_data[3] = L       member length   (0 if not provided)
 *
 *   y_data[0] = sigma   axial stress
 *   y_data[1] = eps     axial strain    (0 if not computed)
 *   y_data[2] = delta   deformation     (0 if not computed)
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_stress_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData as packed above
 * Output:      void
 * Description: Draws the complete stress/strain diagram.
 *              Called by graph.c on_draw() when
 *              plot_type == PLOT_STRESS.
 *************************************************************/
void draw_stress_plot(cairo_t *cr, int w, int h,
                      const GraphData *gd);

/*************************************************************
 * Function:    graph_window_open_stress
 * Input:       void — reads $stress_* variables from parse
 * Output:      void
 * Description: Queries parse for all stress variables and opens
 *              an autonomous graph window showing the diagram.
 *              Called by input_form.c when plot_type == PLOT_STRESS.
 *************************************************************/
void graph_window_open_stress(void);

#endif /* STRESS_GRAPH_H */
