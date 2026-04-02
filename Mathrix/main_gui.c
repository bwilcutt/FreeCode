#include <gtk/gtk.h>
#include <string.h>
#include <stdio.h>

#include "app_state.h"
#include "module_desc.h"
#include "input_form.h"
#include "pipe_mgr.h"
#include "colors.h"

static void     build_menu_bar     (GtkWidget *box);
static void     build_command_bar  (GtkWidget *box);
static void     build_center_panes (GtkWidget *box);
static void     build_status_bar   (GtkWidget *box);
static void     on_activate        (GtkApplication *app, gpointer user_data);
static void     on_cmd_activate    (GtkEntry *entry, gpointer user_data);
static void     on_module_selected (GSimpleAction *action, GVariant *param,
                                    gpointer user_data);
static void     on_about           (GSimpleAction *action, GVariant *param,
                                    gpointer user_data);
static void     on_clear           (GSimpleAction *action, GVariant *param,
                                    gpointer user_data);
static void     on_quit            (GSimpleAction *action, GVariant *param,
                                    gpointer user_data);
static gboolean connect_to_parse   (void);
static void     query_parse_version(void);

static const char *CSS =
    /* ── Catppuccin Macchiato — all colors from colors.h ── */

    /* ── global resets ── */
    "* {"
    "  -gtk-icon-style: symbolic;"
    "}"
    "label {"
    "  color: " MX_TEXT ";"
    "}"
    "window {"
    "  background-color: " MX_BASE ";"
    "}"

    /* ── global entry fields ── */
    "entry {"
    "  caret-color: " MX_BLUE ";"
    "  color: " MX_TEXT ";"
    "}"
    "headerbar {"
    "  background-color: " MX_MANTLE ";"
    "  border-bottom: 1px solid " MX_SURFACE0 ";"
    "  min-height: 38px;"
    "  padding: 0 8px;"
    "}"
    "headerbar .title {"
    "  color: " MX_BLUE ";"
    "  font-weight: 600;"
    "  font-size: 13px;"
    "  letter-spacing: 0.5px;"
    "}"
    "headerbar label {"
    "  color: " MX_BLUE ";"
    "  font-size: 13px;"
    "}"
    "headerbar button {"
    "  background: transparent;"
    "  border: none;"
    "  border-radius: 6px;"
    "  color: " MX_OVERLAY1 ";"
    "  min-width: 28px;"
    "  min-height: 28px;"
    "  padding: 4px;"
    "}"
    "headerbar button:hover {"
    "  background-color: " MX_SURFACE0 ";"
    "  color: " MX_TEXT ";"
    "}"
    "headerbar button:active {"
    "  background-color: " MX_SURFACE1 ";"
    "}"
    "headerbar windowcontrols button {"
    "  color: " MX_OVERLAY1 ";"
    "  border-radius: 50%;"
    "  min-width: 24px;"
    "  min-height: 24px;"
    "}"
    "headerbar windowcontrols button.close {"
    "  background-color: " MX_RED ";"
    "  color: " MX_CRUST ";"
    "}"
    "headerbar windowcontrols button.minimize {"
    "  background-color: " MX_YELLOW ";"
    "  color: " MX_CRUST ";"
    "}"
    "headerbar windowcontrols button.maximize {"
    "  background-color: " MX_GREEN ";"
    "  color: " MX_CRUST ";"
    "}"

    /* ── menubar ── */
    ".mathrix-menubar {"
    "  background-color: " MX_MANTLE ";"
    "  padding: 2px 8px;"
    "}"
    ".mathrix-menubar-inner {"
    "  background-color: " MX_MANTLE ";"
    "  padding: 2px 8px;"
    "}"
    ".mathrix-menubar button,"
    ".mathrix-menubar-inner button {"
    "  color: " MX_TEXT ";"
    "  background: transparent;"
    "  border: none;"
    "  border-radius: 6px;"
    "  padding: 5px 14px;"
    "  font-size: 13px;"
    "  font-weight: 500;"
    "}"
    ".mathrix-menubar button:hover,"
    ".mathrix-menubar-inner button:hover {"
    "  background-color: " MX_SURFACE0 ";"
    "  color: " MX_BLUE ";"
    "}"

    /* ── command entry bar ── */
    ".mathrix-cmdbar {"
    "  background-color: " MX_MANTLE ";"
    "  border-bottom: 1px solid " MX_SURFACE0 ";"
    "  padding: 7px 14px;"
    "}"
    ".mathrix-cmdentry {"
    "  background-color: " MX_CRUST ";"
    "  color: " MX_TEXT ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 8px;"
    "  padding: 6px 14px;"
    "  font-family: monospace;"
    "  font-size: 13px;"
    "  caret-color: " MX_BLUE ";"
    "}"
    ".mathrix-cmdentry:focus {"
    "  border-color: " MX_BLUE ";"
    "}"

    /* ── left panel — input form ── */
    ".mathrix-formpanel {"
    "  background-color: " MX_MANTLE ";"
    "  border-right: 1px solid " MX_SURFACE0 ";"
    "  padding: 16px 14px;"
    "}"
    ".mathrix-formpanel label {"
    "  color: " MX_SUBTEXT0 ";"
    "  font-size: 12px;"
    "}"
    ".mathrix-formpanel entry {"
    "  background-color: " MX_CRUST ";"
    "  color: " MX_TEXT ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 5px;"
    "  padding: 4px 8px;"
    "  font-family: monospace;"
    "  font-size: 12px;"
    "  caret-color: " MX_BLUE ";"
    "}"
    ".mathrix-formpanel entry:focus {"
    "  border-color: " MX_BLUE ";"
    "}"
    ".mathrix-form-title {"
    "  color: " MX_BLUE ";"
    "  font-size: 14px;"
    "  font-weight: bold;"
    "  letter-spacing: 0.3px;"
    "  margin-bottom: 4px;"
    "}"
    ".mathrix-form-desc {"
    "  color: " MX_OVERLAY0 ";"
    "  font-size: 11px;"
    "  margin-bottom: 10px;"
    "  font-style: italic;"
    "}"

    /* ── run button ── */
    ".mathrix-run-btn {"
    "  background: linear-gradient(135deg, " MX_BLUE " 0%, " MX_SAPPHIRE " 100%);"
    "  color: " MX_CRUST ";"
    "  border: none;"
    "  border-radius: 8px;"
    "  padding: 8px 22px;"
    "  font-weight: bold;"
    "  font-size: 13px;"
    "  letter-spacing: 0.3px;"
    "}"
    ".mathrix-run-btn label {"
    "  color: " MX_CRUST ";"
    "  font-weight: bold;"
    "  font-size: 13px;"
    "}"
    ".mathrix-run-btn:hover {"
    "  background: linear-gradient(135deg, " MX_SKY " 0%, " MX_BLUE " 100%);"
    "}"
    ".mathrix-run-btn:hover label {"
    "  color: " MX_CRUST ";"
    "}"
    ".mathrix-run-btn:active {"
    "  background: linear-gradient(135deg, " MX_SAPPHIRE " 0%, " MX_BLUE " 100%);"
    "}"

    /* ── plot button ── */
    ".mathrix-plot-btn {"
    "  background: linear-gradient(135deg, " MX_GREEN " 0%, " MX_TEAL " 100%);"
    "  color: " MX_CRUST ";"
    "  border: none;"
    "  border-radius: 8px;"
    "  padding: 8px 18px;"
    "  font-weight: bold;"
    "  font-size: 13px;"
    "}"
    ".mathrix-plot-btn label {"
    "  color: " MX_CRUST ";"
    "  font-weight: bold;"
    "  font-size: 13px;"
    "}"
    ".mathrix-plot-btn:hover {"
    "  background: linear-gradient(135deg, " MX_TEAL " 0%, " MX_GREEN " 100%);"
    "}"
    ".mathrix-plot-btn:hover label {"
    "  color: " MX_CRUST ";"
    "}"

    /* ── right panel — output ── */
    ".mathrix-outpanel {"
    "  background-color: " MX_CRUST ";"
    "}"
    "textview.mathrix-output {"
    "  background-color: " MX_CRUST ";"
    "  color: " MX_TEXT ";"
    "  font-family: monospace;"
    "  font-size: 12px;"
    "}"
    "textview.mathrix-output text {"
    "  background-color: " MX_CRUST ";"
    "  color: " MX_TEXT ";"
    "}"

    /* ── graph window toolbar ── */
    ".graph-toolbar {"
    "  background-color: " MX_MANTLE ";"
    "  border-bottom: 1px solid " MX_SURFACE0 ";"
    "  padding: 5px 12px;"
    "}"
    ".graph-title-lbl {"
    "  color: " MX_SAPPHIRE ";"
    "  font-size: 13px;"
    "  font-weight: 600;"
    "  letter-spacing: 0.4px;"
    "}"

    /* ── status bar ── */
    ".mathrix-statusbar {"
    "  background-color: " MX_MANTLE ";"
    "  border-top: 1px solid " MX_SURFACE0 ";"
    "  padding: 3px 14px;"
    "  color: " MX_OVERLAY0 ";"
    "  font-size: 11px;"
    "}"

    /* ── dialogs ── */
    ".mathrix-dialog {"
    "  background-color: " MX_BASE ";"
    "}"
    ".mathrix-dialog label {"
    "  color: " MX_TEXT ";"
    "  font-size: 13px;"
    "}"

    /* ── separator ── */
    "separator {"
    "  background-color: " MX_SURFACE0 ";"
    "  min-height: 1px;"
    "  min-width: 1px;"
    "}"

    /* ── dropdown button face ── */
    "dropdown {"
    "  background-color: " MX_CRUST ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 5px;"
    "  color: " MX_TEXT ";"
    "}"
    "dropdown > button {"
    "  background-color: " MX_CRUST ";"
    "  color: " MX_TEXT ";"
    "  border: none;"
    "  border-radius: 5px;"
    "  padding: 4px 8px;"
    "}"
    "dropdown > button > box > label,"
    "dropdown > button label {"
    "  color: " MX_TEXT ";"
    "  font-size: 12px;"
    "}"
    "dropdown > button:hover {"
    "  background-color: " MX_SURFACE0 ";"
    "}"

    /* ── popover (dropdown list panel) ── */
    "popover > contents {"
    "  background-color: " MX_MANTLE ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 8px;"
    "  padding: 4px;"
    "}"
    "popover label {"
    "  color: " MX_TEXT ";"
    "  font-size: 13px;"
    "}"
    "popover listview {"
    "  background-color: " MX_MANTLE ";"
    "  border-radius: 6px;"
    "}"
    "popover listview > row {"
    "  background-color: transparent;"
    "  color: " MX_TEXT ";"
    "  padding: 5px 10px;"
    "  border-radius: 5px;"
    "  min-height: 28px;"
    "}"
    "popover listview > row:hover {"
    "  background-color: " MX_SURFACE0 ";"
    "  color: " MX_BLUE ";"
    "}"
    "popover listview > row:selected {"
    "  background-color: " MX_SURFACE1 ";"
    "  color: " MX_BLUE ";"
    "}"
    "popover listview > row label {"
    "  color: inherit;"
    "  font-size: 13px;"
    "}"

    /* ── menu popover (File / Help menus) ── */
    "popover.menu > contents {"
    "  background-color: " MX_MANTLE ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 8px;"
    "  padding: 4px;"
    "}"
    "popover.menu modelbutton {"
    "  border-radius: 5px;"
    "  padding: 6px 12px;"
    "  color: " MX_TEXT ";"
    "  min-height: 30px;"
    "}"
    "popover.menu modelbutton:hover {"
    "  background-color: " MX_SURFACE0 ";"
    "  color: " MX_BLUE ";"
    "}"
    "popover.menu modelbutton label {"
    "  color: inherit;"
    "  font-size: 13px;"
    "}"
    "popover.menu separator {"
    "  background-color: " MX_SURFACE0 ";"
    "  margin: 3px 6px;"
    "}"

    /* ── checkbutton ── */
    "checkbutton {"
    "  color: " MX_TEXT ";"
    "}"
    "checkbutton label {"
    "  color: " MX_TEXT ";"
    "  font-size: 12px;"
    "}"
    "checkbutton check {"
    "  background-color: " MX_CRUST ";"
    "  border: 1px solid " MX_SURFACE1 ";"
    "  border-radius: 4px;"
    "}"
    "checkbutton check:checked {"
    "  background-color: " MX_BLUE ";"
    "  border-color: " MX_BLUE ";"
    "  color: " MX_CRUST ";"
    "}"

    /* ── scrollbar ── */
    "scrollbar {"
    "  background-color: transparent;"
    "  border: none;"
    "}"
    "scrollbar slider {"
    "  background-color: " MX_SURFACE1 ";"
    "  border-radius: 4px;"
    "  min-width: 6px;"
    "  min-height: 6px;"
    "  margin: 2px;"
    "}"
    "scrollbar slider:hover {"
    "  background-color: " MX_SURFACE2 ";"
    "}"

    /* ── paned splitter ── */
    "paned > separator {"
    "  background-color: " MX_SURFACE0 ";"
    "  min-width: 2px;"
    "  min-height: 2px;"
    "}"
    "paned > separator:hover {"
    "  background-color: " MX_BLUE ";"
    "}";

