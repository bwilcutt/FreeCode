#include "app_state.h"
#include <string.h>
#include <stdarg.h>
#include <stdio.h>

static AppState g_state;

/*************************************************************
 * Function:    app_state_get
 * Input:       void
 * Output:      AppState* — pointer to the singleton
 *************************************************************/
AppState *app_state_get(void)
{
    return &g_state;
}

/*************************************************************
 * Function:    app_state_init
 * Input:       void
 * Output:      void
 * Description: Zero-initialises the singleton at startup.
 *************************************************************/
void app_state_init(void)
{
    memset(&g_state, 0, sizeof(g_state));
}

/*************************************************************
 * Function:    app_status_set
 * Input:       fmt (const char*) — printf-style format string
 * Output:      void
 * Description: Formats a message and sets the status bar label.
 *************************************************************/
void app_status_set(const char *fmt, ...)
{
    char    buf[512];
    va_list ap;

    if (!g_state.status_bar) return;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);
    gtk_label_set_text(GTK_LABEL(g_state.status_bar), buf);
}

/*************************************************************
 * Function:    app_output_append
 * Input:       text (const char*) — text to append
 * Output:      void
 * Description: Appends text to the output view and scrolls
 *              to the end so the latest result is visible.
 *************************************************************/
void app_output_append(const char *text)
{
    GtkTextIter end;

    if (!g_state.output_buf) return;
    gtk_text_buffer_get_end_iter(g_state.output_buf, &end);
    gtk_text_buffer_insert(g_state.output_buf, &end, text, -1);

    /* scroll to end */
    gtk_text_buffer_get_end_iter(g_state.output_buf, &end);
    if (g_state.output_view)
    {
        GtkTextMark *mark = gtk_text_buffer_get_insert(g_state.output_buf);
        gtk_text_buffer_place_cursor(g_state.output_buf, &end);
        gtk_text_view_scroll_mark_onscreen(
            GTK_TEXT_VIEW(g_state.output_view), mark);
    }
}

/*************************************************************
 * Function:    app_output_clear
 * Input:       void
 * Output:      void
 * Description: Clears all text from the output view.
 *************************************************************/
void app_output_clear(void)
{
    if (!g_state.output_buf) return;
    gtk_text_buffer_set_text(g_state.output_buf, "", -1);
}
