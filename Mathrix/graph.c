#include "graph.h"
#include "app_state.h"
#include "pipe_mgr.h"
#include "colors.h"
#include "mohr_graph.h"
#include "beam_graph.h"
#include "stress_graph.h"
#include "reynolds_graph.h"
#include "darcy_graph.h"
#include "bernoulli_graph.h"
#include "orifice_graph.h"
#include "idealgas_graph.h"
#include "specheat_graph.h"
#include "heatcond_graph.h"
#include "manning_graph.h"
#include "asteroid_graph.h"
#include "navier_graph.h"
#include "channel_graph.h"
#include "slittest_graph.h"
#include <gtk/gtk.h>
#include <cairo.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

/* ═══════════════════════════════════════════════════════════
   CONSTANTS — visual style
   ═══════════════════════════════════════════════════════════ */

#define GRAPH_PAD_TOP     50.0
#define GRAPH_PAD_BOTTOM  60.0
#define GRAPH_PAD_LEFT    72.0
#define GRAPH_PAD_RIGHT   24.0
#define GRAPH_TICK_LEN     6.0
#define GRAPH_N_YTICKS     6
#define GRAPH_N_XTICKS     8
#define GRAPH_MIN_W      500
#define GRAPH_MIN_H      380
#define GRAPH_PAGE_VALUES 2000     /* values per "dump" page: ~50 KB, safely
                                      inside the 64 KB reply buffer         */

/* ── printed page: the inputs/results block under the plot ── */
#define PRINT_FONT        8.5      /* points                                */
#define PRINT_LINE_H     11.5      /* points per row                        */
#define PRINT_GAP        14.0      /* space between plot and the block      */
#define PRINT_HEAD_H     16.0      /* "Inputs" / "Results" heading row      */
#define PRINT_MAX_FRAC    0.40     /* block never takes more of the page    */
#define PRINT_RASTER_SCALE 4.0     /* plot raster: 4 px per point ≈ 288 dpi */
#define PRINT_WHITE_ABOVE  0.78    /* lightness (after the flip) that goes
                                      to pure paper white: the dark window
                                      and panel backgrounds land up here    */

/* local aliases from colors.h semantic names */
#define COL_BG_R        MX_GRAPH_BG_R
#define COL_BG_G        MX_GRAPH_BG_G
#define COL_BG_B        MX_GRAPH_BG_B
#define COL_PANEL_R     MX_GRAPH_PANEL_R
#define COL_PANEL_G     MX_GRAPH_PANEL_G
#define COL_PANEL_B     MX_GRAPH_PANEL_B
#define COL_GRID_R      MX_GRAPH_GRID_R
#define COL_GRID_G      MX_GRAPH_GRID_G
#define COL_GRID_B      MX_GRAPH_GRID_B
#define COL_GRID_A      MX_GRAPH_GRID_A
#define COL_AXIS_R      MX_GRAPH_AXIS_R
#define COL_AXIS_G      MX_GRAPH_AXIS_G
#define COL_AXIS_B      MX_GRAPH_AXIS_B
#define COL_TEXT_R      MX_GRAPH_TEXT_R
#define COL_TEXT_G      MX_GRAPH_TEXT_G
#define COL_TEXT_B      MX_GRAPH_TEXT_B
#define COL_TITLE_R     MX_GRAPH_TITLE_R
#define COL_TITLE_G     MX_GRAPH_TITLE_G
#define COL_TITLE_B     MX_GRAPH_TITLE_B
#define COL_LINE_R      MX_GRAPH_LINE_R
#define COL_LINE_G      MX_GRAPH_LINE_G
#define COL_LINE_B      MX_GRAPH_LINE_B
#define COL_FILL_A      MX_GRAPH_FILL_A
#define COL_STEM_R      MX_GRAPH_STEM_R
#define COL_STEM_G      MX_GRAPH_STEM_G
#define COL_STEM_B      MX_GRAPH_STEM_B
#define COL_DOT_R       MX_GRAPH_DOT_R
#define COL_DOT_G       MX_GRAPH_DOT_G
#define COL_DOT_B       MX_GRAPH_DOT_B
#define COL_ZERO_R      MX_GRAPH_ZERO_R
#define COL_ZERO_G      MX_GRAPH_ZERO_G
#define COL_ZERO_B      MX_GRAPH_ZERO_B
#define COL_ZERO_A      MX_GRAPH_ZERO_A

/* ═══════════════════════════════════════════════════════════
   GRAPH WINDOW DATA
   Defined in graph_data.h so mohr_graph.c can access it too.
   ═══════════════════════════════════════════════════════════ */

#include "graph_data.h"

/* ═══════════════════════════════════════════════════════════
   FORWARD DECLARATIONS
   ═══════════════════════════════════════════════════════════ */

static void      graph_data_free      (GraphData *gd);
static GraphData *fetch_module_data   (const ModuleDesc *desc);
static void      on_draw              (GtkDrawingArea *da,
                                       cairo_t *cr,
                                       int w, int h,
                                       gpointer user_data);
static void      draw_line_plot       (cairo_t *cr, int w, int h,
                                       const GraphData *gd);
static void      draw_stem_plot       (cairo_t *cr, int w, int h,
                                       const GraphData *gd);
static void      draw_axes            (cairo_t *cr,
                                       double px, double py,
                                       double pw, double ph,
                                       double x_lo, double x_hi,
                                       double y_lo, double y_hi,
                                       double x_step, double y_step,
                                       const GraphData *gd);
static void      on_window_destroy    (GtkWidget *w, gpointer user_data);
static void      on_print_clicked     (GtkButton *btn, gpointer user_data);
static void      on_print_draw_page   (GtkPrintOperation *op,
                                       GtkPrintContext   *ctx,
                                       int                page_nr,
                                       gpointer           user_data);
static void      paint_plot_for_paper (cairo_t *cr, GraphData *gd,
                                       double w, double h);
static void      paperize_pixel       (guint32 *px);
static void      draw_report_column   (cairo_t *cr, double x, double y,
                                       double col_w, const char *heading,
                                       GPtrArray *labels, GPtrArray *values);

/* report waiting for the next graph window (see graph_set_next_report) */
static GraphReport *g_next_report = NULL;

/* ═══════════════════════════════════════════════════════════
   PUBLIC — graph_window_open
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    graph_window_open
 * Input:       desc (const ModuleDesc*) — module descriptor
 * Output:      void
 * Description: Fetches the module's plottable output variable
 *              from parse, then calls graph_window_open_vars()
 *              to spawn the autonomous window.
 *************************************************************/
void graph_window_open(const ModuleDesc *desc)
{
    GraphData *gd;
    int        i;
    const char *y_label = "value";

    if (!desc || !desc->has_plot) return;

    gd = fetch_module_data(desc);
    if (!gd || gd->n == 0)
    {
        app_status_set("No plot data — run the command first");
        if (gd) graph_data_free(gd);
        return;
    }

    /* find the Y axis label from the output descriptor */
    for (i = 0; i < desc->n_outputs; i++)
        if (strcmp(desc->outputs[i].plot_role, "y") == 0)
        {
            y_label = desc->outputs[i].label;
            break;
        }

    graph_window_open_vars(
        desc->plot_title ? desc->plot_title : desc->label,
        desc->plot_type,
        "Sample",
        y_label,
        gd->x_data,
        gd->y_data,
        gd->n);

    graph_data_free(gd);
}

