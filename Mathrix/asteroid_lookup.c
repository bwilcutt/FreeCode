/* =============================================================================
 * File:         asteroid_lookup.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  "Known asteroid" picker — see asteroid_lookup.h.
 *
 *               Flow:
 *                 1. User picks a name in the drop-down.
 *                 2. One HTTPS GET to the JPL SBDB API, asynchronous, so
 *                    the window keeps drawing while it waits:
 *                      https://ssd-api.jpl.nasa.gov/sbdb.api?sstr=<id>&full-prec=true
 *                 3. The JSON reply carries orbit.elements[], each with a
 *                    name, a value and a sigma, all as text; plus
 *                    orbit.epoch (Julian date, TDB) and object.fullname.
 *                 4. Values go into the form exactly as JPL wrote them,
 *                    full precision, no rounding on the way through.
 *
 *               JPL element name  ->  form field (value, sigma)
 *                 a   semi-major axis          a,   sa
 *                 e   eccentricity             e,   se
 *                 i   inclination              i,   si
 *                 om  ascending node           om,  som
 *                 w   argument of perihelion   w,   sw
 *                 ma  mean anomaly             M,   sM
 *                 orbit.epoch                  epoch
 * ============================================================================= */

#include "asteroid_lookup.h"
#include "app_state.h"
#include "colors.h"

#include <libsoup/soup.h>
#include <json-glib/json-glib.h>
#include <string.h>
#include <stdio.h>

#define JPL_SBDB_URL  "https://ssd-api.jpl.nasa.gov/sbdb.api?full-prec=true&sstr="

/* ═══════════════════════════════════════════════════════════
   THE LIST
   What JPL is asked for (number or provisional designation —
   both are unambiguous, unlike some names) and what the user sees.
   ═══════════════════════════════════════════════════════════ */

typedef struct
{
    const char *query;   /* JPL search string */
    const char *label;   /* shown in the drop-down */
} KnownAsteroid;

static const KnownAsteroid known[] =
{
    { "99942",    "99942 Apophis — skims past Earth in April 2029"      },
    { "101955",   "101955 Bennu — sampled by OSIRIS-REx"                },
    { "2024 YR4", "2024 YR4 — briefly the riskiest asteroid known"      },
    { "29075",    "29075 (1950 DA) — small chance of impact in 2880"    },
    { "65803",    "65803 Didymos — its moon was hit by DART"            },
    { "162173",   "162173 Ryugu — sampled by Hayabusa2"                 },
    { "25143",    "25143 Itokawa — sampled by Hayabusa"                 },
    { "433",      "433 Eros — first asteroid orbited by a spacecraft"   },
    { "4179",     "4179 Toutatis — tumbling near-Earth asteroid"        },
    { "3200",     "3200 Phaethon — parent of the Geminid meteors"       },
    { "3122",     "3122 Florence — big asteroid with two moons"         },
    { "4660",     "4660 Nereus — easy target for spacecraft"            },
    { "1862",     "1862 Apollo — namesake of the Earth-crossers"        },
    { "69230",    "69230 Hermes — lost for 66 years, found in 2003"     },
    { "1036",     "1036 Ganymed — largest near-Earth asteroid"          },
    { "2008 TC3", "2008 TC3 — actually hit Earth (Sudan, 7 Oct 2008)"   },
    { "1",        "1 Ceres — dwarf planet, largest in the main belt"    },
    { "4",        "4 Vesta — visited by Dawn"                           },
    { "2",        "2 Pallas — third largest in the main belt"           },
    { "16",       "16 Psyche — metal-rich, NASA mission on the way"     },
};
#define N_KNOWN  ((int)(sizeof(known) / sizeof(known[0])))

/* JPL element name, form field for its value, form field for its sigma */
static const char *element_map[][3] =
{
    { "a",  "a",  "sa"  },
    { "e",  "e",  "se"  },
    { "i",  "i",  "si"  },
    { "om", "om", "som" },
    { "w",  "w",  "sw"  },
    { "ma", "M",  "sM"  },
};
#define N_ELEMENTS  ((int)(sizeof(element_map) / sizeof(element_map[0])))

/*************************************************************
 * Struct:      LookupJob
 * Description: One download in flight.  The drop-down pointer is
 *              weak: if the form is torn down (the user switched
 *              modules) it turns NULL and the answer is dropped,
 *              rather than typed into some other module's fields.
 **************************************************************/
