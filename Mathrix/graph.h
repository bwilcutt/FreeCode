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

/*************************************************************
 * Function:    graph_window_open_mohr
 * Input:       void — reads scalar variables from parse
 * Output:      void
 * Description: Queries parse for all Mohr's Circle variables
 *              and opens an autonomous graph window showing
 *              the circle, stress points, and annotations.
 *************************************************************/
void graph_window_open_mohr(void);

/*************************************************************
 * Function:    parse_vector_response
 * Input:       response (const char*) — raw "dump $var" output
 *              out_n    (int*)        — receives element count
 * Output:      double* — g_new'd array, caller g_free()s;
 *              NULL if the dump block is missing or malformed
 * Description: Parses parse's dump block (dump:begin N ...
 *              dump:end).  Shared so module graphs that need
 *              vectors (asteroid_graph.c) reuse it rather than
 *              growing a second copy.
 *************************************************************/
double *parse_vector_response(const char *response, int *out_n);

/*************************************************************
 * Function:    nice_range
 * Input:       lo, hi     — raw data min/max
 *              out_lo     — receives nicely rounded minimum
 *              out_hi     — receives nicely rounded maximum
 *              out_step   — receives tick step size
 * Output:      void
 * Description: Rounds a data range out to tidy tick values.
 *              Shared with module graphs (navier_graph.c).
 *************************************************************/
void nice_range(double lo, double hi,
                double *out_lo, double *out_hi,
                double *out_step);

/*************************************************************
 * Function:    show_text_at
 * Input:       cr    — Cairo context
 *              x, y  — anchor point
 *              text  — string to draw
 *              align — 0 = left, 0.5 = centred, 1 = right
 * Output:      void
 * Description: Draws text horizontally aligned on (x, y) baseline.
 *************************************************************/
void show_text_at(cairo_t *cr, double x, double y,
                  const char *text, double align);

/*************************************************************
 * Struct:      GraphReport
 * Description: The inputs and results printed under a plot.
 *              Built by input_form.c when the Plot button is
 *              pressed, handed to the next graph window that
 *              opens, and freed with that window.  Every string
 *              is owned by the report.
 *************************************************************/
typedef struct
{
    GPtrArray *in_label;     /* input field labels       */
    GPtrArray *in_value;     /* "value units" for each   */
    GPtrArray *out_label;    /* calculated result labels */
    GPtrArray *out_value;    /* "value units" for each   */
} GraphReport;

/*************************************************************
 * Function:    graph_report_new
 * Input:       void
 * Output:      GraphReport* — empty report, free with graph_report_free
 * Description: Allocates a report with four empty string arrays.
 *************************************************************/
GraphReport *graph_report_new(void);

/*************************************************************
 * Function:    graph_report_free
 * Input:       data (gpointer) — GraphReport*, NULL is fine
 * Output:      void
 * Description: Frees the report and every string in it.  Takes
 *              a gpointer so it can be a GDestroyNotify.
 *************************************************************/
void graph_report_free(gpointer data);

/*************************************************************
 * Function:    graph_report_add
 * Input:       r      (GraphReport*) — report to add to
 *              result (int)          — 0 = input, 1 = result
 *              label  (const char*)  — e.g. "Reynolds number"
 *              value  (const char*)  — e.g. "100"
 *              units  (const char*)  — e.g. "m/s", or "" / NULL
 * Output:      void
 * Description: Appends one "label  value units" row.
 *************************************************************/
void graph_report_add(GraphReport *r, int result,
                      const char *label, const char *value,
                      const char *units);

/*************************************************************
 * Function:    graph_set_next_report
 * Input:       r (GraphReport*) — report for the next graph
 *              window, or NULL to discard an unused one
 * Output:      void
 * Description: The next graph_window_open_vars() call takes
 *              ownership of r and prints it under the plot.
 *              Any report still waiting is freed first.
 *************************************************************/
void graph_set_next_report(GraphReport *r);

/* ═══════════════════════════════════════════════════════════
   SHARED PANEL AND FETCH HELPERS — for the module graphs
   ═══════════════════════════════════════════════════════════ */

/* radius of a benchmark dot, pixels */
#define GRAPH_DOT_RADIUS  3.5

/*************************************************************
 * Struct:      GraphAxis
 * Description: One axis of a panel: its nicely rounded range and
 *              tick spacing, as nice_range() returns them.
 *************************************************************/
typedef struct
{
    double lo;
    double hi;
    double step;
} GraphAxis;

/*************************************************************
 * Function:    graph_data_range
 * Input:       a, na    — first array and its length
 *              b, nb    — second array and its length (nb may be 0)
 *              pad_frac — margin added each side, as a fraction
 *                         of the range (0.05 = 5%)
 *              lo, hi   — receive the padded smallest and largest
 * Output:      void
 * Description: Min/max over a curve and its benchmark points
 *              together, widened so nothing touches the frame.
 *************************************************************/
void graph_data_range(const double *a, int na, const double *b, int nb,
                      double pad_frac, double *lo, double *hi);

/*************************************************************
 * Function:    graph_xy_panel
 * Input:       cr             — Cairo context
 *              px, py, pw, ph — panel plot area in pixels
 *              title          — panel heading
 *              x_label        — horizontal axis label
 *              y_label        — vertical axis label
 *              cx, cy, n      — curve points (already in panel x/y order)
 *              dx, dy, nd     — benchmark dots (nd = 0 for none)
 *              ref_y          — reference value drawn as a dashed
 *                               horizontal line, or NAN for none
 *              ax, ay         — axis ranges
 * Output:      void
 * Description: One x/y panel: background, grid, ticks, dashed zero
 *              lines, the curve, benchmark dots and reference line.
 *              Every module panel goes through here, so they cannot
 *              drift apart in style.
 *************************************************************/
void graph_xy_panel(cairo_t *cr,
                    double px, double py, double pw, double ph,
                    const char *title,
                    const char *x_label, const char *y_label,
                    const double *cx, const double *cy, int n,
                    const double *dx, const double *dy, int nd,
                    double ref_y,
                    GraphAxis ax, GraphAxis ay);

/*************************************************************
 * Function:    graph_fetch_scalar
 * Input:       var (const char*) — parse variable, no '$' (e.g. "navier_Re")
 * Output:      double — its value (0 if unknown)
 * Description: One "$name" query to parse.
 *************************************************************/
double graph_fetch_scalar(const char *var);

/*************************************************************
 * Function:    graph_fetch_vector
 * Input:       var   (const char*) — matrix variable, no '$'
 *              out_n (int*)        — receives element count
 * Output:      double* — g_new'd array (caller g_free()s) or NULL
 * Description: Fetches a vector or field of any size, a page of
 *              GRAPH_PAGE_VALUES at a time ("dump $var start= count="),
 *              so a big field never overflows the reply buffer.
 *************************************************************/
double *graph_fetch_vector(const char *var, int *out_n);

#endif /* GRAPH_H */