/*************************************************************
 * Function:    graph_window_open_vars
 * Input:       title     — window title string
 *              plot_type — PLOT_LINE or PLOT_STEM
 *              x_label   — X axis label
 *              y_label   — Y axis label
 *              x_data    — X values (NULL = auto 0,1,2,…)
 *              y_data    — Y values
 *              n         — number of data points
 * Output:      void
 * Description: Allocates a private GraphData copy, creates a
 *              GtkWindow with a GtkDrawingArea, connects the
 *              Cairo draw callback, and shows the window.
 *************************************************************/
void graph_window_open_vars(const char   *title,
                            PlotType      plot_type,
                            const char   *x_label,
                            const char   *y_label,
                            const double *x_data,
                            const double *y_data,
                            int           n)
{
    AppState      *st = app_state_get();
    GtkWidget     *window;
    GtkWidget     *da;
    GtkWidget     *vbox;
    GtkWidget     *toolbar;
    GtkWidget     *close_btn;
    GtkWidget     *print_btn;
    GtkWidget     *title_lbl;
    GraphData     *gd;
    int            i;

    if (!y_data || n <= 0) return;

    /* ── private data copy ── */
    gd            = g_new0(GraphData, 1);
    gd->title     = g_strdup(title   ? title   : "Graph");
    gd->x_label   = g_strdup(x_label ? x_label : "X");
    gd->y_label   = g_strdup(y_label ? y_label : "Y");
    gd->n         = n;
    gd->plot_type = plot_type;

    gd->y_data = g_new(double, n);
    memcpy(gd->y_data, y_data, n * sizeof(double));

    gd->x_data = g_new(double, n);
    if (x_data)
        memcpy(gd->x_data, x_data, n * sizeof(double));
    else
        for (i = 0; i < n; i++) gd->x_data[i] = (double)i;

    /* ── autonomous window ── */
    window = gtk_window_new();
    gtk_window_set_title(GTK_WINDOW(window), gd->title);
    gtk_window_set_default_size(GTK_WINDOW(window),
                                plot_type == PLOT_CHANNEL ||
                                plot_type == PLOT_SLITTEST
                                ? GRAPH_MIN_W + 500
                                : plot_type == PLOT_NAVIER
                                ? GRAPH_MIN_W + 400
                                : plot_type == PLOT_MOHR
                                ? GRAPH_MIN_W + 280
                                : plot_type == PLOT_BERNOULLI
                                ? GRAPH_MIN_W + 200
                                : GRAPH_MIN_W + 100,
                                plot_type == PLOT_CHANNEL ||
                                plot_type == PLOT_SLITTEST
                                ? GRAPH_MIN_H + 300
                                : plot_type == PLOT_NAVIER
                                ? GRAPH_MIN_H + 140
                                : plot_type == PLOT_BERNOULLI
                                ? GRAPH_MIN_H + 110
                                : GRAPH_MIN_H + 60);
    gtk_window_set_transient_for(GTK_WINDOW(window),
                                  GTK_WINDOW(st->window));
    /* NOT modal — autonomous */
    gtk_window_set_modal(GTK_WINDOW(window), FALSE);
    gtk_window_set_destroy_with_parent(GTK_WINDOW(window), FALSE);

    /* ── layout ── */
    vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    /* thin toolbar with title and close button */
    toolbar = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    gtk_widget_add_css_class(toolbar, "graph-toolbar");
    gtk_widget_set_margin_start(toolbar, 12);
    gtk_widget_set_margin_end(toolbar, 8);
    gtk_widget_set_margin_top(toolbar, 6);
    gtk_widget_set_margin_bottom(toolbar, 6);

    title_lbl = gtk_label_new(gd->title);
    gtk_widget_set_hexpand(title_lbl, TRUE);
    gtk_label_set_xalign(GTK_LABEL(title_lbl), 0.0f);
    gtk_widget_add_css_class(title_lbl, "graph-title-lbl");
    gtk_box_append(GTK_BOX(toolbar), title_lbl);

    /* Print sits just before Close.  It prints the plot only — no
       toolbar — with the inputs and results listed underneath */
    print_btn = gtk_button_new_with_label("🖨 Print");
    gtk_widget_add_css_class(print_btn, "mathrix-run-btn");
    g_signal_connect(print_btn, "clicked",
                     G_CALLBACK(on_print_clicked), window);
    gtk_box_append(GTK_BOX(toolbar), print_btn);

    close_btn = gtk_button_new_with_label("✕ Close");
    gtk_widget_add_css_class(close_btn, "mathrix-run-btn");
    g_signal_connect_swapped(close_btn, "clicked",
                              G_CALLBACK(gtk_window_destroy), window);
    gtk_box_append(GTK_BOX(toolbar), close_btn);
    gtk_box_append(GTK_BOX(vbox), toolbar);

    /* separator */
    gtk_box_append(GTK_BOX(vbox),
                   gtk_separator_new(GTK_ORIENTATION_HORIZONTAL));

    /* ── Cairo drawing area ── */
    da = gtk_drawing_area_new();
    gtk_widget_set_vexpand(da, TRUE);
    gtk_widget_set_hexpand(da, TRUE);
    gtk_widget_set_size_request(da, GRAPH_MIN_W, GRAPH_MIN_H);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(da),
                                    on_draw, gd, NULL);
    gtk_box_append(GTK_BOX(vbox), da);

    /* the print callback finds the data and the report on the window */
    g_object_set_data(G_OBJECT(window), "mx-graph-data", gd);
    if (g_next_report)
    {
        g_object_set_data_full(G_OBJECT(window), "mx-graph-report",
                               g_next_report, graph_report_free);
        g_next_report = NULL;            /* the window owns it now */
    }

    /* free gd when window is destroyed */
    g_signal_connect(window, "destroy",
                     G_CALLBACK(on_window_destroy), gd);

    gtk_window_set_child(GTK_WINDOW(window), vbox);
    gtk_window_present(GTK_WINDOW(window));

    app_status_set("Graph: %s", gd->title);
}

/* ═══════════════════════════════════════════════════════════
   DATA FETCH
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    fetch_module_data
 * Input:       desc (const ModuleDesc*) — module descriptor
 * Output:      GraphData* — heap-allocated data, caller frees;
 *              or NULL on failure
 * Description: Finds the first output variable with
 *              plot_role=="y", queries parse for its value
 *              using "dump $varname", parses the response into
 *              a double array, and returns it wrapped in a
 *              GraphData struct with auto-generated X values.
 *************************************************************/
