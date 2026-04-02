#include "graph.h"
#include "app_state.h"
#include "pipe_mgr.h"
#include "colors.h"

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
   Private per-window state; heap-allocated, freed on destroy.
   ═══════════════════════════════════════════════════════════ */

typedef struct
{
    char    *title;
    char    *x_label;
    char    *y_label;
    double  *x_data;
    double  *y_data;
    int      n;
    PlotType plot_type;
} GraphData;

/* ═══════════════════════════════════════════════════════════
   FORWARD DECLARATIONS
   ═══════════════════════════════════════════════════════════ */

static void      graph_data_free      (GraphData *gd);
static GraphData *fetch_module_data   (const ModuleDesc *desc);
static double   *parse_vector_response(const char *response, int *out_n);
static void      nice_range           (double lo, double hi,
                                       double *out_lo, double *out_hi,
                                       double *out_step);
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
                                 GRAPH_MIN_W + 100, GRAPH_MIN_H + 60);
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
    char        cmd[128];
    int         i;
    int         n = 0;
    double     *y_data;
    GraphData  *gd;

    /* find the Y variable */
    for (i = 0; i < desc->n_outputs; i++)
        if (strcmp(desc->outputs[i].plot_role, "y") == 0)
        {
            y_var = desc->outputs[i].var_name;
            break;
        }
    if (!y_var) return NULL;

    /* use dump command for clean machine-readable output */
    snprintf(cmd, sizeof(cmd), "dump $%s\n", y_var);
    if (!pipe_transact(cmd, st->response_buf, RESPONSE_BUFSIZE))
        return NULL;

    y_data = parse_vector_response(st->response_buf, &n);
    if (!y_data || n == 0) { g_free(y_data); return NULL; }

    gd           = g_new0(GraphData, 1);
    gd->n        = n;
    gd->y_data   = y_data;
    gd->x_data   = g_new(double, n);
    for (i = 0; i < n; i++) gd->x_data[i] = (double)i;

    return gd;
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
static double *parse_vector_response(const char *response, int *out_n)
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
static void nice_range(double lo, double hi,
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

/* ═══════════════════════════════════════════════════════════
   CLEANUP
   ═══════════════════════════════════════════════════════════ */

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