/*************************************************************
 * Function:    build_menu_bar
 * Input:       box (GtkWidget*) — vertical box to append into
 * Output:      void
 * Description: Builds the horizontal menu bar.  The first row
 *              contains File, Edit, and View items followed by
 *              one button per module category (auto-built from
 *              the descriptor table).  Each category button
 *              opens a GtkPopoverMenu listing the modules in
 *              that category.  Selecting a module triggers
 *              on_module_selected() which loads the input form.
 *************************************************************/
static void build_menu_bar(GtkWidget *box)
{
    GtkWidget   *bar;
    GtkWidget   *hbox;
    GtkWidget   *btn;
    GtkWidget   *popover;
    GtkWidget   *pop_box;
    GtkWidget   *item_btn;
    const char  *cats[32];
    int          n_cats;
    int          i;
    int          j;
    const ModuleDesc *mods[32];
    int          n_mods;

    bar  = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    hbox = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 2);
    gtk_widget_add_css_class(bar,  "mathrix-menubar");
    gtk_widget_add_css_class(hbox, "mathrix-menubar-inner");

    /* ── File menu ── */
    {
        GMenu    *gmenu  = g_menu_new();
        GMenuItem *clear = g_menu_item_new("Clear output", "app.clear");
        GMenuItem *quit  = g_menu_item_new("Quit",         "app.quit");
        g_menu_append_item(gmenu, clear);
        g_menu_append_item(gmenu, quit);
        g_object_unref(clear);
        g_object_unref(quit);

        btn     = gtk_menu_button_new();
        popover = gtk_popover_menu_new_from_model(G_MENU_MODEL(gmenu));
        gtk_menu_button_set_label(GTK_MENU_BUTTON(btn), "File");
        gtk_menu_button_set_popover(GTK_MENU_BUTTON(btn), popover);
        gtk_widget_add_css_class(btn, "mathrix-menubar");
        gtk_box_append(GTK_BOX(hbox), btn);
        g_object_unref(gmenu);
    }

    /* ── Help menu ── */
    {
        GMenu    *gmenu = g_menu_new();
        GMenuItem *about = g_menu_item_new("About Mathrix", "app.about");
        g_menu_append_item(gmenu, about);
        g_object_unref(about);

        btn     = gtk_menu_button_new();
        popover = gtk_popover_menu_new_from_model(G_MENU_MODEL(gmenu));
        gtk_menu_button_set_label(GTK_MENU_BUTTON(btn), "Help");
        gtk_menu_button_set_popover(GTK_MENU_BUTTON(btn), popover);
        gtk_widget_add_css_class(btn, "mathrix-menubar");
        gtk_box_append(GTK_BOX(hbox), btn);
        g_object_unref(gmenu);
    }

    /* ── separator ── */
    gtk_box_append(GTK_BOX(hbox),
        gtk_separator_new(GTK_ORIENTATION_VERTICAL));

    /* ── one button per module category ── */
    n_cats = md_categories(cats, 32);
    for (i = 0; i < n_cats; i++)
    {
        n_mods  = md_in_category(cats[i], mods, 32);
        pop_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 2);
        gtk_widget_set_margin_start(pop_box, 4);
        gtk_widget_set_margin_end(pop_box, 4);
        gtk_widget_set_margin_top(pop_box, 4);
        gtk_widget_set_margin_bottom(pop_box, 4);

        for (j = 0; j < n_mods; j++)
        {
            item_btn = gtk_button_new_with_label(mods[j]->label);
            gtk_actionable_set_action_name(
                GTK_ACTIONABLE(item_btn), "app.module");
            gtk_actionable_set_action_target_value(
                GTK_ACTIONABLE(item_btn),
                g_variant_new_string(mods[j]->command));
            gtk_widget_add_css_class(item_btn, "mathrix-menubar-inner");
            gtk_box_append(GTK_BOX(pop_box), item_btn);
        }

        popover = gtk_popover_new();
        gtk_popover_set_child(GTK_POPOVER(popover), pop_box);

        btn = gtk_menu_button_new();
        gtk_menu_button_set_label(GTK_MENU_BUTTON(btn), cats[i]);
        gtk_menu_button_set_popover(GTK_MENU_BUTTON(btn), popover);
        gtk_widget_add_css_class(btn, "mathrix-menubar");
        gtk_box_append(GTK_BOX(hbox), btn);
    }

    gtk_box_append(GTK_BOX(bar),  hbox);
    gtk_box_append(GTK_BOX(box),  bar);
}