static GraphData *fetch_module_data(const ModuleDesc *desc)
{
    AppState   *st = app_state_get();
    const char *y_var = NULL;
    const char *y_suffix = NULL;
    char        cmd[128];
    char        try_var[64];
    int         i;
    int         n = 0;
    double     *y_data;
    GraphData  *gd;

    /* find the Y variable and its suffix */
    for (i = 0; i < desc->n_outputs; i++)
        if (strcmp(desc->outputs[i].plot_role, "y") == 0)
        {
            y_var = desc->outputs[i].var_name;
            break;
        }
    if (!y_var) return NULL;

    /* ── first try the descriptor's default variable name ── */
    snprintf(cmd, sizeof(cmd), "dump $%s\n", y_var);
    if (pipe_transact(cmd, st->response_buf, RESPONSE_BUFSIZE))
    {
        y_data = parse_vector_response(st->response_buf, &n);
        if (y_data && n > 0)
        {
            gd         = g_new0(GraphData, 1);
            gd->n      = n;
            gd->y_data = y_data;
            gd->x_data = g_new(double, n);
            for (i = 0; i < n; i++) gd->x_data[i] = (double)i;
            return gd;
        }
        g_free(y_data);
    }

    /* ── fallback: find the suffix of the descriptor var name ──
       e.g. "ifft_out" → suffix "_out", "fft_mag" → suffix "_mag"
       Then scan mats output for a variable ending in that suffix. ── */
    y_suffix = strrchr(y_var, '_');
    if (!y_suffix) return NULL;

    /* get list of matrix variables */
    if (!pipe_transact("mats\n", st->response_buf, RESPONSE_BUFSIZE))
        return NULL;

    /* scan response for lines like "  $varname  [NxM]" */
    {
        const char *p = st->response_buf;
        char        var_name[64];
        int         vlen;

        while (*p)
        {
            /* skip to '$' */
            while (*p && *p != '$') p++;
            if (!*p) break;
            p++; /* skip '$' */

            /* read variable name */
            vlen = 0;
            while (*p && !isspace((unsigned char)*p) && vlen < 63)
                var_name[vlen++] = *p++;
            var_name[vlen] = '\0';

            /* check if this var ends with the right suffix */
            if (vlen > 0)
            {
                char *suf = strrchr(var_name, '_');
                if (suf && strcmp(suf, y_suffix) == 0)
                {
                    /* try dumping this variable */
                    snprintf(cmd, sizeof(cmd), "dump $%s\n", var_name);
                    if (pipe_transact(cmd, st->response_buf,
                                      RESPONSE_BUFSIZE))
                    {
                        y_data = parse_vector_response(
                                     st->response_buf, &n);
                        if (y_data && n > 0)
                        {
                            gd         = g_new0(GraphData, 1);
                            gd->n      = n;
                            gd->y_data = y_data;
                            gd->x_data = g_new(double, n);
                            for (i = 0; i < n; i++)
                                gd->x_data[i] = (double)i;
                            return gd;
                        }
                        g_free(y_data);
                    }
                }
            }
        }
    }

    return NULL;
}

/*************************************************************
 * Function:    parse_vector_response
 * Input:       response (const char*) — raw dump command output
 *              out_n    (int*)        — receives element count
 * Output:      double* — heap-allocated array, caller frees;
 *              NULL on parse failure
 * Description: Parses the dump command block format:
 *                dump:begin <N>
 *                <val0>
 *                <val1>
 *                ...
 *                dump:end
 *              Allocates exactly N doubles and fills them.
 *              Returns NULL if the block is missing or malformed.
 *************************************************************/
double *parse_vector_response(const char *response, int *out_n)
{
    const char *p     = response;
    int         n     = 0;
    double     *buf   = NULL;
    int         i;
    char        line[64];
    const char *q;
    char       *end;

    *out_n = 0;

    /* ── find dump:begin <N> ── */
    while (*p)
    {
        q = p;
        while (*q && *q != '\n') q++;
        if (strncmp(p, "dump:begin ", 11) == 0)
        {
            n = atoi(p + 11);
            p = (*q == '\n') ? q + 1 : q;
            break;
        }
        p = (*q == '\n') ? q + 1 : q;
    }

    if (n <= 0) return NULL;

    buf = g_new(double, n);

    /* ── read N values ── */
    for (i = 0; i < n && *p; i++)
    {
        q = p;
        while (*q && *q != '\n') q++;
        if (strncmp(p, "dump:end", 8) == 0) break;

        /* copy line and parse */
        int len = (int)(q - p);
        if (len >= (int)sizeof(line)) len = sizeof(line) - 1;
        memcpy(line, p, len);
        line[len] = '\0';

        buf[i] = strtod(line, &end);
        p = (*q == '\n') ? q + 1 : q;
    }

    *out_n = i;
    return buf;
}

/* ═══════════════════════════════════════════════════════════
   AXIS HELPERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    nice_range
 * Input:       lo, hi     — raw data min/max
 *              out_lo     — receives nicely rounded minimum
 *              out_hi     — receives nicely rounded maximum
 *              out_step   — receives tick step size
 * Output:      void
 * Description: Computes a "nice" axis range and step using the
 *              standard algorithm: find the data range, pick a
 *              round step size, then floor/ceil to that step.
 *************************************************************/
void nice_range(double lo, double hi,
                double *out_lo, double *out_hi,
                double *out_step)
{
    double range = hi - lo;
    double mag;
    double step;

    if (range < 1e-12) range = 1.0;

    mag  = pow(10.0, floor(log10(range / GRAPH_N_YTICKS)));
    step = mag;
    if      (range / (mag * 10) < 1.5) step = mag;
    else if (range / (mag * 10) < 3.5) step = mag * 2;
    else if (range / (mag * 10) < 7.5) step = mag * 5;
    else                                step = mag * 10;

    *out_step = step;
    *out_lo   = floor(lo / step) * step;
    *out_hi   = ceil (hi / step) * step;
}

/*************************************************************
 * Function:    show_text_at
 * Input:       cr    — Cairo context
 *              x, y  — anchor point
 *              text  — string to draw
 *              align — 0 = left, 0.5 = centred, 1 = right
 * Output:      void
 * Description: Draws text horizontally aligned on (x, y) baseline.
 *              Shared by the module graphs (asteroid_graph.c,
 *              navier_graph.c) so each one does not carry its own.
 *************************************************************/
void show_text_at(cairo_t *cr, double x, double y,
                  const char *text, double align)
{
    cairo_text_extents_t te;

    cairo_text_extents(cr, text, &te);
    cairo_move_to(cr, x - te.x_advance * align, y);
    cairo_show_text(cr, text);
}

/* ═══════════════════════════════════════════════════════════
   CAIRO DRAWING
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    on_draw
 * Input:       da        — the GtkDrawingArea
 *              cr        — Cairo context
 *              w, h      — widget dimensions in pixels
 *              user_data — pointer to GraphData
 * Output:      void (gboolean return for GTK signature)
 * Description: Main Cairo draw callback.  Clears background,
 *              then delegates to draw_line_plot() or
 *              draw_stem_plot() based on gd->plot_type.
 *************************************************************/
