#ifndef GRAPH_H
#define GRAPH_H

/*************************************************************
 * graph.h — autonomous Cairo graph windows for Mathrix
 *
 * Each call to graph_window_open() spawns an independent
 * GtkWindow containing a Cairo drawing area.  Windows are
 * fully autonomous — they can be moved, resized, and closed
 * independently of the main window and of each other.
 *
 * Supported plot types (from module_desc.h PlotType):
 *   PLOT_LINE  — XY line plot with filled area under curve
 *                (PID sim output, CSV data, IFFT result)
 *   PLOT_STEM  — vertical stem / bar plot
 *                (FFT magnitude spectrum)
 *
 * Data is fetched from parse at window-open time by querying
 * the output variables listed in the ModuleDesc.  The window
 * stores its own private copy of the data so it remains valid
 * even if parse runs new commands afterward.
 *
 * Multiple graph windows may be open simultaneously.
 *************************************************************/

#include <gtk/gtk.h>
#include "module_desc.h"

/*************************************************************
 * Function:    graph_window_open
 * Input:       desc (const ModuleDesc*) — module whose plot
 *              variables should be fetched and displayed
 * Output:      void
 * Description: Queries parse for the module's plottable output
 *              variables, allocates a GraphWindow, and shows
 *              an autonomous GtkWindow with the plot rendered
 *              by Cairo.  Returns immediately — the window
 *              runs in the GTK main loop independently.
 *************************************************************/
void graph_window_open(const ModuleDesc *desc);

/*************************************************************
 * Function:    graph_window_open_vars
 * Input:       title    (const char*)   — window title
 *              plot_type (PlotType)     — PLOT_LINE or PLOT_STEM
 *              x_label  (const char*)   — X axis label
 *              y_label  (const char*)   — Y axis label
 *              x_data   (const double*) — X values, or NULL
 *                         (auto-generates 0,1,2,… if NULL)
 *              y_data   (const double*) — Y values
 *              n        (int)           — number of points
 * Output:      void
 * Description: Lower-level entry point for opening a graph
 *              window with caller-supplied data arrays.
 *              Useful for future extensions that generate data
 *              outside of a ModuleDesc context.
 *************************************************************/
void graph_window_open_vars(const char   *title,
                            PlotType      plot_type,
                            const char   *x_label,
                            const char   *y_label,
                            const double *x_data,
                            const double *y_data,
                            int           n);

#endif /* GRAPH_H */