typedef struct
{
    GtkWidget        *drop;      /* weak — NULL once the form is gone */
    const ModuleDesc *desc;
    GtkWidget       **widgets;
    int               index;     /* entry in known[] */
} LookupJob;

/* one HTTP session for the life of the program; it pools connections */
static SoupSession *session = NULL;

/* ═══════════════════════════════════════════════════════════
   FILLING THE FORM
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    set_field
 * Input:       job  (LookupJob*)   — whose form to fill
 *              key  (const char*)  — form parameter key, e.g. "sa"
 *              text (const char*)  — value to put in it; NULL or ""
 *                                    clears the field
 * Output:      void
 * Description: Finds the parameter by key and sets its entry text.
 *              Keys the form doesn't have are ignored.
 **************************************************************/
static void set_field(LookupJob *job, const char *key, const char *text)
{
    int i;

    for (i = 0; i < job->desc->n_params; i++)
    {
        if (strcmp(job->desc->params[i].key, key) != 0) continue;
        if (job->widgets[i] && GTK_IS_EDITABLE(job->widgets[i]))
            gtk_editable_set_text(GTK_EDITABLE(job->widgets[i]), text ? text : "");
        return;
    }
}

/*************************************************************
 * Function:    member_string
 * Input:       obj (JsonObject*), name (const char*)
 * Output:      const char* — the member as text, or NULL if absent
 *              or JSON null.  JPL sends numbers as strings, so this
 *              is all that's needed.
 **************************************************************/
static const char *member_string(JsonObject *obj, const char *name)
{
    JsonNode *node;

    if (!obj || !json_object_has_member(obj, name)) return NULL;
    node = json_object_get_member(obj, name);
    if (!JSON_NODE_HOLDS_VALUE(node)) return NULL;
    return json_node_get_string(node);
}

/*************************************************************
 * Function:    apply_reply
 * Input:       job   (LookupJob*)    — the form to fill
 *              bytes (GBytes*)       — JPL's JSON reply
 * Output:      gboolean — TRUE if the form was filled
 * Description: Reads the reply and fills every element, sigma and
 *              the epoch.  All six elements must be present, or
 *              nothing is changed: half an orbit is worse than none,
 *              since it would quietly mix two asteroids together.
 **************************************************************/
static gboolean apply_reply(LookupJob *job, GBytes *bytes)
{
    JsonParser *parser = json_parser_new();
    JsonObject *root, *orbit, *object, *el;
    JsonArray  *elements;
    const char *value[N_ELEMENTS] = { NULL };
    const char *sigma[N_ELEMENTS] = { NULL };
    const char *name, *epoch, *fullname, *solnDate;
    gsize       len;
    const char *data = g_bytes_get_data(bytes, &len);
    guint       i;
    int         k;
    char        msg[320];

    if (!json_parser_load_from_data(parser, data, (gssize)len, NULL) ||
        !JSON_NODE_HOLDS_OBJECT(json_parser_get_root(parser)))
    {
        app_status_set("NASA JPL sent back something unreadable — try again later");
        g_object_unref(parser);
        return FALSE;
    }

    /* ── the parts we need: object (who) and orbit (the numbers) ── */
    root   = json_node_get_object(json_parser_get_root(parser));
    object = json_object_has_member(root, "object")
             ? json_object_get_object_member(root, "object") : NULL;
    orbit  = json_object_has_member(root, "orbit")
             ? json_object_get_object_member(root, "orbit")  : NULL;
    if (!orbit || !json_object_has_member(orbit, "elements"))
    {
        /* JPL explains itself in "message" when it can't help */
        snprintf(msg, sizeof(msg), "NASA JPL has no orbit for %s%s%s",
                 known[job->index].query,
                 member_string(root, "message") ? " — " : "",
                 member_string(root, "message") ? member_string(root, "message") : "");
        app_status_set("%s", msg);
        g_object_unref(parser);
        return FALSE;
    }

    /* ── pick out the six elements we use, by name ── */
    elements = json_object_get_array_member(orbit, "elements");
    for (i = 0; i < json_array_get_length(elements); i++)
    {
        el   = json_array_get_object_element(elements, i);
        name = member_string(el, "name");
        if (!name) continue;
        for (k = 0; k < N_ELEMENTS; k++)
            if (strcmp(name, element_map[k][0]) == 0)
            {
                value[k] = member_string(el, "value");
                sigma[k] = member_string(el, "sigma");
            }
    }
    epoch = member_string(orbit, "epoch");

    for (k = 0; k < N_ELEMENTS; k++)
        if (!value[k]) break;
    if (k < N_ELEMENTS || !epoch)
    {
        app_status_set("NASA JPL's orbit for %s is missing some numbers — not loaded",
                       known[job->index].query);
        g_object_unref(parser);
        return FALSE;
    }

    /* ── into the form.  A missing sigma clears its field, so a
          leftover from the previous asteroid can't sneak in ── */
    for (k = 0; k < N_ELEMENTS; k++)
    {
        set_field(job, element_map[k][1], value[k]);
        set_field(job, element_map[k][2], sigma[k]);
    }
    set_field(job, "epoch", epoch);

    /* ── say what arrived, in the status bar and the output panel ── */
    fullname = member_string(object, "fullname");
    solnDate = member_string(orbit, "soln_date");
    snprintf(msg, sizeof(msg),
             "Loaded %s from NASA JPL — orbit worked out %s, numbers apply from JD %s\n",
             fullname ? fullname : known[job->index].query,
             solnDate ? solnDate : "(date not given)", epoch);
    app_output_append(msg);
    app_status_set("Loaded %s — press Run or Plot",
                   fullname ? fullname : known[job->index].query);

    g_object_unref(parser);
    return TRUE;
}