/*************************************************************
 * Function:    build_command_bar
 * Input:       box (GtkWidget*) — vertical box to append into
 * Output:      void
 * Description: Builds the single-line command entry bar that
 *              lets power users type parse commands directly,
 *              bypassing the input form.  Pressing Enter sends
 *              the command to parse via on_cmd_activate().
 *************************************************************/
static void build_command_bar(GtkWidget *box)
{
    AppState  *st   = app_state_get();
    GtkWidget *hbox = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    GtkWidget *lbl  = gtk_label_new("< ");
    GtkWidget *entry= gtk_entry_new();

    gtk_widget_add_css_class(hbox,  "mathrix-cmdbar");
    gtk_widget_add_css_class(entry, "mathrix-cmdentry");
    gtk_widget_add_css_class(lbl,   "mathrix-cmdentry");

    gtk_label_set_use_markup(GTK_LABEL(lbl), FALSE);
    gtk_entry_set_placeholder_text(GTK_ENTRY(entry),
        "Type a parse command and press Enter…");
    gtk_widget_set_hexpand(entry, TRUE);

    g_signal_connect(entry, "activate",
                     G_CALLBACK(on_cmd_activate), NULL);

    gtk_box_append(GTK_BOX(hbox), lbl);
    gtk_box_append(GTK_BOX(hbox), entry);
    gtk_box_append(GTK_BOX(box),  hbox);

    st->cmd_entry = entry;
}

