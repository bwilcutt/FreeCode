#ifndef APP_STATE_H
#define APP_STATE_H

/*************************************************************
 * app_state.h — global application state for Mathrix
 *
 * Holds all shared runtime state in one place so that
 * main_gui.c, input_form.c, output_panel.c, and graph.c
 * can all access it without passing large argument lists.
 *
 * AppState is a singleton initialised in main_gui.c and
 * accessed everywhere via app_state_get().
 *************************************************************/

#include <gtk/gtk.h>
#include "module_desc.h"

#define MATHRIX_VERSION  "1.0.0"
#define PARSE_BINARY     "//usr//bin//parse"  // Parse should be in /usr/bin and in the path.
#define RESPONSE_BUFSIZE (65536)

/*************************************************************
 * Struct:      AppState
 * Description: All runtime state for the Mathrix application.
 *
 *   window          — the main GtkWindow
 *   cmd_entry       — the command-line entry bar
 *   output_view     — GtkTextView showing raw parse output
 *   output_buf      — GtkTextBuffer backing output_view
 *   form_box        — container for the current input form
 *   status_bar      — status label at the bottom
 *   current_module  — descriptor of the active module, or NULL
 *   parse_version   — version string returned by parse
 *   response_buf    — scratch buffer for pipe_recv responses
 *************************************************************/
typedef struct
{
    GtkWidget        *window;
    GtkWidget        *cmd_entry;
    GtkWidget        *output_view;
    GtkTextBuffer    *output_buf;
    GtkWidget        *form_box;
    GtkWidget        *status_bar;
    const ModuleDesc *current_module;
    char              parse_version[32];
    char              response_buf[RESPONSE_BUFSIZE];
} AppState;

/*************************************************************
 * Function:    app_state_get
 * Input:       void
 * Output:      AppState* — pointer to the singleton instance
 * Description: Returns the global AppState.  Initialised once
 *              at startup; safe to call from any module.
 *************************************************************/
AppState *app_state_get(void);

/*************************************************************
 * Function:    app_state_init
 * Input:       void
 * Output:      void
 * Description: Zero-initialises the singleton.  Called once
 *              at the start of main().
 *************************************************************/
void app_state_init(void);

/*************************************************************
 * Function:    app_status_set
 * Input:       fmt (const char*) — printf-style format string
 *              ... — variadic arguments
 * Output:      void
 * Description: Formats and displays a message in the status
 *              bar at the bottom of the main window.
 *************************************************************/
void app_status_set(const char *fmt, ...);

/*************************************************************
 * Function:    app_output_append
 * Input:       text (const char*) — text to append
 * Output:      void
 * Description: Appends text to the output panel text view
 *              and scrolls to the end.
 *************************************************************/
void app_output_append(const char *text);

/*************************************************************
 * Function:    app_output_clear
 * Input:       void
 * Output:      void
 * Description: Clears the output panel text view.
 *************************************************************/
void app_output_clear(void);

#endif /* APP_STATE_H */