/* ═══════════════════════════════════════════════════════════
   DOWNLOAD
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    on_downloaded
 * Input:       source (GObject*)      — the SoupSession
 *              res    (GAsyncResult*) — the finished request
 *              data   (gpointer)      — LookupJob*
 * Output:      void
 * Description: Back on the main thread with JPL's answer (or the
 *              lack of one).  Re-enables the picker, fills the form
 *              if it still exists, and frees the job.
 **************************************************************/
static void on_downloaded(GObject *source, GAsyncResult *res, gpointer data)
{
    LookupJob   *job   = (LookupJob *)data;
    GError      *err   = NULL;
    GBytes      *bytes = soup_session_send_and_read_finish(SOUP_SESSION(source), res, &err);
    SoupMessage *msg   = soup_session_get_async_result_message(SOUP_SESSION(source), res);
    guint        code  = msg ? soup_message_get_status(msg) : 0;

    /* the form was swapped out while we waited — nothing to fill */
    if (!job->drop)
    {
        if (bytes) g_bytes_unref(bytes);
        g_clear_error(&err);
        g_free(job);
        return;
    }

    gtk_widget_set_sensitive(job->drop, TRUE);

    if (!bytes)
        app_status_set("Could not reach NASA JPL — check the internet connection");
    else if (code != SOUP_STATUS_OK)
        app_status_set("NASA JPL turned the request down (web error %u) — try again later", code);
    else
        apply_reply(job, bytes);

    if (bytes) g_bytes_unref(bytes);
    g_clear_error(&err);
    g_object_remove_weak_pointer(G_OBJECT(job->drop), (gpointer *)&job->drop);
    g_free(job);
}

/*************************************************************
 * Function:    on_picked
 * Input:       drop  (GObject*)    — the drop-down
 *              pspec (GParamSpec*) — unused ("selected" changed)
 *              data  (gpointer)    — LookupJob template: desc + widgets
 * Output:      void
 * Description: A name was picked: start the download.  Entry 0 is
 *              the "Choose…" prompt and does nothing.  The picker is
 *              greyed out until JPL answers, so two downloads can't
 *              race to fill the same fields.
 **************************************************************/