static void on_draw(GtkDrawingArea *da, cairo_t *cr,
                    int w, int h, gpointer user_data)
{
    const GraphData *gd = (const GraphData *)user_data;

    /* background */
    cairo_set_source_rgb(cr, COL_BG_R, COL_BG_G, COL_BG_B);
    cairo_paint(cr);

    if (!gd || gd->n < 1) return;

    if (gd->plot_type == PLOT_STEM)
        draw_stem_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_MOHR)
        draw_mohr_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_BEAM)
        draw_beam_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_STRESS)
        draw_stress_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_REYNOLDS)
        draw_reynolds_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_DARCY)
        draw_darcy_plot(cr, w, h, gd); 
    else if (gd->plot_type == PLOT_BERNOULLI)
        draw_bernoulli_plot(cr, w, h, gd);    
    else if (gd->plot_type == PLOT_ORIFICE)
        draw_orifice_plot(cr, w, h, gd);                   
    else if (gd->plot_type == PLOT_IDEALGAS)
        draw_idealgas_plot(cr, w, h, gd);                   
    else if (gd->plot_type == PLOT_HEATCOND)
        draw_heatcond_plot(cr, w, h, gd);                   
    else if (gd->plot_type == PLOT_SPECHEAT)
        draw_specheat_plot(cr, w, h, gd);  
    else if (gd->plot_type == PLOT_MANNING)
        draw_manning_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_ASTEROID)
        draw_asteroid_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_NAVIER)
        draw_navier_plot(cr, w, h, gd);
    else if (gd->plot_type == PLOT_CHANNEL)
        draw_channel_plot(cr, w, h, gd);                         
    else if (gd->plot_type == PLOT_SLITTEST)
        draw_slittest_plot(cr, w, h, gd);
    else
        draw_line_plot(cr, w, h, gd);
}

/*************************************************************
 * Function:    draw_axes
 * Input:       cr            — Cairo context
 *              px, py        — plot area origin (top-left)
 *              pw, ph        — plot area width and height
 *              x_lo, x_hi   — axis data range X
 *              y_lo, y_hi   — axis data range Y
 *              x_step, y_step— tick spacing
 *              gd            — GraphData (for labels)
 * Output:      void
 * Description: Draws the plot panel background, grid lines,
 *              axis lines, tick marks, tick labels, axis
 *              labels, and the title.  Called by both plot
 *              type renderers before drawing data.
 *************************************************************/
static void draw_axes(cairo_t *cr,
                      double px, double py, double pw, double ph,
                      double x_lo, double x_hi,
                      double y_lo, double y_hi,
                      double x_step, double y_step,
                      const GraphData *gd)
{
    double tick;
    double sx, sy;
    char   label[32];

    /* ── panel background ── */
    cairo_set_source_rgb(cr, COL_PANEL_R, COL_PANEL_G, COL_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── grid lines ── */
    cairo_set_source_rgba(cr, COL_GRID_R, COL_GRID_G, COL_GRID_B,
                          COL_GRID_A);
    cairo_set_line_width(cr, 0.5);
    cairo_set_dash(cr, (double[]){4.0, 4.0}, 2, 0);

    /* horizontal grid (Y ticks) */
    for (tick = y_lo; tick <= y_hi + y_step * 0.01; tick += y_step)
    {
        sy = py + ph - (tick - y_lo) / (y_hi - y_lo) * ph;
        if (sy < py - 1 || sy > py + ph + 1) continue;
        cairo_move_to(cr, px, sy);
        cairo_line_to(cr, px + pw, sy);
        cairo_stroke(cr);
    }

    /* vertical grid (X ticks) */
    for (tick = x_lo; tick <= x_hi + x_step * 0.01; tick += x_step)
    {
        sx = px + (tick - x_lo) / (x_hi - x_lo) * pw;
        if (sx < px - 1 || sx > px + pw + 1) continue;
        cairo_move_to(cr, sx, py);
        cairo_line_to(cr, sx, py + ph);
        cairo_stroke(cr);
    }
    cairo_set_dash(cr, NULL, 0, 0);

    /* ── zero line (Y=0) ── */
    if (y_lo < 0 && y_hi > 0)
    {
        sy = py + ph - (0.0 - y_lo) / (y_hi - y_lo) * ph;
        cairo_set_source_rgba(cr, COL_ZERO_R, COL_ZERO_G,
                              COL_ZERO_B, COL_ZERO_A);
        cairo_set_line_width(cr, 1.0);
        cairo_move_to(cr, px, sy);
        cairo_line_to(cr, px + pw, sy);
        cairo_stroke(cr);
    }

    /* ── axis lines ── */
    cairo_set_source_rgb(cr, COL_AXIS_R, COL_AXIS_G, COL_AXIS_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_stroke(cr);

    /* ── tick marks and labels ── */
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);

    /* Y ticks */
    for (tick = y_lo; tick <= y_hi + y_step * 0.01; tick += y_step)
    {
        cairo_text_extents_t te;
        sy = py + ph - (tick - y_lo) / (y_hi - y_lo) * ph;
        if (sy < py - 1 || sy > py + ph + 1) continue;

        /* tick mark */
        cairo_set_source_rgb(cr, COL_AXIS_R, COL_AXIS_G, COL_AXIS_B);
        cairo_move_to(cr, px - GRAPH_TICK_LEN, sy);
        cairo_line_to(cr, px, sy);
        cairo_stroke(cr);

        /* label */
        snprintf(label, sizeof(label),
                 fabs(tick) < 1e4 && fabs(tick) >= 0.01 ? "%.3g" : "%.2e",
                 tick);
        cairo_text_extents(cr, label, &te);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_move_to(cr, px - GRAPH_TICK_LEN - te.width - 4,
                          sy + te.height / 2.0);
        cairo_show_text(cr, label);
    }

    /* X ticks */
    for (tick = x_lo; tick <= x_hi + x_step * 0.01; tick += x_step)
    {
        cairo_text_extents_t te;
        sx = px + (tick - x_lo) / (x_hi - x_lo) * pw;
        if (sx < px - 1 || sx > px + pw + 1) continue;

        cairo_set_source_rgb(cr, COL_AXIS_R, COL_AXIS_G, COL_AXIS_B);
        cairo_move_to(cr, sx, py + ph);
        cairo_line_to(cr, sx, py + ph + GRAPH_TICK_LEN);
        cairo_stroke(cr);

        snprintf(label, sizeof(label), "%.3g", tick);
        cairo_text_extents(cr, label, &te);
        cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
        cairo_move_to(cr, sx - te.width / 2.0,
                          py + ph + GRAPH_TICK_LEN + te.height + 4);
        cairo_show_text(cr, label);
    }

    /* ── Y axis label (rotated) ── */
    cairo_save(cr);
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    cairo_translate(cr, 14.0, py + ph / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, gd->y_label, &te);
        cairo_move_to(cr, -te.width / 2.0, te.height / 2.0);
        cairo_show_text(cr, gd->y_label);
    }
    cairo_restore(cr);

    /* ── X axis label ── */
    cairo_set_font_size(cr, 11.0);
    cairo_set_source_rgb(cr, COL_TEXT_R, COL_TEXT_G, COL_TEXT_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, gd->x_label, &te);
        cairo_move_to(cr, px + pw / 2.0 - te.width / 2.0,
                          py + ph + GRAPH_PAD_BOTTOM - 8.0);
        cairo_show_text(cr, gd->x_label);
    }

    /* ── title ── */
    cairo_set_font_size(cr, 14.0);
    cairo_select_font_face(cr, "Sans",
                           CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_source_rgb(cr, COL_TITLE_R, COL_TITLE_G, COL_TITLE_B);
    {
        cairo_text_extents_t te;
        cairo_text_extents(cr, gd->title, &te);
        cairo_move_to(cr, px + pw / 2.0 - te.width / 2.0, 28.0);
        cairo_show_text(cr, gd->title);
    }
}

