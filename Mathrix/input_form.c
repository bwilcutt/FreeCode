#include "input_form.h"
#include "app_state.h"
#include "module_desc.h"
#include "graph.h"
#include "mohr_graph.h"
#include "beam_graph.h"
#include "pipe_mgr.h"

#include <gtk/gtk.h>
#include <string.h>
#include <stdio.h>

/* ═══════════════════════════════════════════════════════════
   FORM STATE
   One active form at a time.  Rebuilt on every module switch.
   ═══════════════════════════════════════════════════════════ */

#define FORM_MAX_PARAMS  MD_MAX_PARAMS

typedef struct
{
    const ModuleDesc *desc;                      /* current module         */
    GtkWidget        *widgets[FORM_MAX_PARAMS];  /* one widget per param   */
    GtkWidget        *plot_btn;                  /* NULL if no plot        */
} FormState;

static FormState g_form;

/* ═══════════════════════════════════════════════════════════
   FORWARD DECLARATIONS
   ═══════════════════════════════════════════════════════════ */

static GtkWidget *build_param_row (GtkWidget *grid, int row,
                                   const ParamDesc *p);
static const char *read_widget    (GtkWidget *w, const ParamDesc *p,
                                   char *buf, size_t buflen);
static void on_run_clicked        (GtkButton *btn, gpointer user_data);
static void on_plot_clicked       (GtkButton *btn, gpointer user_data);
static void on_entry_activate     (GtkEntry  *entry, gpointer user_data);
static void on_browse_clicked     (GtkButton *btn, gpointer user_data);

/* ═══════════════════════════════════════════════════════════
   PUBLIC — input_form_load
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    input_form_load
 * Input:       desc     (const ModuleDesc*) — module to display
 *              form_box (GtkWidget*)        — container to rebuild
 * Output:      void
 * Description: Clears form_box, then adds:
 *                1. Module title and description labels
 *                2. A GtkGrid with one row per parameter
 *                3. Run button (always)
 *                4. Plot button (if desc->has_plot)
 *              Stores all input widgets in g_form.widgets[].
 *************************************************************/