static void on_picked(GObject *drop, GParamSpec *pspec, gpointer data)
{
    LookupJob   *tmpl = (LookupJob *)data;
    guint        sel  = gtk_drop_down_get_selected(GTK_DROP_DOWN(drop));
    LookupJob   *job;
    SoupMessage *msg;
    char        *escaped;
    char        *url;

    (void)pspec;
    if (sel == 0 || sel == GTK_INVALID_LIST_POSITION || (int)sel > N_KNOWN) return;

    job          = g_new0(LookupJob, 1);
    job->drop    = GTK_WIDGET(drop);
    job->desc    = tmpl->desc;
    job->widgets = tmpl->widgets;
    job->index   = (int)sel - 1;               /* entry 0 is the prompt */
    g_object_add_weak_pointer(drop, (gpointer *)&job->drop);

    if (!session)
    {
        session = soup_session_new();
        soup_session_set_timeout(session, 20);   /* seconds; JPL is quick or down */
        soup_session_set_user_agent(session, "Mathrix/" MATHRIX_VERSION);
    }

    /* "2024 YR4" has a space in it, which a URL does not */
    escaped = g_uri_escape_string(known[job->index].query, NULL, FALSE);
    url     = g_strconcat(JPL_SBDB_URL, escaped, NULL);
    msg     = soup_message_new("GET", url);
    g_free(escaped);
    g_free(url);

    gtk_widget_set_sensitive(job->drop, FALSE);
    app_status_set("Downloading %s from NASA JPL …", known[job->index].query);

    soup_session_send_and_read_async(session, msg, G_PRIORITY_DEFAULT, NULL,
                                     on_downloaded, job);
    g_object_unref(msg);
}

/*************************************************************
 * Function:    free_template
 * Description: Frees the picker's LookupJob template when its
 *              drop-down is destroyed (signal closure notify).
 **************************************************************/
static void free_template(gpointer data, GClosure *closure)
{
    (void)closure;
    g_free(data);
}

/* ═══════════════════════════════════════════════════════════
   PICKER COLOURS
   The form pane greys every label in it, and drop-downs elsewhere
   are cream — together that made this one grey-on-white.  The
   picker gets the dark look of the form's own entry boxes instead:
   light text on the dark field colour, a dark list, and the blue
   hover the menus use.  Scoped to the "asteroid-picker" class, so
   no other drop-down changes.
   ═══════════════════════════════════════════════════════════ */

static const char *PICKER_CSS =
    /* closed face — matches the form's entry boxes */
    "dropdown.asteroid-picker,"
    "dropdown.asteroid-picker > button {"
    "  background: " MX_CRUST ";"
    "  border-radius: 5px;"
    "}"
    "dropdown.asteroid-picker {"
    "  border: 1px solid " MX_SURFACE1 ";"
    "}"
    "dropdown.asteroid-picker > button:hover {"
    "  background: " MX_SURFACE0 ";"
    "}"
    "dropdown.asteroid-picker label,"
    "dropdown.asteroid-picker arrow {"
    "  color: " MX_TEXT ";"
    "}"
    /* the open list */
    "dropdown.asteroid-picker popover > contents,"
    "dropdown.asteroid-picker popover listview {"
    "  background: " MX_MANTLE ";"
    "  border-color: " MX_SURFACE1 ";"
    "}"
    "dropdown.asteroid-picker popover listview > row label {"
    "  color: " MX_TEXT ";"
    "}"
    "dropdown.asteroid-picker popover listview > row:hover,"
    "dropdown.asteroid-picker popover listview > row:selected {"
    "  background: " MX_SURFACE0 ";"
    "}"
    "dropdown.asteroid-picker popover listview > row:hover label,"
    "dropdown.asteroid-picker popover listview > row:selected label {"
    "  color: " MX_BLUE ";"
    "}";

/*************************************************************
 * Function:    install_picker_css
 * Input:       w (GtkWidget*) — any widget on the display
 * Output:      void
 * Description: Adds PICKER_CSS once per run, one notch above the
 *              main stylesheet's priority so its rules win over the
 *              form pane's grey labels and the cream drop-down list.
 **************************************************************/
static void install_picker_css(GtkWidget *w)
{
    static gboolean done = FALSE;
    GtkCssProvider *css;

    if (done) return;
    css = gtk_css_provider_new();
    gtk_css_provider_load_from_string(css, PICKER_CSS);
    gtk_style_context_add_provider_for_display(
        gtk_widget_get_display(w), GTK_STYLE_PROVIDER(css),
        GTK_STYLE_PROVIDER_PRIORITY_APPLICATION + 1);
    g_object_unref(css);
    done = TRUE;
}

