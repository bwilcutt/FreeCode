/* =============================================================================
 * File:         asteroid_lookup.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  "Known asteroid" picker for the Asteroid Impact Screening form.
 *
 *               A drop-down of well-known asteroids sits above the form's
 *               fields.  Picking one downloads that asteroid's latest orbit
 *               from the NASA/JPL Small-Body Database (ssd-api.jpl.nasa.gov)
 *               and fills in the orbital elements, their 1-sigma
 *               uncertainties and the epoch, ready for Run or Plot.  Nothing
 *               is calculated here and parse is never involved — this file
 *               only fetches numbers and types them into the form for you.
 *
 *               Needs libsoup-3.0 (the download) and json-glib-1.0 (reading
 *               JPL's reply).
 * ============================================================================= */

#ifndef ASTEROID_LOOKUP_H
#define ASTEROID_LOOKUP_H

#include <gtk/gtk.h>
#include "module_desc.h"

/*************************************************************
 * Function:    asteroid_lookup_row
 * Input:       desc    (const ModuleDesc*) — the asteroid module
 *              widgets (GtkWidget**)       — the form's input widgets,
 *                        parallel to desc->params[]; may still be
 *                        empty when this is called, they are only
 *                        read once a download finishes
 * Output:      GtkWidget* — a row (label + drop-down) for the caller
 *              to append to the form, above the parameter grid
 * Description: Builds the picker.  Choosing an asteroid starts the
 *              download; when JPL answers, the matching fields are
 *              filled in and the status bar says what was loaded.
 *              If the form has been swapped for another module by
 *              then, the answer is quietly dropped.
 *************************************************************/
GtkWidget *asteroid_lookup_row(const ModuleDesc *desc, GtkWidget **widgets);

#endif /* ASTEROID_LOOKUP_H */