void input_form_load(const ModuleDesc *desc, GtkWidget *form_box)
{
    GtkWidget  *child;
    GtkWidget  *title_lbl;
    GtkWidget  *desc_lbl;
    GtkWidget  *grid;
    GtkWidget  *sep;
    GtkWidget  *btn_box;
    GtkWidget  *run_btn;
    GtkWidget  *plot_btn;
    GtkWidget  *out_title;
    GtkWidget  *out_lbl;
    int         i;
    char        out_text[512];
    int         pos;
    int         n;

    if (!desc || !form_box) return;

    /* ── clear existing children ── */
    while ((child = gtk_widget_get_first_child(form_box)) != NULL)
        gtk_box_remove(GTK_BOX(form_box), child);

    memset(&g_form, 0, sizeof(g_form));
    g_form.desc = desc;

    /* ── title ── */
    title_lbl = gtk_label_new(desc->label);
    gtk_widget_add_css_class(title_lbl, "mathrix-form-title");
    gtk_label_set_xalign(GTK_LABEL(title_lbl), 0.0f);
    gtk_box_append(GTK_BOX(form_box), title_lbl);

    /* ── description ── */
    desc_lbl = gtk_label_new(desc->description);
    gtk_widget_add_css_class(desc_lbl, "mathrix-form-desc");
    gtk_label_set_xalign(GTK_LABEL(desc_lbl), 0.0f);
    gtk_label_set_wrap(GTK_LABEL(desc_lbl), TRUE);
    gtk_label_set_wrap_mode(GTK_LABEL(desc_lbl), PANGO_WRAP_WORD_CHAR);
    gtk_box_append(GTK_BOX(form_box), desc_lbl);

    sep = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
    gtk_widget_set_margin_top(sep, 4);
    gtk_widget_set_margin_bottom(sep, 8);
    gtk_box_append(GTK_BOX(form_box), sep);

    /* ── parameter grid ── */
    grid = gtk_grid_new();
    gtk_grid_set_row_spacing(GTK_GRID(grid), 6);
    gtk_grid_set_column_spacing(GTK_GRID(grid), 8);
    gtk_widget_set_margin_bottom(grid, 12);

    for (i = 0; i < desc->n_params; i++)
        g_form.widgets[i] = build_param_row(grid, i, &desc->params[i]);

    gtk_box_append(GTK_BOX(form_box), grid);

    sep = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
    gtk_widget_set_margin_top(sep, 4);
    gtk_widget_set_margin_bottom(sep, 8);
    gtk_box_append(GTK_BOX(form_box), sep);

    /* ── buttons ── */
    btn_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    gtk_widget_set_margin_bottom(btn_box, 12);

    run_btn = gtk_button_new_with_label("▶  Run");
    gtk_widget_add_css_class(run_btn, "mathrix-run-btn");
    gtk_widget_set_hexpand(run_btn, TRUE);
    g_signal_connect(run_btn, "clicked", G_CALLBACK(on_run_clicked), NULL);
    gtk_box_append(GTK_BOX(btn_box), run_btn);

    if (desc->has_plot)
    {
        plot_btn = gtk_button_new_with_label("📈  Plot ↗");
        gtk_widget_add_css_class(plot_btn, "mathrix-plot-btn");
        gtk_widget_set_hexpand(plot_btn, TRUE);
        g_signal_connect(plot_btn, "clicked",
                         G_CALLBACK(on_plot_clicked), NULL);
        gtk_box_append(GTK_BOX(btn_box), plot_btn);
        g_form.plot_btn = plot_btn;
    }

    gtk_box_append(GTK_BOX(form_box), btn_box);

    /* ── output variable summary ── */
    if (desc->n_outputs > 0)
    {
        sep = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
        gtk_widget_set_margin_top(sep, 4);
        gtk_widget_set_margin_bottom(sep, 6);
        gtk_box_append(GTK_BOX(form_box), sep);

        out_title = gtk_label_new("Output variables");
        gtk_widget_add_css_class(out_title, "mathrix-form-title");
        gtk_label_set_xalign(GTK_LABEL(out_title), 0.0f);
        gtk_widget_set_margin_bottom(out_title, 4);
        gtk_box_append(GTK_BOX(form_box), out_title);

        pos = 0;
        for (i = 0; i < desc->n_outputs; i++)
        {
            n = snprintf(out_text + pos, sizeof(out_text) - pos,
                         "$%-20s  %s",
                         desc->outputs[i].var_name,
                         desc->outputs[i].label);
            if (n > 0) pos += n;
            if (desc->outputs[i].units[0])
            {
                n = snprintf(out_text + pos, sizeof(out_text) - pos,
                             "  [%s]", desc->outputs[i].units);
                if (n > 0) pos += n;
            }
            if (pos < (int)sizeof(out_text) - 1)
                out_text[pos++] = '\n';
        }
        out_text[pos] = '\0';

        out_lbl = gtk_label_new(out_text);
        gtk_widget_add_css_class(out_lbl, "mathrix-form-desc");
        gtk_label_set_xalign(GTK_LABEL(out_lbl), 0.0f);
        gtk_label_set_selectable(GTK_LABEL(out_lbl), TRUE);
        gtk_box_append(GTK_BOX(form_box), out_lbl);
    }
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — input_form_run
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    input_form_run
 * Input:       void
 * Output:      void
 * Description: Reads all field values, builds the parse command,
 *              sends it, and appends the response to the output
 *              panel.  Validates that all required fields are
 *              filled before sending.
 *************************************************************/
void input_form_run(void)
{
    AppState    *st = app_state_get();
    const ModuleDesc *desc = g_form.desc;
    const char  *values[FORM_MAX_PARAMS];
    char         val_bufs[FORM_MAX_PARAMS][128];
    char         cmd[1024];
    int          i;
    int          ok = 1;

    if (!desc) return;

    /* ── read all field values ── */
    for (i = 0; i < desc->n_params; i++)
    {
        values[i] = read_widget(g_form.widgets[i],
                                &desc->params[i],
                                val_bufs[i], sizeof(val_bufs[i]));

        /* validate required fields */
        if (desc->params[i].required &&
            (!values[i] || values[i][0] == '\0'))
        {
            app_status_set("Required field missing: %s",
                           desc->params[i].label);
            ok = 0;
        }
    }
    if (!ok) return;

    /* ── build and send command ── */
    if (!md_build_command(desc, values, cmd, sizeof(cmd)))
    {
        app_status_set("Command too long — check field values");
        return;
    }

    app_output_append("< ");
    app_output_append(cmd);

    if (pipe_transact(cmd, st->response_buf, RESPONSE_BUFSIZE))
        app_output_append(st->response_buf);
    else
        app_output_append("(no response)\n");

    app_status_set("Ran: %s", desc->label);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — input_form_plot
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    input_form_plot
 * Input:       void
 * Output:      void
 * Description: Runs the command first to populate output
 *              variables, then opens an autonomous graph window.
 *************************************************************/
void input_form_plot(void)
{
    const ModuleDesc *desc = g_form.desc;

    if (!desc || !desc->has_plot) return;

    input_form_run();

    if (desc->plot_type == PLOT_MOHR)
        graph_window_open_mohr();
    else if (desc->plot_type == PLOT_BEAM)
        graph_window_open_beam();
    else
        graph_window_open(desc);
}

/* ═══════════════════════════════════════════════════════════
   INTERNAL — build_param_row
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    build_param_row
 * Input:       grid (GtkWidget*)    — the parameter grid
 *              row  (int)           — grid row index
 *              p    (const ParamDesc*) — parameter descriptor
 * Output:      GtkWidget* — the input widget created for this row
 * Description: Adds a label in column 0 and an input widget in
 *              column 1 for one parameter.  Also adds a unit
 *              label in column 2 if units is non-empty.
 *              Returns the input widget so it can be stored in
 *              g_form.widgets[].
 *************************************************************/
static GtkWidget *build_param_row(GtkWidget *grid, int row,
                                   const ParamDesc *p)
{
    GtkWidget  *lbl;
    GtkWidget  *widget = NULL;
    GtkWidget  *unit_lbl;
    char        label_text[64];
    int         i;

    /* ── label ── */
    if (p->required)
        snprintf(label_text, sizeof(label_text), "%s *", p->label);
    else
        snprintf(label_text, sizeof(label_text), "%s", p->label);

    lbl = gtk_label_new(label_text);
    gtk_label_set_xalign(GTK_LABEL(lbl), 1.0f);
    gtk_widget_set_halign(lbl, GTK_ALIGN_END);
    gtk_widget_set_valign(lbl, GTK_ALIGN_CENTER);
    if (p->tooltip)
        gtk_widget_set_tooltip_text(lbl, p->tooltip);
    gtk_grid_attach(GTK_GRID(grid), lbl, 0, row, 1, 1);

    /* ── input widget by type ── */
    switch (p->type)
    {
        case PT_SCALAR:
        case PT_STRING:
        {
            GtkWidget *entry = gtk_entry_new();
            if (p->default_val)
                gtk_editable_set_text(GTK_EDITABLE(entry), p->default_val);
            gtk_entry_set_input_purpose(GTK_ENTRY(entry),
                p->type == PT_SCALAR ? GTK_INPUT_PURPOSE_NUMBER
                                     : GTK_INPUT_PURPOSE_FREE_FORM);
            gtk_widget_set_hexpand(entry, TRUE);
            gtk_widget_set_size_request(entry, 140, -1);
            if (p->tooltip)
                gtk_widget_set_tooltip_text(entry, p->tooltip);
            g_signal_connect(entry, "activate",
                             G_CALLBACK(on_entry_activate), NULL);

            /* ── file param: add browse button beside entry ── */
            if (strcmp(p->key, "file") == 0)
            {
                GtkWidget *hbox  = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
                GtkWidget *browse = gtk_button_new_with_label("📂");
                gtk_widget_set_hexpand(entry, TRUE);
                gtk_widget_add_css_class(browse, "mathrix-run-btn");
                gtk_widget_set_tooltip_text(browse, "Browse for CSV file");
                g_signal_connect(browse, "clicked",
                                 G_CALLBACK(on_browse_clicked), entry);
                gtk_box_append(GTK_BOX(hbox), entry);
                gtk_box_append(GTK_BOX(hbox), browse);
                gtk_widget_set_hexpand(hbox, TRUE);
                gtk_grid_attach(GTK_GRID(grid), hbox, 1, row, 1, 1);
                widget = entry;  /* store entry as the readable widget */
                break;
            }

            widget = entry;
            break;
        }

        case PT_CHOICE:
        {
            GtkStringList *list;
            GtkWidget     *drop;
            int            n = 0;
            int            def_idx = 0;

            /* count choices */
            while (p->choices[n]) n++;
            list = gtk_string_list_new(NULL);
            for (i = 0; i < n; i++)
            {
                gtk_string_list_append(list, p->choices[i]);
                if (p->default_val &&
                    strcmp(p->choices[i], p->default_val) == 0)
                    def_idx = i;
            }
            drop = gtk_drop_down_new(G_LIST_MODEL(list), NULL);
            gtk_drop_down_set_selected(GTK_DROP_DOWN(drop),
                                        (guint)def_idx);
            gtk_widget_set_hexpand(drop, TRUE);
            if (p->tooltip)
                gtk_widget_set_tooltip_text(drop, p->tooltip);
            widget = drop;
            break;
        }

        case PT_FLAG:
        {
            GtkWidget *chk = gtk_check_button_new();
            if (p->default_val &&
                strcmp(p->default_val, "1") == 0)
                gtk_check_button_set_active(GTK_CHECK_BUTTON(chk), TRUE);
            if (p->tooltip)
                gtk_widget_set_tooltip_text(chk, p->tooltip);
            widget = chk;
            break;
        }
    }

    if (widget)
        gtk_grid_attach(GTK_GRID(grid), widget, 1, row, 1, 1);

    /* ── unit label ── */
    if (p->units && p->units[0])
    {
        unit_lbl = gtk_label_new(p->units);
        gtk_widget_add_css_class(unit_lbl, "mathrix-form-desc");
        gtk_label_set_xalign(GTK_LABEL(unit_lbl), 0.0f);
        gtk_widget_set_halign(unit_lbl, GTK_ALIGN_START);
        gtk_widget_set_valign(unit_lbl, GTK_ALIGN_CENTER);
        gtk_grid_attach(GTK_GRID(grid), unit_lbl, 2, row, 1, 1);
    }

    return widget;
}

/* ═══════════════════════════════════════════════════════════
   INTERNAL — read_widget
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    read_widget
 * Input:       w      (GtkWidget*)      — the input widget
 *              p      (const ParamDesc*) — its descriptor
 *              buf    (char*)           — scratch buffer
 *              buflen (size_t)          — buffer capacity
 * Output:      const char* — the current value as a string,
 *              or NULL / "" if the field is empty
 * Description: Reads the current value from any of the four
 *              widget types and returns it as a C string.
 *              For PT_CHOICE the selected item text is returned.
 *              For PT_FLAG returns "1" or "" (empty = not set).
 *************************************************************/
static const char *read_widget(GtkWidget *w, const ParamDesc *p,
                                char *buf, size_t buflen)
{
    if (!w) return NULL;

    switch (p->type)
    {
        case PT_SCALAR:
        case PT_STRING:
        {
            const char *txt =
                gtk_editable_get_text(GTK_EDITABLE(w));
            strncpy(buf, txt ? txt : "", buflen - 1);
            buf[buflen - 1] = '\0';
            return buf;
        }

        case PT_CHOICE:
        {
            guint       sel  = gtk_drop_down_get_selected(
                                   GTK_DROP_DOWN(w));
            GListModel *model= gtk_drop_down_get_model(
                                   GTK_DROP_DOWN(w));
            GObject    *item = g_list_model_get_item(model, sel);
            if (item)
            {
                strncpy(buf,
                    gtk_string_object_get_string(
                        GTK_STRING_OBJECT(item)),
                    buflen - 1);
                buf[buflen - 1] = '\0';
                g_object_unref(item);
                return buf;
            }
            return NULL;
        }

        case PT_FLAG:
        {
            if (gtk_check_button_get_active(GTK_CHECK_BUTTON(w)))
            {
                strncpy(buf, "us", buflen - 1);
                buf[buflen - 1] = '\0';
                return buf;
            }
            return "";
        }
    }
    return NULL;
}

/* ═══════════════════════════════════════════════════════════
   SIGNAL HANDLERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    on_run_clicked
 * Input:       btn       (GtkButton*) — the Run button
 *              user_data (gpointer)   — unused
 * Output:      void
 * Description: Delegates to input_form_run().
 *************************************************************/
static void on_run_clicked(GtkButton *btn, gpointer user_data)
{
    (void)btn;
    (void)user_data;
    input_form_run();
}

/*************************************************************
 * Function:    on_plot_clicked
 * Input:       btn       (GtkButton*) — the Plot button
 *              user_data (gpointer)   — unused
 * Output:      void
 * Description: Delegates to input_form_plot().
 *************************************************************/
static void on_plot_clicked(GtkButton *btn, gpointer user_data)
{
    (void)btn;
    (void)user_data;
    input_form_plot();
}

/*************************************************************
 * Function:    on_file_chosen
 * Input:       dialog    (GtkFileDialog*) — the file dialog
 *              result    (GAsyncResult*)  — async result
 *              user_data (gpointer)       — the filename GtkEntry
 * Output:      void
 * Description: Async callback — receives the chosen file and
 *              sets the filename entry text to the chosen path.
 *************************************************************/
static void on_file_chosen(GObject *dialog, GAsyncResult *result,
                            gpointer user_data)
{
    GtkEntry *entry = GTK_ENTRY(user_data);
    GFile    *file;
    char     *path;

    file = gtk_file_dialog_open_finish(GTK_FILE_DIALOG(dialog),
                                        result, NULL);
    if (file)
    {
        path = g_file_get_path(file);
        if (path)
        {
            gtk_editable_set_text(GTK_EDITABLE(entry), path);
            g_free(path);
        }
        g_object_unref(file);
    }
    g_object_unref(dialog);
}

/*************************************************************
 * Function:    on_browse_clicked
 * Input:       btn       (GtkButton*) — the browse button
 *              user_data (gpointer)   — the filename GtkEntry
 * Output:      void
 * Description: Opens a GtkFileDialog filtered to CSV files.
 *              On selection, on_file_chosen() sets the entry text.
 *************************************************************/
static void on_browse_clicked(GtkButton *btn, gpointer user_data)
{
    AppState        *st     = app_state_get();
    GtkFileDialog   *dialog = gtk_file_dialog_new();
    GtkFileFilter   *filter = gtk_file_filter_new();
    GListStore      *filters;

    (void)btn;

    gtk_file_dialog_set_title(dialog, "Select CSV File");
    gtk_file_dialog_set_modal(dialog, TRUE);

    gtk_file_filter_set_name(filter, "CSV files (*.csv)");
    gtk_file_filter_add_pattern(filter, "*.csv");
    gtk_file_filter_add_pattern(filter, "*.CSV");

    filters = g_list_store_new(GTK_TYPE_FILE_FILTER);
    g_list_store_append(filters, filter);
    gtk_file_dialog_set_filters(dialog,
                                 G_LIST_MODEL(filters));
    g_object_unref(filters);
    g_object_unref(filter);

    gtk_file_dialog_open(dialog,
                          GTK_WINDOW(st->window),
                          NULL,
                          on_file_chosen,
                          user_data);
}

/*************************************************************
 * Function:    on_entry_activate
 * Input:       entry     (GtkEntry*) — the entry that fired
 *              user_data (gpointer)  — unused
 * Output:      void
 * Description: Pressing Enter in any parameter field triggers
 *              Run, matching the parse CLI behaviour.
 *************************************************************/
static void on_entry_activate(GtkEntry *entry, gpointer user_data)
{
    (void)entry;
    (void)user_data;
    input_form_run();
}
