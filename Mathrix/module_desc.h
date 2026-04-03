#ifndef MODULE_DESC_H
#define MODULE_DESC_H

#include <stddef.h>

/*************************************************************
 * module_desc.h — descriptor-driven module architecture
 *
 * Every physics/math command that parse understands is described
 * by a ModuleDesc struct.  The GUI reads the descriptor table at
 * startup and automatically builds:
 *   - Menu entries  (category → command name)
 *   - Input forms   (one field per ParamDesc)
 *   - Output panels (one row per OutputDesc)
 *   - Plot buttons  (when has_plot is non-zero)
 *
 * Adding a new algorithm to the GUI requires only:
 *   1. Add its .c/.h files to parse and implement run_xxx()
 *   2. Add a ModuleDesc entry to the descriptor table in
 *      module_desc.c — no other GUI code changes needed.
 *
 * File layout:
 *   module_desc.h   — type definitions (this file)
 *   module_desc.c   — the descriptor table and lookup helpers
 *************************************************************/

/* ═══════════════════════════════════════════════════════════
   LIMITS
   ═══════════════════════════════════════════════════════════ */

#define MD_MAX_PARAMS   16   /* maximum input parameters per module  */
#define MD_MAX_OUTPUTS  16   /* maximum output variables per module  */
#define MD_MAX_MODULES  64   /* maximum entries in the descriptor table */

/* ═══════════════════════════════════════════════════════════
   PARAMETER TYPES
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Enum:        ParamType
 * Description: Controls how the input form renders and validates
 *              each parameter field.
 *
 *   PT_SCALAR  — numeric expression field (accepts any parse
 *                scalar expression, e.g. "1/500" or "$r*2")
 *   PT_STRING  — text field for non-numeric values (e.g.
 *                solve=, type=, method=)
 *   PT_CHOICE  — drop-down list; choices[] holds the options
 *   PT_FLAG    — checkbox for boolean flags (e.g. units=us)
 *************************************************************/
typedef enum
{
    PT_SCALAR = 0,
    PT_STRING,
    PT_CHOICE,
    PT_FLAG
} ParamType;

/* ═══════════════════════════════════════════════════════════
   PLOT TYPES
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Enum:        PlotType
 * Description: Tells graph.c what kind of Cairo plot to draw
 *              when the user clicks the Plot button.
 *
 *   PLOT_NONE   — no plot available for this module
 *   PLOT_LINE   — XY line plot (PID sim output, CSV data)
 *   PLOT_STEM   — stem/bar plot (FFT magnitude spectrum)
 *   PLOT_XY     — scatter / two-variable XY (future use)
 *************************************************************/
typedef enum
{
    PLOT_NONE = 0,
    PLOT_LINE,
    PLOT_STEM,
    PLOT_XY,
    PLOT_MOHR,
    PLOT_BEAM,
    PLOT_STRESS
} PlotType;

/* ═══════════════════════════════════════════════════════════
   PARAMETER DESCRIPTOR
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      ParamDesc
 * Description: Describes one input parameter for a module.
 *
 *   key        — the keyword as parse expects it (e.g. "n", "R")
 *   label      — human-readable label shown in the form
 *                (e.g. "Manning's n", "Hydraulic radius")
 *   units      — unit string shown next to the field
 *                (e.g. "m", "m/s", "" for dimensionless)
 *   type       — controls rendering (see ParamType)
 *   choices    — NULL-terminated array of strings for PT_CHOICE;
 *                NULL for other types
 *   default_val— default value string pre-filled in the field;
 *                NULL or "" for no default
 *   required   — 1 if the parameter must be supplied, 0 if optional
 *   tooltip    — one-sentence description shown on hover;
 *                NULL for no tooltip
 *************************************************************/
typedef struct
{
    const char  *key;
    const char  *label;
    const char  *units;
    ParamType    type;
    const char **choices;      /* NULL-terminated, or NULL */
    const char  *default_val;  /* pre-filled value, or NULL */
    int          required;     /* 1 = must supply, 0 = optional */
    const char  *tooltip;
} ParamDesc;