/*************************************************************
 * Function:    draw_line_plot
 * Input:       cr  — Cairo context
 *              w, h — widget size
 *              gd  — graph data
 * Output:      void
 * Description: Renders a line plot with a translucent filled
 *              area under the curve.  Uses anti-aliased Cairo
 *              lines with a shadow pass for depth.
 *************************************************************/
static void draw_line_plot(cairo_t *cr, int w, int h,
                           const GraphData *gd)
{
    double px, py, pw, ph;
    double x_lo, x_hi, x_step;
    double y_lo, y_hi, y_step;
    double y_min, y_max;
    double sx, sy, sy0;
    int    i;

    px = GRAPH_PAD_LEFT;
    py = GRAPH_PAD_TOP;
    pw = w - GRAPH_PAD_LEFT - GRAPH_PAD_RIGHT;
    ph = h - GRAPH_PAD_TOP  - GRAPH_PAD_BOTTOM;
    if (pw < 1 || ph < 1) return;

    /* data range */
    y_min = y_max = gd->y_data[0];
    for (i = 1; i < gd->n; i++)
    {
        if (gd->y_data[i] < y_min) y_min = gd->y_data[i];
        if (gd->y_data[i] > y_max) y_max = gd->y_data[i];
    }
    if (y_min == y_max) { y_min -= 1.0; y_max += 1.0; }

    nice_range(y_min, y_max, &y_lo, &y_hi, &y_step);
    nice_range(gd->x_data[0], gd->x_data[gd->n - 1],
               &x_lo, &x_hi, &x_step);

    draw_axes(cr, px, py, pw, ph,
              x_lo, x_hi, y_lo, y_hi, x_step, y_step, gd);

    /* ── clip to plot area ── */
    cairo_save(cr);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_clip(cr);

    /* Y=0 baseline for fill */
    sy0 = py + ph - (0.0 - y_lo) / (y_hi - y_lo) * ph;
    sy0 = fmax(py, fmin(py + ph, sy0));

#define SX(xi) (px + ((xi) - x_lo) / (x_hi - x_lo) * pw)
#define SY(yi) (py + ph - ((yi) - y_lo) / (y_hi - y_lo) * ph)

    /* ── shadow pass (slightly offset, low opacity) ── */
    cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
    cairo_set_line_width(cr, 3.5);
    cairo_move_to(cr, SX(gd->x_data[0]) + 1,
                      SY(gd->y_data[0]) + 2);
    for (i = 1; i < gd->n; i++)
        cairo_line_to(cr, SX(gd->x_data[i]) + 1,
                          SY(gd->y_data[i]) + 2);
    cairo_stroke(cr);

    /* ── filled area ── */
    cairo_set_source_rgba(cr, COL_LINE_R, COL_LINE_G, COL_LINE_B,
                          COL_FILL_A);
    cairo_move_to(cr, SX(gd->x_data[0]), sy0);
    for (i = 0; i < gd->n; i++)
        cairo_line_to(cr, SX(gd->x_data[i]), SY(gd->y_data[i]));
    cairo_line_to(cr, SX(gd->x_data[gd->n - 1]), sy0);
    cairo_close_path(cr);
    cairo_fill(cr);

    /* ── main line ── */
    cairo_set_source_rgb(cr, COL_LINE_R, COL_LINE_G, COL_LINE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_set_line_join(cr, CAIRO_LINE_JOIN_ROUND);
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);
    cairo_move_to(cr, SX(gd->x_data[0]), SY(gd->y_data[0]));
    for (i = 1; i < gd->n; i++)
        cairo_line_to(cr, SX(gd->x_data[i]), SY(gd->y_data[i]));
    cairo_stroke(cr);

    /* ── data point dots (only if n is small enough to be readable) ── */
    if (gd->n <= 64)
    {
        cairo_set_source_rgb(cr, COL_DOT_R, COL_DOT_G, COL_DOT_B);
        for (i = 0; i < gd->n; i++)
        {
            sx = SX(gd->x_data[i]);
            sy = SY(gd->y_data[i]);
            cairo_arc(cr, sx, sy, 3.0, 0, 2 * M_PI);
            cairo_fill(cr);
        }
    }

#undef SX
#undef SY

    cairo_restore(cr);
}

/*************************************************************
 * Function:    draw_stem_plot
 * Input:       cr  — Cairo context
 *              w, h — widget size
 *              gd  — graph data
 * Output:      void
 * Description: Renders a stem/bar plot with vertical stems
 *              from the baseline and a filled dot cap at each
 *              data point.  Used for FFT magnitude spectra.
 *************************************************************/
static void draw_stem_plot(cairo_t *cr, int w, int h,
                           const GraphData *gd)
{
    double px, py, pw, ph;
    double x_lo, x_hi, x_step;
    double y_lo, y_hi, y_step;
    double y_max;
    double sx, sy, sy0;
    int    i;

    px = GRAPH_PAD_LEFT;
    py = GRAPH_PAD_TOP;
    pw = w - GRAPH_PAD_LEFT - GRAPH_PAD_RIGHT;
    ph = h - GRAPH_PAD_TOP  - GRAPH_PAD_BOTTOM;
    if (pw < 1 || ph < 1) return;

    /* FFT magnitude is always >= 0 */
    y_max = 1.0;
    for (i = 0; i < gd->n; i++)
        if (gd->y_data[i] > y_max) y_max = gd->y_data[i];

    nice_range(0.0, y_max, &y_lo, &y_hi, &y_step);
    if (y_lo > 0.0) y_lo = 0.0;

    nice_range(gd->x_data[0], gd->x_data[gd->n - 1],
               &x_lo, &x_hi, &x_step);

    draw_axes(cr, px, py, pw, ph,
              x_lo, x_hi, y_lo, y_hi, x_step, y_step, gd);

    cairo_save(cr);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_clip(cr);

    sy0 = py + ph - (0.0 - y_lo) / (y_hi - y_lo) * ph;

#define SX(xi) (px + ((xi) - x_lo) / (x_hi - x_lo) * pw)
#define SY(yi) (py + ph - ((yi) - y_lo) / (y_hi - y_lo) * ph)

    /* stem width scales with number of points */
    double stem_w = fmax(1.0, pw / gd->n * 0.6);

    for (i = 0; i < gd->n; i++)
    {
        sx = SX(gd->x_data[i]);
        sy = SY(gd->y_data[i]);

        /* stem shadow */
        cairo_set_source_rgba(cr, 0.05, 0.05, 0.10, 0.5);
        cairo_set_line_width(cr, stem_w + 1.5);
        cairo_move_to(cr, sx + 1, sy0 + 1);
        cairo_line_to(cr, sx + 1, sy + 1);
        cairo_stroke(cr);

        /* stem */
        cairo_set_source_rgb(cr, COL_STEM_R, COL_STEM_G, COL_STEM_B);
        cairo_set_line_width(cr, stem_w);
        cairo_move_to(cr, sx, sy0);
        cairo_line_to(cr, sx, sy);
        cairo_stroke(cr);

        /* dot cap */
        cairo_set_source_rgb(cr, COL_DOT_R, COL_DOT_G, COL_DOT_B);
        cairo_arc(cr, sx, sy, fmax(2.5, stem_w), 0, 2 * M_PI);
        cairo_fill(cr);
    }

#undef SX
#undef SY

    cairo_restore(cr);
}

