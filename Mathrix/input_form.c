#include "input_form.h"
#include "app_state.h"
#include "module_desc.h"
#include "graph.h"
#include "mohr_graph.h"
#include "beam_graph.h"
#include "stress_graph.h"
#include "reynolds_graph.h"
#include "darcy_graph.h"
#include "bernoulli_graph.h"
#include "orifice_graph.h"
#include "specheat_graph.h"
#include "idealgas_graph.h"
#include "heatcond_graph.h"
#include "manning_graph.h"
#include "asteroid_graph.h"
#include "navier_graph.h"
#include "channel_graph.h"
#include "slittest_graph.h"
#include "schrodinger_graph.h"
#include "asteroid_lookup.h"
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
    GtkWidget        *run_btn;                   /* greyed out while busy  */
    GtkWidget        *spinner;                   /* spins while parse works */
    GtkWidget        *busy_row;                  /* spinner + "please wait" */
} FormState;

static FormState g_form;

/*************************************************************
 * Struct:      FormJob
 * Description: One command handed to parse on a worker thread,
 *              so the window keeps drawing (and the spinner keeps
 *              spinning) while a long calculation runs.
 *
 *   desc      — module the command belongs to
 *   cmd       — the command line sent to parse
 *   response  — parse's reply, g_malloc'd by the worker
 *   ok        — 1 if parse answered at all
 *   is_plot   — 1 = open the plot window when the answer arrives
 *************************************************************/
typedef struct
{
    const ModuleDesc *desc;
    char              cmd[1024];
    char             *response;
    int               ok;
    int               is_plot;
} FormJob;

/* one parse conversation at a time — the pipe is not a party line */
static gboolean g_busy = FALSE;

/* ═══════════════════════════════════════════════════════════
   FORWARD DECLARATIONS
   ═══════════════════════════════════════════════════════════ */

static GtkWidget  *build_param_row (GtkWidget *grid, int row,
                                    const ParamDesc *p);
static const char *read_widget     (GtkWidget *w, const ParamDesc *p,
                                    char *buf, size_t buflen);
static void on_run_clicked         (GtkButton *btn, gpointer user_data);
static void on_plot_clicked        (GtkButton *btn, gpointer user_data);
static void on_entry_activate      (GtkEntry  *entry, gpointer user_data);
static void on_browse_clicked      (GtkButton *btn, gpointer user_data);
static GraphReport *build_report   (const ModuleDesc *desc);
static int  build_form_command     (const ModuleDesc *desc,
                                    char *cmd, size_t cmdlen);
static void start_job              (const ModuleDesc *desc,
                                    const char *cmd, int is_plot);
static void job_thread             (GTask *task, gpointer source,
                                    gpointer task_data,
                                    GCancellable *cancel);
static void on_job_done            (GObject *source, GAsyncResult *res,
                                    gpointer user_data);
static void set_busy               (gboolean busy, const char *label);
static void open_plot              (const ModuleDesc *desc);

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
    GtkWidget  *busy_lbl;
    GtkWidget  *out_title;
    GtkWidget  *out_lbl;
    int         i;
    char        out_text[1024];
    int         pos;
    int         n;

    if (!desc || !form_box) return;

    /* the running job belongs to this form — swapping it out from
       under the answer would hand the results to the wrong module */
    if (g_busy)
    {
        app_status_set("Still calculating — wait for it to finish, then switch");
        return;
    }

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

    /* ── asteroid only: pick a known asteroid and its orbit is
          downloaded into the fields below ── */
    if (strcmp(desc->command, "asteroid") == 0)
        gtk_box_append(GTK_BOX(form_box), asteroid_lookup_row(desc, g_form.widgets));

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
    g_form.run_btn = run_btn;

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

    /* ── busy row under the buttons: spinner + "please wait", hidden
          until parse is working.  The form-title class lends both the
          bright blue text colour, which the spinner draws itself in —
          the default grey vanishes on this background ── */
    g_form.busy_row = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_halign(g_form.busy_row, GTK_ALIGN_CENTER);
    gtk_widget_set_margin_bottom(g_form.busy_row, 10);

    g_form.spinner = gtk_spinner_new();
    gtk_widget_set_size_request(g_form.spinner, 28, 28);
    gtk_widget_add_css_class(g_form.spinner, "mathrix-form-title");
    gtk_box_append(GTK_BOX(g_form.busy_row), g_form.spinner);

    busy_lbl = gtk_label_new("Calculating — please wait …");
    gtk_widget_add_css_class(busy_lbl, "mathrix-form-title");
    gtk_box_append(GTK_BOX(g_form.busy_row), busy_lbl);

    gtk_widget_set_visible(g_form.busy_row, FALSE);
    gtk_box_append(GTK_BOX(form_box), g_form.busy_row);

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
 * Description: Reads all field values, builds the parse command
 *              and hands it to parse on a worker thread.  The
 *              spinner turns while it runs; on_job_done() appends
 *              the response to the output panel.  Validates that
 *              all required fields are filled before sending.
 *************************************************************/