/* ═══════════════════════════════════════════════════════════
   OUTPUT DESCRIPTOR
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      OutputDesc
 * Description: Describes one output variable produced by a module.
 *
 *   var_name   — the parse variable name without '$'
 *                (e.g. "manning_V", "Re", "fft_mag")
 *   label      — human-readable label (e.g. "Flow velocity")
 *   units      — unit string (e.g. "m/s", "" for dimensionless)
 *   is_vector  — 1 if the variable is a matrix/vector (plottable),
 *                0 if it is a scalar
 *   plot_role  — for modules with has_plot: which variable is the
 *                X axis ("x"), Y axis ("y"), or neither ("")
 *************************************************************/
typedef struct
{
    const char *var_name;
    const char *label;
    const char *units;
    int         is_vector;   /* 1 = matrix variable, 0 = scalar */
    const char *plot_role;   /* "x", "y", or "" */
} OutputDesc;

/* ═══════════════════════════════════════════════════════════
   MODULE DESCRIPTOR
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      ModuleDesc
 * Description: Complete descriptor for one parse command.
 *              The GUI iterates the global modules[] table of
 *              these structs to build all menus, forms, and
 *              output panels automatically.
 *
 *   command    — the parse command keyword (e.g. "manning")
 *   label      — display name in menus and form title
 *                (e.g. "Manning's Equation")
 *   category   — menu category (e.g. "Hydraulics",
 *                "Fluid Mechanics", "Signal Processing")
 *   description— one-line description shown in the form header
 *   params     — array of input parameter descriptors
 *   n_params   — number of entries in params[]
 *   outputs    — array of output variable descriptors
 *   n_outputs  — number of entries in outputs[]
 *   has_plot   — 1 if a Plot button should be shown
 *   plot_type  — type of plot to draw (see PlotType)
 *   plot_title — title shown in the autonomous graph window
 *                (e.g. "FFT Magnitude Spectrum")
 *************************************************************/
typedef struct
{
    const char       *command;
    const char       *label;
    const char       *category;
    const char       *description;
    const ParamDesc   params[MD_MAX_PARAMS];
    int               n_params;
    const OutputDesc  outputs[MD_MAX_OUTPUTS];
    int               n_outputs;
    int               has_plot;
    PlotType          plot_type;
    const char       *plot_title;
} ModuleDesc;

/* ═══════════════════════════════════════════════════════════
   GLOBAL TABLE AND HELPERS  (defined in module_desc.c)
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * modules[]   — the global descriptor table; all entries are
 *               defined in module_desc.c.  Terminated by an
 *               entry with command == NULL.
 *************************************************************/
extern const ModuleDesc modules[];

/*************************************************************
 * Function:    md_find
 * Input:       command (const char*) — parse command keyword
 * Output:      const ModuleDesc* — pointer to the descriptor,
 *              or NULL if not found
 * Description: Linear search through modules[] for a matching
 *              command string.
 *************************************************************/
const ModuleDesc *md_find(const char *command);

/*************************************************************
 * Function:    md_categories
 * Input:       cats     (const char**) — output array to fill
 *              max_cats (int)          — capacity of cats[]
 * Output:      int — number of unique categories found
 * Description: Walks modules[] and fills cats[] with the unique
 *              category strings in the order they first appear.
 *              Used by the GUI to build the menu bar.
 *************************************************************/
int md_categories(const char **cats, int max_cats);

/*************************************************************
 * Function:    md_in_category
 * Input:       category (const char*) — category name to match
 *              results  (const ModuleDesc**) — output array
 *              max      (int) — capacity of results[]
 * Output:      int — number of modules found in that category
 * Description: Fills results[] with pointers to all modules
 *              whose category matches the given string.
 *              Used to populate each category's submenu.
 *************************************************************/
int md_in_category(const char *category,
                   const ModuleDesc **results, int max);

/*************************************************************
 * Function:    md_build_command
 * Input:       desc     (const ModuleDesc*) — module descriptor
 *              values   (const char**)      — array of value
 *                         strings parallel to desc->params[]
 *              buf      (char*)             — output buffer
 *              buflen   (size_t)            — buffer capacity
 * Output:      int — 1 on success, 0 if buf was too small
 * Description: Assembles a complete parse command string from
 *              a descriptor and a set of user-supplied values.
 *              Skips parameters whose value string is NULL or
 *              empty (optional params the user left blank).
 *              Example output: "manning n=0.013 R=0.5 S=0.001\n"
 *************************************************************/
int md_build_command(const ModuleDesc *desc,
                     const char      **values,
                     char             *buf,
                     size_t            buflen);

#endif /* MODULE_DESC_H */