/*************************************************************
 * Function:    build_center_panes
 * Input:       box (GtkWidget*) — vertical box to append into
 * Output:      void
 * Description: Builds the two-column center area with a
 *              GtkPaned splitter.  The left pane holds the
 *              form_box (populated by input_form.c when a
 *              module is selected).  The right pane holds a
 *              scrolled GtkTextView for parse output.
 *************************************************************/
static void build_center_panes(GtkWidget *box)
{
    AppState      *st      = app_state_get();
    GtkWidget     *paned   = gtk_paned_new(GTK_ORIENTATION_HORIZONTAL);
    GtkWidget     *left_scroll;
    GtkWidget     *right_scroll;
    GtkWidget     *form_viewport;
    GtkWidget     *output_view;
    GtkTextBuffer *out_buf;

    /* ── left pane — input form ── */
    st->form_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_add_css_class(st->form_box, "mathrix-formpanel");
    gtk_widget_set_size_request(st->form_box, 280, -1);

    left_scroll    = gtk_scrolled_window_new();
    form_viewport  = gtk_viewport_new(NULL, NULL);
    gtk_viewport_set_child(GTK_VIEWPORT(form_viewport), st->form_box);
    gtk_scrolled_window_set_child(
        GTK_SCROLLED_WINDOW(left_scroll), form_viewport);
    gtk_scrolled_window_set_policy(
        GTK_SCROLLED_WINDOW(left_scroll),
        GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
    gtk_widget_set_vexpand(left_scroll, TRUE);

    /* placeholder text until a module is selected */
    {
        GtkWidget *ph = gtk_label_new(
            "Select a module from the menu\nor type a command above");
        gtk_widget_add_css_class(ph, "mathrix-form-desc");
        gtk_label_set_justify(GTK_LABEL(ph), GTK_JUSTIFY_CENTER);
        gtk_widget_set_valign(ph, GTK_ALIGN_CENTER);
        gtk_widget_set_vexpand(ph, TRUE);
        gtk_box_append(GTK_BOX(st->form_box), ph);
    }

    /* ── right pane — output view ── */
    out_buf     = gtk_text_buffer_new(NULL);
    output_view = gtk_text_view_new_with_buffer(out_buf);
    gtk_text_view_set_editable(GTK_TEXT_VIEW(output_view), FALSE);
    gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(output_view), FALSE);
    gtk_text_view_set_monospace(GTK_TEXT_VIEW(output_view), TRUE);
    gtk_text_view_set_left_margin(GTK_TEXT_VIEW(output_view), 12);
    gtk_text_view_set_top_margin(GTK_TEXT_VIEW(output_view), 8);
    gtk_widget_add_css_class(output_view, "mathrix-output");

    right_scroll = gtk_scrolled_window_new();
    gtk_scrolled_window_set_child(
        GTK_SCROLLED_WINDOW(right_scroll), output_view);
    gtk_scrolled_window_set_policy(
        GTK_SCROLLED_WINDOW(right_scroll),
        GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
    gtk_widget_set_hexpand(right_scroll, TRUE);
    gtk_widget_set_vexpand(right_scroll, TRUE);
    gtk_widget_add_css_class(right_scroll, "mathrix-outpanel");

    st->output_view = output_view;
    st->output_buf  = out_buf;

    gtk_paned_set_start_child(GTK_PANED(paned), left_scroll);
    gtk_paned_set_end_child(GTK_PANED(paned),   right_scroll);
    gtk_paned_set_position(GTK_PANED(paned), 300);
    gtk_widget_set_vexpand(paned, TRUE);

    gtk_box_append(GTK_BOX(box), paned);
}

/*************************************************************
 * Function:    build_status_bar
 * Input:       box (GtkWidget*) — vertical box to append into
 * Output:      void
 * Description: Builds the thin status label at the bottom of
 *              the window showing parse connection status and
 *              the last action performed.
 *************************************************************/
static void build_status_bar(GtkWidget *box)
{
    AppState  *st  = app_state_get();
    GtkWidget *lbl = gtk_label_new("Connecting to parse…");

    gtk_widget_add_css_class(lbl, "mathrix-statusbar");
    gtk_label_set_xalign(GTK_LABEL(lbl), 0.0f);
    gtk_widget_set_hexpand(lbl, TRUE);
    gtk_box_append(GTK_BOX(box), lbl);
    st->status_bar = lbl;
}

/*************************************************************
 * Function:    on_cmd_activate
 * Input:       entry     (GtkEntry*) — the command entry widget
 *              user_data (gpointer)  — unused
 * Output:      void
 * Description: Called when the user presses Enter in the
 *              command entry bar.  Sends the command to parse,
 *              appends the response to the output panel, and
 *              clears the entry ready for the next command.
 *************************************************************/
static void on_cmd_activate(GtkEntry *entry, gpointer user_data)
{
    AppState   *st  = app_state_get();
    const char *txt = gtk_editable_get_text(GTK_EDITABLE(entry));
    char        cmd[512];

    if (!txt || txt[0] == '\0') return;

    snprintf(cmd, sizeof(cmd), "%s\n", txt);
    app_output_append("< ");
    app_output_append(txt);
    app_output_append("\n");

    if (pipe_transact(cmd, st->response_buf, RESPONSE_BUFSIZE))
        app_output_append(st->response_buf);
    else
        app_output_append("(no response — is parse running?)\n");

    gtk_editable_set_text(GTK_EDITABLE(entry), "");
    app_status_set("Command sent: %s", txt);
}

/*************************************************************
 * Function:    on_module_selected
 * Input:       action    (GSimpleAction*) — the triggered action
 *              param     (GVariant*)      — string = command name
 *              user_data (gpointer)       — unused
 * Output:      void
 * Description: Called when the user selects a module from a
 *              category menu.  Looks up the ModuleDesc and
 *              calls input_form_load() to rebuild the left pane.
 *************************************************************/
static void on_module_selected(GSimpleAction *action, GVariant *param,
                                gpointer user_data)
{
    const char       *command = g_variant_get_string(param, NULL);
    const ModuleDesc *desc    = md_find(command);
    AppState         *st      = app_state_get();

    if (!desc) return;
    st->current_module = desc;
    input_form_load(desc, st->form_box);
    app_status_set("Module: %s", desc->label);
}

/*************************************************************
 * Function:    on_about
 * Input:       action    (GSimpleAction*) — unused
 *              param     (GVariant*)      — unused
 *              user_data (gpointer)       — unused
 * Output:      void
 * Description: Shows the About dialog with Mathrix version,
 *              parse version, and contact information.
 *************************************************************/
static void on_about(GSimpleAction *action, GVariant *param,
                     gpointer user_data)
{
    AppState  *st  = app_state_get();
    char       msg[512];
    GtkWidget *dialog;
    GtkWidget *lbl;
    GtkWidget *btn;
    GtkWidget *vbox;

    snprintf(msg, sizeof(msg),
        "<big><b>Mathrix</b></big>  v%s\n\n"
        "Math &amp; Engineering Shell GUI\n\n"
        "Parse engine:  %s\n\n"
        "Contact:  bwilcutt@yahoo.com",
        MATHRIX_VERSION,
        st->parse_version[0] ? st->parse_version : "unknown");

    dialog = gtk_window_new();
    gtk_window_set_title(GTK_WINDOW(dialog), "About Mathrix");
    gtk_window_set_transient_for(GTK_WINDOW(dialog),
                                  GTK_WINDOW(st->window));
    gtk_window_set_modal(GTK_WINDOW(dialog), TRUE);
    gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
    gtk_window_set_default_size(GTK_WINDOW(dialog), 360, 220);
    gtk_widget_add_css_class(dialog, "mathrix-dialog");

    vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 12);
    gtk_widget_set_margin_start(vbox,  24);
    gtk_widget_set_margin_end(vbox,    24);
    gtk_widget_set_margin_top(vbox,    24);
    gtk_widget_set_margin_bottom(vbox, 24);

    lbl = gtk_label_new(NULL);
    gtk_label_set_markup(GTK_LABEL(lbl), msg);
    gtk_label_set_justify(GTK_LABEL(lbl), GTK_JUSTIFY_CENTER);
    gtk_box_append(GTK_BOX(vbox), lbl);

    btn = gtk_button_new_with_label("Close");
    gtk_widget_add_css_class(btn, "mathrix-run-btn");
    gtk_widget_set_halign(btn, GTK_ALIGN_CENTER);
    g_signal_connect_swapped(btn, "clicked",
                              G_CALLBACK(gtk_window_destroy), dialog);
    gtk_box_append(GTK_BOX(vbox), btn);

    gtk_window_set_child(GTK_WINDOW(dialog), vbox);
    gtk_window_present(GTK_WINDOW(dialog));
}

