#ifndef MOHR_GRAPH_H
#define MOHR_GRAPH_H

/*************************************************************
 * mohr_graph.h — Mohr's Circle Cairo drawing for Mathrix
 *
 * Lives in calc/Algo/ alongside mohr.c and mohr.h.
 * Compiled as part of the Mathrix GUI build.
 *************************************************************/

#include <cairo.h>
#include "graph_data.h"

/*************************************************************
 * Function:    draw_mohr_plot
 * Input:       cr  — Cairo context
 *              w,h — drawing area dimensions in pixels
 *              gd  — GraphData carrying:
 *                    x_data[0]=sx  x_data[1]=sy  x_data[2]=txy
 *                    y_data[0]=s1  y_data[1]=s2
 *                    y_data[2]=tmax y_data[3]=theta
 * Output:      void
 * Description: Draws the complete Mohr's Circle diagram with
 *              circle, labeled stress points, axes, grid, and
 *              two stress element panels on the right.
 *              Called by graph.c's on_draw() callback when
 *              plot_type == PLOT_MOHR.
 *************************************************************/
void draw_mohr_plot(cairo_t *cr, int w, int h,
                    const GraphData *gd);

/*************************************************************
 * Function:    draw_stress_element
 * Input:       cr        — Cairo context
 *              ex, ey    — top-left corner of panel area
 *              epw, eph  — panel width and height
 *              sig_x     — normal stress on x-face
 *              sig_y     — normal stress on y-face
 *              tau_xy    — shear stress
 *              angle_deg — rotation angle in degrees
 *              title     — panel title string
 * Output:      void
 * Description: Draws a labeled 2-D stress element with normal
 *              and shear stress arrows on all four faces.
 *              Called by draw_mohr_plot() for both the original
 *              and principal element panels.
 *************************************************************/
void draw_stress_element(cairo_t *cr,
                          double ex, double ey,
                          double epw, double eph,
                          double sig_x, double sig_y,
                          double tau_xy, double angle_deg,
                          const char *title);

/*************************************************************
 * Function:    graph_window_open_mohr
 * Input:       void — reads $mohrs_* variables from parse
 * Output:      void
 * Description: Queries parse for all seven Mohr's Circle
 *              variables (s1, s2, tmax, theta, sx, sy, txy),
 *              packs them into a GraphData, and opens an
 *              autonomous GTK graph window.
 *              Called by input_form_plot() when the current
 *              module has plot_type == PLOT_MOHR.
 *************************************************************/
void graph_window_open_mohr(void);

#endif /* MOHR_GRAPH_H */