/* ═══════════════════════════════════════════════════════════
   DROP-DOWN FACE
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    on_face_setup / on_face_bind
 * Description: Item factory for the CLOSED drop-down only: a label
 *              that ends in "…" past about 24 characters.  Without
 *              it the drop-down asks to be as wide as its longest
 *              entry, and the form pane obligingly doubles in width.
 *              The open list keeps the full descriptions.
 **************************************************************/
static void on_face_setup(GtkSignalListItemFactory *f, GtkListItem *item, gpointer d)
{
    GtkWidget *lbl = gtk_label_new(NULL);

    (void)f;
    (void)d;
    gtk_label_set_xalign(GTK_LABEL(lbl), 0.0f);
    gtk_label_set_ellipsize(GTK_LABEL(lbl), PANGO_ELLIPSIZE_END);
    gtk_label_set_width_chars(GTK_LABEL(lbl), 24);
    gtk_label_set_max_width_chars(GTK_LABEL(lbl), 24);
    gtk_list_item_set_child(item, lbl);
}

/*************************************************************
 * Function:    on_rows_setup
 * Description: Item factory for the OPEN list: plain full-width
 *              labels, so every description reads in full.
 **************************************************************/
static void on_rows_setup(GtkSignalListItemFactory *f, GtkListItem *item, gpointer d)
{
    GtkWidget *lbl = gtk_label_new(NULL);

    (void)f;
    (void)d;
    gtk_label_set_xalign(GTK_LABEL(lbl), 0.0f);
    gtk_list_item_set_child(item, lbl);
}

static void on_face_bind(GtkSignalListItemFactory *f, GtkListItem *item, gpointer d)
{
    GtkStringObject *str = GTK_STRING_OBJECT(gtk_list_item_get_item(item));

    (void)f;
    (void)d;
    gtk_label_set_text(GTK_LABEL(gtk_list_item_get_child(item)),
                       gtk_string_object_get_string(str));
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC — asteroid_lookup_row
   ═══════════════════════════════════════════════════════════ */

GtkWidget *asteroid_lookup_row(const ModuleDesc *desc, GtkWidget **widgets)
{
    GtkWidget     *row  = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    GtkWidget     *lbl  = gtk_label_new("Known asteroid");
    GtkStringList *list = gtk_string_list_new(NULL);
    GtkWidget     *drop;
    GtkListItemFactory *face = gtk_signal_list_item_factory_new();
    GtkListItemFactory *rows = gtk_signal_list_item_factory_new();
    LookupJob     *tmpl = g_new0(LookupJob, 1);
    int            k;

    /* entry 0 is a prompt, not an asteroid */
    gtk_string_list_append(list, "Choose one to download its orbit…");
    for (k = 0; k < N_KNOWN; k++)
        gtk_string_list_append(list, known[k].label);

    drop = gtk_drop_down_new(G_LIST_MODEL(list), NULL);

    /* short face when closed, full text in the open list */
    g_signal_connect(face, "setup", G_CALLBACK(on_face_setup), NULL);
    g_signal_connect(face, "bind",  G_CALLBACK(on_face_bind),  NULL);
    gtk_drop_down_set_factory(GTK_DROP_DOWN(drop), face);
    g_object_unref(face);

    g_signal_connect(rows, "setup", G_CALLBACK(on_rows_setup), NULL);
    g_signal_connect(rows, "bind",  G_CALLBACK(on_face_bind),  NULL);
    gtk_drop_down_set_list_factory(GTK_DROP_DOWN(drop), rows);
    g_object_unref(rows);
    gtk_drop_down_set_selected(GTK_DROP_DOWN(drop), 0);
    gtk_widget_set_hexpand(drop, TRUE);
    gtk_widget_add_css_class(drop, "asteroid-picker");
    install_picker_css(drop);
    gtk_widget_set_tooltip_text(drop,
        "Pick a well-known asteroid to fill in its latest orbit from NASA JPL");

    /* the template lives as long as the drop-down does */
    tmpl->desc    = desc;
    tmpl->widgets = widgets;
    g_signal_connect_data(drop, "notify::selected", G_CALLBACK(on_picked),
                          tmpl, free_template, 0);

    gtk_widget_set_margin_bottom(row, 10);
    gtk_box_append(GTK_BOX(row), lbl);
    gtk_box_append(GTK_BOX(row), drop);
    return row;
}