/*************************************************************
 * Function:    on_clear
 * Input:       action    (GSimpleAction*) — unused
 *              param     (GVariant*)      — unused
 *              user_data (gpointer)       — unused
 * Output:      void
 * Description: Clears the output panel.
 *************************************************************/
static void on_clear(GSimpleAction *action, GVariant *param,
                     gpointer user_data)
{
    app_output_clear();
    app_status_set("Output cleared");
}

/*************************************************************
 * Function:    on_quit
 * Input:       action    (GSimpleAction*) — unused
 *              param     (GVariant*)      — unused
 *              user_data (gpointer)       — the GtkApplication
 * Output:      void
 * Description: Closes the pipe and quits the application.
 *************************************************************/
static void on_quit(GSimpleAction *action, GVariant *param,
                    gpointer user_data)
{
    pipe_close();
    g_application_quit(G_APPLICATION(user_data));
}

/*************************************************************
 * Function:    connect_to_parse
 * Input:       void
 * Output:      gboolean — TRUE on success, FALSE on failure
 * Description: Spawns the parse binary via pipe_open(), then
 *              consumes the startup prompt.  Returns FALSE and
 *              shows an error dialog if parse cannot be started.
 *************************************************************/
static gboolean connect_to_parse(void)
{
    AppState *st = app_state_get();
    char      startup[256];

    if (!pipe_open(PARSE_BINARY))
    {
        GtkWidget *dlg  = gtk_window_new();
        GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 12);
        GtkWidget *lbl;
        GtkWidget *btn;
        char       errmsg[256];

        snprintf(errmsg, sizeof(errmsg),
                 "Could not start parse binary:\n%s", PARSE_BINARY);

        gtk_window_set_title(GTK_WINDOW(dlg), "Error");
        gtk_window_set_transient_for(GTK_WINDOW(dlg),
                                      GTK_WINDOW(st->window));
        gtk_window_set_modal(GTK_WINDOW(dlg), TRUE);
        gtk_window_set_resizable(GTK_WINDOW(dlg), FALSE);
        gtk_widget_add_css_class(dlg, "mathrix-dialog");

        gtk_widget_set_margin_start(vbox,  24);
        gtk_widget_set_margin_end(vbox,    24);
        gtk_widget_set_margin_top(vbox,    24);
        gtk_widget_set_margin_bottom(vbox, 24);

        lbl = gtk_label_new(errmsg);
        gtk_box_append(GTK_BOX(vbox), lbl);

        btn = gtk_button_new_with_label("Close");
        gtk_widget_set_halign(btn, GTK_ALIGN_CENTER);
        g_signal_connect_swapped(btn, "clicked",
                                  G_CALLBACK(gtk_window_destroy), dlg);
        gtk_box_append(GTK_BOX(vbox), btn);

        gtk_window_set_child(GTK_WINDOW(dlg), vbox);
        gtk_window_present(GTK_WINDOW(dlg));
        return FALSE;
    }

    /* consume the startup prompt */
    pipe_recv(startup, sizeof(startup));
    return TRUE;
}