/*************************************************************
 * Function:    graph_data_free
 * Input:       gd (GraphData*) — data to free
 * Output:      void
 * Description: Frees all heap memory owned by a GraphData.
 *************************************************************/
static void graph_data_free(GraphData *gd)
{
    if (!gd) return;
    g_free(gd->title);
    g_free(gd->x_label);
    g_free(gd->y_label);
    g_free(gd->x_data);
    g_free(gd->y_data);
    g_free(gd);
}

/*************************************************************
 * Function:    on_window_destroy
 * Input:       w         (GtkWidget*) — the graph window
 *              user_data (gpointer)   — pointer to GraphData
 * Output:      void
 * Description: Frees the private GraphData when the window
 *              is closed by the user.
 *************************************************************/
static void on_window_destroy(GtkWidget *w, gpointer user_data)
{
    (void)w;
    graph_data_free((GraphData *)user_data);
}

/* ═══════════════════════════════════════════════════════════
   REPORT — inputs and results printed under a plot
   ═══════════════════════════════════════════════════════════ */

GraphReport *graph_report_new(void)
{
    GraphReport *r = g_new0(GraphReport, 1);

    r->in_label  = g_ptr_array_new_with_free_func(g_free);
    r->in_value  = g_ptr_array_new_with_free_func(g_free);
    r->out_label = g_ptr_array_new_with_free_func(g_free);
    r->out_value = g_ptr_array_new_with_free_func(g_free);
    return r;
}

void graph_report_free(gpointer data)
{
    GraphReport *r = (GraphReport *)data;

    if (!r) return;
    g_ptr_array_unref(r->in_label);
    g_ptr_array_unref(r->in_value);
    g_ptr_array_unref(r->out_label);
    g_ptr_array_unref(r->out_value);
    g_free(r);
}

void graph_report_add(GraphReport *r, int result,
                      const char *label, const char *value,
                      const char *units)
{
    if (!r || !label || !value) return;

    g_ptr_array_add(result ? r->out_label : r->in_label, g_strdup(label));
    g_ptr_array_add(result ? r->out_value : r->in_value,
                    (units && units[0])
                        ? g_strdup_printf("%s %s", value, units)
                        : g_strdup(value));
}

void graph_set_next_report(GraphReport *r)
{
    /* a plot that never opened (no data) leaves its report behind */
    graph_report_free(g_next_report);
    g_next_report = r;
}

/* ═══════════════════════════════════════════════════════════
   PRINTING
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    on_print_clicked
 * Input:       btn       (GtkButton*) — the Print button
 *              user_data (gpointer)   — the graph window
 * Output:      void
 * Description: Opens the system print dialog for one landscape
 *              page.  "Print to File" in that dialog gives a PDF.
 *************************************************************/
static void on_print_clicked(GtkButton *btn, gpointer user_data)
{
    GtkWindow              *window = GTK_WINDOW(user_data);
    GraphData              *gd;
    GtkPrintOperation      *op;
    GtkPageSetup           *setup;
    GtkPrintOperationResult result;
    GError                 *err = NULL;

    (void)btn;

    gd = g_object_get_data(G_OBJECT(window), "mx-graph-data");
    if (!gd) return;

    op = gtk_print_operation_new();
    gtk_print_operation_set_n_pages(op, 1);
    gtk_print_operation_set_job_name(op, gd->title);

    /* work in points so the plot's font sizes come out about the
       same on paper as on screen */
    gtk_print_operation_set_unit(op, GTK_UNIT_POINTS);

    /* plots are wider than tall — default to landscape */
    setup = gtk_page_setup_new();
    gtk_page_setup_set_orientation(setup, GTK_PAGE_ORIENTATION_LANDSCAPE);
    gtk_print_operation_set_default_page_setup(op, setup);
    g_object_unref(setup);

    g_signal_connect(op, "draw-page",
                     G_CALLBACK(on_print_draw_page), window);

    result = gtk_print_operation_run(op,
                                     GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                     window, &err);

    if (result == GTK_PRINT_OPERATION_RESULT_ERROR)
    {
        app_status_set("Printing failed: %s",
                       err ? err->message : "the printer gave no reason");
        g_clear_error(&err);
    }
    else if (result == GTK_PRINT_OPERATION_RESULT_APPLY)
        app_status_set("Sent to printer: %s", gd->title);

    g_object_unref(op);
}

/*************************************************************
 * Function:    on_print_draw_page
 * Input:       op        — the print operation (unused)
 *              ctx       — print context: Cairo context and page size
 *              page_nr   — always 0, there is one page
 *              user_data — the graph window
 * Output:      void
 * Description: Lays out the page: the plot fills the top, drawn
 *              by the very same on_draw() the window uses (but
 *              turned light-on-dark → dark-on-white), and
 *              the inputs and results go underneath it in two
 *              columns, outside the plot.
 *************************************************************/
static void on_print_draw_page(GtkPrintOperation *op,
                               GtkPrintContext   *ctx,
                               int                page_nr,
                               gpointer           user_data)
{
    GObject     *window = G_OBJECT(user_data);
    GraphData   *gd     = g_object_get_data(window, "mx-graph-data");
    GraphReport *r      = g_object_get_data(window, "mx-graph-report");
    cairo_t     *cr     = gtk_print_context_get_cairo_context(ctx);
    double       page_w = gtk_print_context_get_width(ctx);
    double       page_h = gtk_print_context_get_height(ctx);
    double       block_h = 0.0;
    double       plot_h;
    guint        rows;

    (void)op;
    (void)page_nr;

    if (!gd) return;

    /* ── how tall the block under the plot needs to be ── */
    if (r)
    {
        rows    = MAX(r->in_label->len, r->out_label->len);
        block_h = PRINT_GAP + PRINT_HEAD_H + rows * PRINT_LINE_H;
        block_h = MIN(block_h, page_h * PRINT_MAX_FRAC);
    }
    plot_h = page_h - block_h;

    /* ── the plot, on white paper instead of the screen's dark theme ── */
    paint_plot_for_paper(cr, gd, page_w, plot_h);

    if (!r) return;

    /* ── inputs on the left half, results on the right ── */
    draw_report_column(cr, 0.0, plot_h + PRINT_GAP, page_w / 2.0 - 12.0,
                       "Inputs", r->in_label, r->in_value);
    draw_report_column(cr, page_w / 2.0 + 12.0, plot_h + PRINT_GAP,
                       page_w / 2.0 - 12.0,
                       "Results", r->out_label, r->out_value);
}

/*************************************************************
 * Function:    paint_plot_for_paper
 * Input:       cr   — the printer's Cairo context
 *              gd   — the plot's data
 *              w, h — area to fill, in points, at the page's top-left
 * Output:      void
 * Description: Every plot draws itself in the screen's dark theme,
 *              and each of the module graphs hard-codes those
 *              colours.  Rather than teach a dozen draw functions a
 *              second palette, the plot is drawn once at ~288 dpi
 *              into an image, every pixel's lightness is flipped
 *              while its hue is kept (paperize_pixel), and the image
 *              goes on the page.  Dark background → white paper,
 *              light text → dark text, blue curve → darker blue.
 *              Toner budget: saved.  Every plot module: untouched.
 *************************************************************/