void input_form_run(void)
{
    const ModuleDesc *desc = g_form.desc;
    char              cmd[1024];

    if (!desc) return;

    /* a second click while parse is still chewing does nothing */
    if (g_busy) return;

    if (!build_form_command(desc, cmd, sizeof(cmd))) return;
    start_job(desc, cmd, 0);
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — input_form_plot
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    input_form_plot
 * Input:       void
 * Output:      void
 * Description: Runs the command first to populate output
 *              variables (on a worker thread, spinner turning),
 *              then opens an autonomous graph window when parse
 *              answers — see on_job_done() and open_plot().
 *************************************************************/
void input_form_plot(void)
{
    const ModuleDesc *desc = g_form.desc;
    char              cmd[1024];

    if (!desc || !desc->has_plot) return;
    if (g_busy) return;

    /* run first; the window opens in on_job_done() once the
       results are actually in parse */
    if (!build_form_command(desc, cmd, sizeof(cmd))) return;
    start_job(desc, cmd, 1);
}

/*************************************************************
 * Function:    open_plot
 * Input:       desc (const ModuleDesc*) — the module just run
 * Output:      void
 * Description: Collects the inputs/results report for printing,
 *              then opens the module's own plot window.  Called
 *              on the main thread after a Plot job finishes.
 *************************************************************/
static void open_plot(const ModuleDesc *desc)
{
    /* the inputs just used and the results they gave, for printing
       under the plot — whichever window opens next picks it up */
    graph_set_next_report(build_report(desc));

    /* Diagram the specific plot type */

    if      (desc->plot_type == PLOT_MOHR)      graph_window_open_mohr();
    else if (desc->plot_type == PLOT_BEAM)      graph_window_open_beam();
    else if (desc->plot_type == PLOT_STRESS)    graph_window_open_stress();
    else if (desc->plot_type == PLOT_REYNOLDS)  graph_window_open_reynolds();
    else if (desc->plot_type == PLOT_DARCY)     graph_window_open_darcy();
    else if (desc->plot_type == PLOT_BERNOULLI) graph_window_open_bernoulli();
    else if (desc->plot_type == PLOT_ORIFICE)   graph_window_open_orifice();
    else if (desc->plot_type == PLOT_IDEALGAS)  graph_window_open_idealgas();
    else if (desc->plot_type == PLOT_HEATCOND)  graph_window_open_heatcond();
    else if (desc->plot_type == PLOT_SPECHEAT)  graph_window_open_specheat();
    else if (desc->plot_type == PLOT_MANNING)   graph_window_open_manning();
    else if (desc->plot_type == PLOT_ASTEROID)  graph_window_open_asteroid();
    else if (desc->plot_type == PLOT_NAVIER)    graph_window_open_navier();
    else if (desc->plot_type == PLOT_CHANNEL)   graph_window_open_channel();
    else if (desc->plot_type == PLOT_SLITTEST)  graph_window_open_slittest();
    else if (desc->plot_type == PLOT_SCHRODINGER) graph_window_open_schrodinger();
    else                                        graph_window_open(desc);

    /* no window opened (e.g. no data)?  don't let the report wander
       onto some later, unrelated plot */
    graph_set_next_report(NULL);
}

/* ═══════════════════════════════════════════════════════════
   BACKGROUND JOBS — keep the window alive while parse works
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    build_form_command
 * Input:       desc   (const ModuleDesc*) — current module
 *              cmd    (char*)  — receives the parse command line
 *              cmdlen (size_t) — capacity of cmd
 * Output:      int — 1 if cmd is ready to send, 0 if a required
 *              field is empty or the line is too long (status
 *              bar says which)
 * Description: Reads every field, checks the required ones, and
 *              assembles the command with md_build_command().
 *************************************************************/
static int build_form_command(const ModuleDesc *desc,
                              char *cmd, size_t cmdlen)
{
    const char *values[FORM_MAX_PARAMS];
    char        val_bufs[FORM_MAX_PARAMS][128];
    int         i;
    int         ok = 1;

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
    if (!ok) return 0;

    /* ── assemble ── */
    if (!md_build_command(desc, values, cmd, cmdlen))
    {
        app_status_set("Command too long — check field values");
        return 0;
    }
    return 1;
}

/*************************************************************
 * Function:    start_job
 * Input:       desc    (const ModuleDesc*) — module being run
 *              cmd     (const char*)       — command line for parse
 *              is_plot (int)               — 1 = open the plot after
 * Output:      void
 * Description: Echoes the command, starts the spinner, and sends
 *              the command to parse on a worker thread.  The GTK
 *              main loop stays free, so the window repaints and
 *              the spinner turns however long parse takes.
 *************************************************************/
static void start_job(const ModuleDesc *desc, const char *cmd, int is_plot)
{
    FormJob *job = g_new0(FormJob, 1);
    GTask   *task;

    job->desc    = desc;
    job->is_plot = is_plot;
    g_strlcpy(job->cmd, cmd, sizeof(job->cmd));

    app_output_append("< ");
    app_output_append(cmd);

    set_busy(TRUE, desc->label);

    /* the task owns job; g_free runs when the task is finalized */
    task = g_task_new(NULL, NULL, on_job_done, NULL);
    g_task_set_task_data(task, job, NULL);
    g_task_run_in_thread(task, job_thread);
    g_object_unref(task);
}

/*************************************************************
 * Function:    job_thread
 * Input:       task      — the running GTask
 *              source    — unused
 *              task_data — the FormJob
 *              cancel    — unused
 * Output:      void
 * Description: Worker thread.  Talks to parse and nothing else —
 *              no GTK calls here, GTK only likes the main thread.
 *              Uses its own buffer, not AppState's response_buf,
 *              so nothing on the main thread can scribble on it.
 *************************************************************/
static void job_thread(GTask *task, gpointer source,
                       gpointer task_data, GCancellable *cancel)
{
    FormJob *job = (FormJob *)task_data;

    (void)source;
    (void)cancel;

    job->response = g_malloc0(RESPONSE_BUFSIZE);
    job->ok       = pipe_transact(job->cmd, job->response, RESPONSE_BUFSIZE);

    g_task_return_boolean(task, TRUE);
}

/*************************************************************
 * Function:    on_job_done
 * Input:       source    — unused
 *              res       — the finished GTask
 *              user_data — unused
 * Output:      void
 * Description: Back on the main thread: shows parse's answer,
 *              stops the spinner, frees the buttons, and opens
 *              the plot window if this was a Plot.
 *************************************************************/
static void on_job_done(GObject *source, GAsyncResult *res,
                        gpointer user_data)
{
    FormJob *job = (FormJob *)g_task_get_task_data(G_TASK(res));

    (void)source;
    (void)user_data;

    /* ── the answer ── */
    if (job->ok)
        app_output_append(job->response);
    else
        app_output_append("(no response)\n");

    /* idle before plotting: the plot window asks parse for its
       vectors, and those requests must not look like a second job */
    set_busy(FALSE, NULL);
    app_status_set("Ran: %s", job->desc->label);

    if (job->is_plot && job->ok)
        open_plot(job->desc);

    g_free(job->response);
    g_free(job);
}

/*************************************************************
 * Function:    set_busy
 * Input:       busy  (gboolean)    — TRUE while parse is working
 *              label (const char*) — module name for the status
 *                                    bar; ignored when busy is FALSE
 * Output:      void
 * Description: Shows the busy row and spins the spinner, greys
 *              out Run, Plot and the command bar so nothing else
 *              talks to parse mid-calculation — or puts it all back.
 *************************************************************/
static void set_busy(gboolean busy, const char *label)
{
    AppState *st = app_state_get();

    g_busy = busy;

    if (g_form.spinner)
    {
        gtk_widget_set_visible(g_form.busy_row, busy);
        if (busy) gtk_spinner_start(GTK_SPINNER(g_form.spinner));
        else      gtk_spinner_stop (GTK_SPINNER(g_form.spinner));
    }

    /* greyed out AND faded: the button gradients hide GTK's own
       disabled look, so the fade is what tells the eye "not now" */
    if (g_form.run_btn)
    {
        gtk_widget_set_sensitive(g_form.run_btn, !busy);
        gtk_widget_set_opacity  (g_form.run_btn, busy ? 0.4 : 1.0);
    }
    if (g_form.plot_btn)
    {
        gtk_widget_set_sensitive(g_form.plot_btn, !busy);
        gtk_widget_set_opacity  (g_form.plot_btn, busy ? 0.4 : 1.0);
    }
    if (st->cmd_entry)   gtk_widget_set_sensitive(st->cmd_entry,   !busy);

    if (busy)
        app_status_set("Calculating: %s — please wait …", label);
}

/*************************************************************
 * Function:    build_report
 * Input:       desc (const ModuleDesc*) — the module just plotted
 * Output:      GraphReport* — caller owns (see graph.h)
 * Description: Inputs: every form field the user filled in, as
 *              typed, with its units — blank optional fields are
 *              left out, as they were left out of the command.
 *              Results: every scalar output in the descriptor,
 *              read back from parse.  Vectors are the plot itself,
 *              and outputs this run did not set (parse answers
 *              "Unknown variable") are skipped.
 *************************************************************/
static GraphReport *build_report(const ModuleDesc *desc)
{
    GraphReport *r = graph_report_new();
    char         buf[128];
    char         query[64];
    char         response[256];
    const char  *val;
    char        *end;
    int          i;

    /* ── inputs, straight from the form ── */
    for (i = 0; i < desc->n_params; i++)
    {
        val = read_widget(g_form.widgets[i], &desc->params[i],
                          buf, sizeof(buf));
        if (!val || val[0] == '\0') continue;

        graph_report_add(r, 0, desc->params[i].label, val,
                         desc->params[i].units);
    }

    /* ── results, asked of parse one scalar at a time ── */
    for (i = 0; i < desc->n_outputs; i++)
    {
        if (desc->outputs[i].is_vector) continue;

        snprintf(query, sizeof(query), "$%s\n", desc->outputs[i].var_name);
        if (!pipe_transact(query, response, sizeof(response))) continue;
        if (strncmp(response, "Unknown", 7) == 0) continue;

        /* trim the newline parse ends every answer with */
        end = response + strlen(response) - 1;
        while (end >= response && (*end == '\n' || *end == '\r' || *end == ' '))
            *end-- = '\0';
        if (response[0] == '\0') continue;

        graph_report_add(r, 1, desc->outputs[i].label, response,
                         desc->outputs[i].units);
    }

    return r;
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — input_form_sync
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    input_form_sync
 * Input:       void
 * Output:      void
 * Description: Reads stored parse variables for the active
 *              module and populates the input form fields.
 *              Called from main_gui.c after a command bar run.
 *
 *              For each PT_SCALAR/PT_STRING param, queries:
 *                $<command>_<key>  e.g. $reynolds_V
 *              If the variable is unknown or returns "0" for
 *              an optional field that was not supplied, the
 *              field is cleared so it does not show a stale 0.
 *              For PT_CHOICE, the returned string is matched
 *              against choices[] and the dropdown is updated.
 *              PT_FLAG params are skipped.
 *************************************************************/
void input_form_sync(void)
{
    AppState         *st   = app_state_get();
    const ModuleDesc *desc = g_form.desc;
    char              var_cmd[64];
    char              response[256];
    char              val[64];
    int               i;
    int               j;

    if (!desc) return;

    for (i = 0; i < desc->n_params; i++)
    {
        GtkWidget       *w = g_form.widgets[i];
        const ParamDesc *p = &desc->params[i];

        if (!w) continue;
        if (p->type == PT_FLAG) continue;

        /* ── build parse query: $<command>_<key> ── */
        snprintf(var_cmd, sizeof(var_cmd),
                 "$%s_%s\n", desc->command, p->key);

        if (!pipe_transact(var_cmd, response, sizeof(response)))
            continue;

        /* strip trailing whitespace/newline from response */
        {
            char *end = response + strlen(response) - 1;
            while (end >= response &&
                   (*end == '\n' || *end == '\r' || *end == ' '))
                *end-- = '\0';
        }

        /* skip if parse returned an error (unknown variable) */
        if (strncmp(response, "Unknown", 7) == 0) continue;

        /* copy to val */
        strncpy(val, response, sizeof(val) - 1);
        val[sizeof(val) - 1] = '\0';

        switch (p->type)
        {
            case PT_SCALAR:
            case PT_STRING:
            {
                /* for optional fields, don't show "0" if not set */
                if (!p->required &&
                    strcmp(val, "0") == 0 &&
                    strcmp(val, "0.0") == 0)
                    gtk_editable_set_text(GTK_EDITABLE(w), "");
                else
                    gtk_editable_set_text(GTK_EDITABLE(w), val);
                break;
            }

            case PT_CHOICE:
            {
                /* find matching choice and select it */
                GListModel *model =
                    gtk_drop_down_get_model(GTK_DROP_DOWN(w));
                guint n_items = g_list_model_get_n_items(model);
                for (j = 0; j < (int)n_items; j++)
                {
                    GObject *item = g_list_model_get_item(model, j);
                    if (item)
                    {
                        const char *choice =
                            gtk_string_object_get_string(
                                GTK_STRING_OBJECT(item));
                        if (strcmp(choice, val) == 0)
                        {
                            gtk_drop_down_set_selected(
                                GTK_DROP_DOWN(w), (guint)j);
                            g_object_unref(item);
                            break;
                        }
                        g_object_unref(item);
                    }
                }
                break;
            }

            case PT_FLAG:
                break;  /* handled by continue above */
        }
    }
}

/* ═══════════════════════════════════════════════════════════
   INTERNAL — build_param_row
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    build_param_row
 * Input:       grid (GtkWidget*)       — the parameter grid
 *              row  (int)              — grid row index
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
    gboolean    attached = FALSE;  /* TRUE once a case has put its
                                      own container in the grid */

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
                GtkWidget *hbox   = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
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
                widget   = entry;  /* store entry as the readable widget */
                attached = TRUE;   /* hbox is in the grid; the entry lives
                                      inside it and must NOT be attached
                                      a second time below — GTK4 allows
                                      a widget exactly one parent, and
                                      says so loudly on stderr */
                break;
            }

            widget = entry;
            break;
        }

        case PT_CHOICE:
        {
            GtkStringList *list;
            GtkWidget     *drop;
            int            n      = 0;
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

    /* attach the input widget to column 1 — unless its case already
       put a wrapper (e.g. the file entry + browse button box) there */
    if (widget && !attached)
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
 * Input:       w      (GtkWidget*)       — the input widget
 *              p      (const ParamDesc*) — its descriptor
 *              buf    (char*)            — scratch buffer
 *              buflen (size_t)           — buffer capacity
 * Output:      const char* — the current value as a string,
 *              or NULL / "" if the field is empty
 * Description: Reads the current value from any of the four
 *              widget types and returns it as a C string.
 *              For PT_CHOICE the selected item text is returned.
 *              For PT_FLAG returns "us" or "" (empty = not set).
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
            guint       sel   = gtk_drop_down_get_selected(
                                    GTK_DROP_DOWN(w));
            GListModel *model = gtk_drop_down_get_model(
                                    GTK_DROP_DOWN(w));
            GObject    *item  = g_list_model_get_item(model, sel);
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
 *************************************************************/
static void on_run_clicked(GtkButton *btn, gpointer user_data)
{
    (void)btn;
    (void)user_data;
    input_form_run();
}

/*************************************************************
 * Function:    on_plot_clicked
 *************************************************************/
static void on_plot_clicked(GtkButton *btn, gpointer user_data)
{
    (void)btn;
    (void)user_data;
    input_form_plot();
}

/*************************************************************
 * Function:    on_file_chosen
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
    gtk_file_dialog_set_filters(dialog, G_LIST_MODEL(filters));
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
 *************************************************************/
static void on_entry_activate(GtkEntry *entry, gpointer user_data)
{
    (void)entry;
    (void)user_data;
    input_form_run();
}
