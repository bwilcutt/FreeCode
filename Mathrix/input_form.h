#ifndef INPUT_FORM_H
#define INPUT_FORM_H

/*************************************************************
 * input_form.h — auto-built input form from ModuleDesc
 *
 * Provides input_form_load() which clears the left pane and
 * rebuilds it entirely from a ModuleDesc descriptor.  Each
 * parameter becomes one labelled row containing either:
 *   PT_SCALAR  — GtkEntry accepting any parse expression
 *   PT_STRING  — GtkEntry accepting text
 *   PT_CHOICE  — GtkDropDown with the descriptor's choices[]
 *   PT_FLAG    — GtkCheckButton
 *
 * At the bottom of the form, a Run button assembles the
 * command via md_build_command() and sends it to parse.
 * If the module has has_plot set, a Plot button also appears
 * which opens an autonomous graph window via graph.c.
 *
 * All widget pointers for the current form are stored in the
 * static FormState inside input_form.c — there is only ever
 * one active form at a time.
 *************************************************************/

#include <gtk/gtk.h>
#include "module_desc.h"

/*************************************************************
 * Function:    input_form_load
 * Input:       desc    (const ModuleDesc*) — module to load
 *              form_box (GtkWidget*)       — the left-pane box
 *                         to clear and rebuild
 * Output:      void
 * Description: Removes all existing children from form_box,
 *              then builds a complete input form for desc.
 *              Stores widget pointers internally so that the
 *              Run and Plot handlers can read field values.
 *************************************************************/
void input_form_load(const ModuleDesc *desc, GtkWidget *form_box);

/*************************************************************
 * Function:    input_form_run
 * Input:       void
 * Output:      void
 * Description: Reads the current field values, builds the
 *              parse command via md_build_command(), sends it
 *              via pipe_transact(), and appends the response
 *              to the output panel.  Called by the Run button
 *              and also callable programmatically.
 *************************************************************/
void input_form_run(void);

/*************************************************************
 * Function:    input_form_plot
 * Input:       void
 * Output:      void
 * Description: Calls input_form_run() to ensure fresh output
 *              variables are stored, then opens an autonomous
 *              graph window via graph_window_open() for the
 *              current module's plot variables.
 *************************************************************/
void input_form_plot(void);

/*************************************************************
 * Function:    input_form_sync
 * Input:       void
 * Output:      void
 * Description: Reads the stored parse variables for the active
 *              module and populates the input form fields with
 *              their current values.  Called from main_gui.c
 *              after a command bar command runs, so that the
 *              form always reflects the last computation
 *              regardless of whether it was run from the form
 *              or the command bar.
 *
 *              For each parameter, queries parse for:
 *                $<command>_<key>   e.g. $reynolds_V
 *              Special cases:
 *                PT_CHOICE — matches the returned string against
 *                            the choices[] list and selects it
 *                PT_FLAG   — skipped (not a named parse variable)
 *                PT_STRING — sets entry text directly
 *              Parameters whose variable returns 0 or an error
 *              are left unchanged so default values are preserved.
 *************************************************************/
void input_form_sync(void);

#endif /* INPUT_FORM_H */