static void paint_plot_for_paper(cairo_t *cr, GraphData *gd,
                                 double w, double h)
{
    int              img_w = (int)ceil(w * PRINT_RASTER_SCALE);
    int              img_h = (int)ceil(h * PRINT_RASTER_SCALE);
    cairo_surface_t *img;
    cairo_t         *icr;
    guint32         *row;
    unsigned char   *data;
    int              stride;
    int              x;
    int              y;

    if (img_w <= 0 || img_h <= 0) return;

    /* ── draw the plot exactly as on screen, just with more pixels ── */
    img = cairo_image_surface_create(CAIRO_FORMAT_RGB24, img_w, img_h);
    icr = cairo_create(img);
    cairo_scale(icr, PRINT_RASTER_SCALE, PRINT_RASTER_SCALE);
    on_draw(NULL, icr, (int)w, (int)h, gd);
    cairo_destroy(icr);

    /* ── flip it to dark-on-white, one pixel at a time ── */
    cairo_surface_flush(img);
    data   = cairo_image_surface_get_data(img);
    stride = cairo_image_surface_get_stride(img);
    for (y = 0; y < img_h; y++)
    {
        row = (guint32 *)(data + (size_t)y * stride);
        for (x = 0; x < img_w; x++)
            paperize_pixel(&row[x]);
    }
    cairo_surface_mark_dirty(img);

    /* ── place it on the page, scaled back down to points ── */
    cairo_save(cr);
    cairo_rectangle(cr, 0, 0, w, h);
    cairo_clip(cr);
    cairo_scale(cr, 1.0 / PRINT_RASTER_SCALE, 1.0 / PRINT_RASTER_SCALE);
    cairo_set_source_surface(cr, img, 0, 0);
    cairo_paint(cr);
    cairo_restore(cr);

    cairo_surface_destroy(img);
}

/*************************************************************
 * Function:    paperize_pixel
 * Input:       px (guint32*) — one CAIRO_FORMAT_RGB24 pixel, changed in place
 * Output:      void
 * Description: HSL lightness flip: L becomes 1 - L, hue and
 *              saturation stay put, so colours keep their meaning
 *              (green banner stays green) but light becomes dark.
 *              Anything that comes out lighter than
 *              PRINT_WHITE_ABOVE — the dark backgrounds — is
 *              snapped to pure white so the printer skips it.
 *************************************************************/
static void paperize_pixel(guint32 *px)
{
    double r = ((*px >> 16) & 0xFF) / 255.0;
    double g = ((*px >>  8) & 0xFF) / 255.0;
    double b = ( *px        & 0xFF) / 255.0;
    double mx = fmax(r, fmax(g, b));
    double mn = fmin(r, fmin(g, b));
    double l  = (mx + mn) / 2.0;
    double nl;
    double k;

    /* new lightness; background-dark pixels go straight to paper */
    nl = 1.0 - l;
    if (nl >= PRINT_WHITE_ABOVE)
    {
        *px = 0x00FFFFFF;
        return;
    }

    /* same hue and saturation at the new lightness: every channel's
       distance from mid-grey scales by the same factor HSL uses —
       chroma is proportional to min(L, 1-L) */
    k = (fmin(l, 1.0 - l) > 1e-9) ? fmin(nl, 1.0 - nl) / fmin(l, 1.0 - l)
                                  : 0.0;
    r = nl + (r - l) * k;
    g = nl + (g - l) * k;
    b = nl + (b - l) * k;

    *px = ((guint32)(fmin(fmax(r, 0.0), 1.0) * 255.0 + 0.5) << 16) |
          ((guint32)(fmin(fmax(g, 0.0), 1.0) * 255.0 + 0.5) <<  8) |
           (guint32)(fmin(fmax(b, 0.0), 1.0) * 255.0 + 0.5);
}

/*************************************************************
 * Function:    draw_report_column
 * Input:       cr      — Cairo context
 *              x, y    — top-left of the column, in points
 *              col_w   — column width
 *              heading — "Inputs" or "Results"
 *              labels  — row labels
 *              values  — row values, parallel to labels
 * Output:      void
 * Description: A heading with a rule under it, then one row per
 *              entry: label on the left, value right-aligned.
 *              Black on paper — the plot keeps its screen colours,
 *              the table under it does not need to burn toner.
 *************************************************************/
static void draw_report_column(cairo_t *cr, double x, double y,
                               double col_w, const char *heading,
                               GPtrArray *labels, GPtrArray *values)
{
    guint  i;
    double row_y;

    if (labels->len == 0) return;

    /* ── heading and rule ── */
    cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, PRINT_FONT + 1.0);
    show_text_at(cr, x, y + PRINT_HEAD_H - 5.0, heading, 0.0);

    cairo_set_line_width(cr, 0.6);
    cairo_move_to(cr, x,         y + PRINT_HEAD_H - 1.0);
    cairo_line_to(cr, x + col_w, y + PRINT_HEAD_H - 1.0);
    cairo_stroke(cr);

    /* ── rows ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, PRINT_FONT);
    for (i = 0; i < labels->len; i++)
    {
        row_y = y + PRINT_HEAD_H + (i + 1) * PRINT_LINE_H - 2.0;
        show_text_at(cr, x,         row_y, g_ptr_array_index(labels, i), 0.0);
        show_text_at(cr, x + col_w, row_y, g_ptr_array_index(values, i), 1.0);
    }
}

/* ═══════════════════════════════════════════════════════════
   SHARED PANEL HELPERS — used by the module graphs
   (navier_graph.c, channel_graph.c, slittest_graph.c); see graph.h
   ═══════════════════════════════════════════════════════════ */

void graph_data_range(const double *a, int na, const double *b, int nb,
                      double pad_frac, double *lo, double *hi)
{
    int i;

    double pad;

    *lo =  1e300;
    *hi = -1e300;
    for (i = 0; i < na; i++) { *lo = fmin(*lo, a[i]); *hi = fmax(*hi, a[i]); }
    for (i = 0; i < nb; i++) { *lo = fmin(*lo, b[i]); *hi = fmax(*hi, b[i]); }

    /* breathing room each side, so a peak that lands exactly on a
       round number (v = -0.2500, say) is not shaved off by the frame */
    pad  = (*hi - *lo) * pad_frac;
    *lo -= pad;
    *hi += pad;
}

/*************************************************************
 * Function:    graph_tick_label
 * Input:       v    (double) — tick value
 *              step (double) — tick spacing
 *              buf  (char*)  — receives the label
 *              len  (size_t) — capacity of buf
 * Output:      void
 * Description: Snaps v to the tick grid before printing, so the
 *              zero tick reads "0" and not "-1.38778e-17".
 *              Floating point: always one ulp from embarrassment.
 *************************************************************/
static void graph_tick_label(double v, double step, char *buf, size_t len)
{
    v = round(v / step) * step;
    if (fabs(v) < step * 1e-6) v = 0.0;
    snprintf(buf, len, "%g", v);
}