/*************************************************************
 * Function:    query_parse_version
 * Input:       void
 * Output:      void
 * Description: Sends "version\n" to parse and stores the
 *              response in app_state->parse_version for
 *              display in the About dialog.
 *************************************************************/
static void query_parse_version(void)
{
    AppState *st = app_state_get();
    char      buf[128];
    char     *nl;

    if (!pipe_transact("version\n", buf, sizeof(buf))) return;

    /* strip trailing newline */
    nl = strchr(buf, '\n');
    if (nl) *nl = '\0';
    strncpy(st->parse_version, buf, sizeof(st->parse_version) - 1);
}

/*************************************************************
 * Function:    on_activate
 * Input:       app       (GtkApplication*) — the application
 *              user_data (gpointer)         — unused
 * Output:      void
 * Description: Called by GTK when the application starts.
 *              Builds the complete main window, registers
 *              actions, applies CSS, connects to parse, and
 *              shows the window.
 *************************************************************/
static void on_activate(GtkApplication *app, gpointer user_data)
{
    AppState         *st;
    GtkWidget        *window;
    GtkWidget        *vbox;
    GtkCssProvider   *css;
    GSimpleAction    *act;
    const GActionEntry app_actions[] = {
        { "about",  on_about,  NULL, NULL, NULL },
        { "clear",  on_clear,  NULL, NULL, NULL },
        { "quit",   on_quit,   NULL, NULL, NULL },
        { "module", on_module_selected, "s", NULL, NULL },
    };

    app_state_init();
    st = app_state_get();

    /* ── main window ── */
    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Mathrix");
    gtk_window_set_default_size(GTK_WINDOW(window), 1100, 700);
    st->window = window;

    /* ── CSS ── */
    css = gtk_css_provider_new();
    gtk_css_provider_load_from_string(css, CSS);
    gtk_style_context_add_provider_for_display(
        gtk_widget_get_display(window),
        GTK_STYLE_PROVIDER(css),
        GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref(css);

    /* ── actions ── */
    g_action_map_add_action_entries(G_ACTION_MAP(app),
        app_actions, G_N_ELEMENTS(app_actions), app);

    /* ── layout ── */
    vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    build_menu_bar(vbox);
    build_command_bar(vbox);
    build_center_panes(vbox);
    build_status_bar(vbox);
    gtk_window_set_child(GTK_WINDOW(window), vbox);

    /* ── connect to parse ── */
    if (connect_to_parse())
    {
        query_parse_version();
        app_status_set("Connected to parse %s — ready",
                        st->parse_version);
        app_output_append("Mathrix v" MATHRIX_VERSION
                          " — parse engine connected\n\n");
    }
    else
    {
        app_status_set("ERROR: could not connect to parse");
    }

    gtk_window_present(GTK_WINDOW(window));
}

/*************************************************************
 * Function:    main
 * Input:       argc (int)    — argument count
 *              argv (char**) — argument vector
 * Output:      int — exit status
 * Description: Creates the GtkApplication, connects the
 *              activate signal, and runs the GTK main loop.
 *              pipe_close() is called on exit to cleanly
 *              shut down the parse subprocess.
 *************************************************************/
int main(int argc, char *argv[])
{
    GtkApplication *app;
    int             status;

    app = gtk_application_new("com.mathrix.app",
                               G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(on_activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    pipe_close();
    g_object_unref(app);
    return status;
}