void graph_xy_panel(cairo_t *cr,
                    double px, double py, double pw, double ph,
                    const char *title,
                    const char *x_label, const char *y_label,
                    const double *cx, const double *cy, int n,
                    const double *dx, const double *dy, int nd,
                    double ref_y,
                    GraphAxis ax, GraphAxis ay)
{
    const double dash[] = { 5.0, 4.0 };
    double       v;
    char         s[32];
    int          i;

    /* map data to pixels — y grows upward on paper, downward on screen */
#define PX(x) (px + ((x) - ax.lo) / (ax.hi - ax.lo) * pw)
#define PY(y) (py + ph - ((y) - ay.lo) / (ay.hi - ay.lo) * ph)

    /* ── panel background ── */
    cairo_set_source_rgb(cr, MX_GRAPH_PANEL_R, MX_GRAPH_PANEL_G, MX_GRAPH_PANEL_B);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_fill(cr);

    /* ── heading ── */
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 11.5);
    cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
    show_text_at(cr, px + pw / 2.0, py - 8.0, title, 0.5);

    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 10.0);
    cairo_set_line_width(cr, 1.0);

    /* ── vertical grid lines + x tick labels ── */
    for (v = ax.lo; v <= ax.hi + ax.step * 1e-6; v += ax.step)
    {
        cairo_set_source_rgba(cr, MX_GRAPH_GRID_R, MX_GRAPH_GRID_G,
                              MX_GRAPH_GRID_B, 0.7);
        cairo_move_to(cr, PX(v), py);
        cairo_line_to(cr, PX(v), py + ph);
        cairo_stroke(cr);

        graph_tick_label(v, ax.step, s, sizeof(s));
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, PX(v), py + ph + 15.0, s, 0.5);
    }

    /* ── horizontal grid lines + y tick labels ── */
    for (v = ay.lo; v <= ay.hi + ay.step * 1e-6; v += ay.step)
    {
        cairo_set_source_rgba(cr, MX_GRAPH_GRID_R, MX_GRAPH_GRID_G,
                              MX_GRAPH_GRID_B, 0.7);
        cairo_move_to(cr, px,      PY(v));
        cairo_line_to(cr, px + pw, PY(v));
        cairo_stroke(cr);

        graph_tick_label(v, ay.step, s, sizeof(s));
        cairo_set_source_rgb(cr, MX_GRAPH_TEXT_R, MX_GRAPH_TEXT_G, MX_GRAPH_TEXT_B);
        show_text_at(cr, px - 6.0, PY(v) + 4.0, s, 1.0);
    }

    /* ── axis labels ── */
    show_text_at(cr, px + pw / 2.0, py + ph + 34.0, x_label, 0.5);

    cairo_save(cr);
    cairo_translate(cr, px - 44.0, py + ph / 2.0);
    cairo_rotate(cr, -M_PI / 2.0);
    show_text_at(cr, 0, 0, y_label, 0.5);
    cairo_restore(cr);

    /* everything from here on stays inside the panel */
    cairo_save(cr);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_clip(cr);

    /* ── dashed zero lines: where the flow reverses direction ── */
    cairo_save(cr);
    cairo_set_source_rgb(cr, MX_GRAPH_ZERO_R, MX_GRAPH_ZERO_G, MX_GRAPH_ZERO_B);
    cairo_set_line_width(cr, 1.2);
    cairo_set_dash(cr, dash, 2, 0);
    if (ax.lo < 0.0 && ax.hi > 0.0)
    {
        cairo_move_to(cr, PX(0.0), py);
        cairo_line_to(cr, PX(0.0), py + ph);
        cairo_stroke(cr);
    }
    if (ay.lo < 0.0 && ay.hi > 0.0)
    {
        cairo_move_to(cr, px,      PY(0.0));
        cairo_line_to(cr, px + pw, PY(0.0));
        cairo_stroke(cr);
    }
    cairo_restore(cr);

    /* ── reference value: a dashed line in the benchmark-dot colour ── */
    if (!isnan(ref_y))
    {
        const double ref_dash[] = { 8.0, 5.0 };

        cairo_save(cr);
        cairo_set_source_rgb(cr, MX_GRAPH_DOT_R, MX_GRAPH_DOT_G, MX_GRAPH_DOT_B);
        cairo_set_line_width(cr, 1.6);
        cairo_set_dash(cr, ref_dash, 2, 0);
        cairo_move_to(cr, px,      PY(ref_y));
        cairo_line_to(cr, px + pw, PY(ref_y));
        cairo_stroke(cr);
        cairo_restore(cr);
    }

    /* ── this solution: a line ── */
    cairo_move_to(cr, PX(cx[0]), PY(cy[0]));
    for (i = 1; i < n; i++)
        cairo_line_to(cr, PX(cx[i]), PY(cy[i]));
    cairo_set_source_rgb(cr, MX_GRAPH_LINE_R, MX_GRAPH_LINE_G, MX_GRAPH_LINE_B);
    cairo_set_line_width(cr, 2.0);
    cairo_stroke(cr);

    /* ── benchmark points: dots with a dark rim so they read over the line ── */
    for (i = 0; i < nd; i++)
    {
        cairo_new_path(cr);
        cairo_arc(cr, PX(dx[i]), PY(dy[i]), GRAPH_DOT_RADIUS, 0, 2 * M_PI);
        cairo_set_source_rgb(cr, MX_GRAPH_DOT_R, MX_GRAPH_DOT_G, MX_GRAPH_DOT_B);
        cairo_fill_preserve(cr);
        cairo_set_source_rgb(cr, MX_CRUST_R, MX_CRUST_G, MX_CRUST_B);
        cairo_set_line_width(cr, 1.0);
        cairo_stroke(cr);
    }

    cairo_restore(cr);   /* end clip */

    /* ── frame ── */
    cairo_set_source_rgb(cr, MX_GRAPH_AXIS_R, MX_GRAPH_AXIS_G, MX_GRAPH_AXIS_B);
    cairo_set_line_width(cr, 1.0);
    cairo_rectangle(cr, px, py, pw, ph);
    cairo_stroke(cr);

#undef PX
#undef PY
}

/* ═══════════════════════════════════════════════════════════
   SHARED FETCH HELPERS — results from parse, any size
   ═══════════════════════════════════════════════════════════ */

double graph_fetch_scalar(const char *var)
{
    char cmd[64];
    char buf[256];

    snprintf(cmd, sizeof(cmd), "$%s\n", var);
    if (!pipe_transact(cmd, buf, sizeof(buf))) return 0.0;
    return atof(buf);
}

double *graph_fetch_vector(const char *var, int *out_n)
{
    AppState *st   = app_state_get();
    double   *all  = NULL;
    double   *page;
    int       have = 0;
    int       got;
    char      cmd[96];

    *out_n = 0;

    /* ask for one page at a time until parse sends a short one —
       the last page, or the only one for a small vector */
    for (;;)
    {
        snprintf(cmd, sizeof(cmd), "dump $%s start=%d count=%d\n",
                 var, have, GRAPH_PAGE_VALUES);
        if (!pipe_transact(cmd, st->response_buf, RESPONSE_BUFSIZE)) break;

        /* parse this page before the next request overwrites the buffer */
        page = parse_vector_response(st->response_buf, &got);
        if (!page || got <= 0) { g_free(page); break; }

        all = g_renew(double, all, have + got);
        memcpy(all + have, page, got * sizeof(double));
        have += got;
        g_free(page);

        if (got < GRAPH_PAGE_VALUES) break;
    }

    if (have == 0) { g_free(all); return NULL; }
    *out_n = have;
    return all;
}
