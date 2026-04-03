#include "module_desc.h"
#include <string.h>
#include <stdio.h>

/* ═══════════════════════════════════════════════════════════
   CHOICE LISTS
   Shared option arrays referenced by PT_CHOICE parameters.
   ═══════════════════════════════════════════════════════════ */

static const char *units_choices[]      = { "si", "us", NULL };
static const char *beam_type_choices[]  = { "ss", "cant", NULL };
static const char *beam_load_choices[]  = { "point", "udl", NULL };
static const char *bern_solve_choices[] = { "P1","V1","z1","P2","V2","z2", NULL };
static const char *gas_solve_choices[]  = { "P", "V", "n", "T", NULL };
static const char *heat_solve_choices[] = { "Q", "m", "c", "dT", NULL };
static const char *pid_mode_choices[]   = { "sim", "step", "tune", "reset", NULL };
static const char *pid_type_choices[]   = { "PID", "PI", "P", NULL };
static const char *pid_method_choices[] = { "zn", "znol", "cc", NULL };

/* ═══════════════════════════════════════════════════════════
   DESCRIPTOR TABLE
   One entry per parse command.  Terminated by {NULL}.
   ═══════════════════════════════════════════════════════════ */

const ModuleDesc modules[] =
{
    /* ── Reynolds Number ───────────────────────────────────── */
    {
        "reynolds",
        "Reynolds Number",
        "Fluid Mechanics",
        "Calculates the Reynolds number to classify flow regime",
        {
            { "V",   "Velocity",          "m/s",    PT_SCALAR, NULL, NULL, 1,
              "Mean flow velocity" },
            { "D",   "Diameter",          "m",      PT_SCALAR, NULL, NULL, 1,
              "Pipe or channel diameter" },
            { "nu",  "Kinematic visc.",   "m²/s",   PT_SCALAR, NULL, NULL, 0,
              "Kinematic viscosity (use instead of rho+mu)" },
            { "rho", "Density",           "kg/m³",  PT_SCALAR, NULL, NULL, 0,
              "Fluid density (use with mu)" },
            { "mu",  "Dynamic visc.",     "Pa·s",   PT_SCALAR, NULL, NULL, 0,
              "Dynamic viscosity (use with rho)" },
        },
        5,
        {
            { "Re", "Reynolds number", "", 0, "" },
        },
        1,
        0, PLOT_NONE, NULL
    },

    /* ── Manning's Equation ────────────────────────────────── */
    {
        "manning",
        "Manning's Equation",
        "Hydraulics",
        "Open-channel flow velocity, discharge, and Froude number",
        {
            { "n",     "Manning's n",      "",    PT_SCALAR, NULL, NULL, 1,
              "Roughness coefficient" },
            { "R",     "Hydraulic radius", "m",   PT_SCALAR, NULL, NULL, 1,
              "Cross-sectional area / wetted perimeter" },
            { "S",     "Channel slope",    "m/m", PT_SCALAR, NULL, NULL, 1,
              "Longitudinal slope (e.g. 1/500)" },
            { "A",     "Flow area",        "m²",  PT_SCALAR, NULL, NULL, 0,
              "Cross-sectional flow area (required for Q and Fr)" },
            { "D",     "Hydraulic depth",  "m",   PT_SCALAR, NULL, NULL, 0,
              "Mean hydraulic depth A/T (required for Fr)" },
            { "units", "Unit system",      "",    PT_CHOICE, units_choices, "si", 0,
              "SI (m/s) or US customary (ft/s)" },
        },
        6,
        {
            { "manning_V",  "Velocity",      "m/s",  0, "" },
            { "manning_Q",  "Discharge",     "m³/s", 0, "" },
            { "manning_Fr", "Froude number", "",     0, "" },
        },
        3,
        0, PLOT_NONE, NULL
    },

    /* ── Darcy-Weisbach ────────────────────────────────────── */
    {
        "darcy",
        "Darcy-Weisbach",
        "Fluid Mechanics",
        "Pipe head loss and pressure drop using Darcy-Weisbach",
        {
            { "f",     "Friction factor", "",    PT_SCALAR, NULL, NULL, 1,
              "Darcy friction factor" },
            { "L",     "Pipe length",     "m",   PT_SCALAR, NULL, NULL, 1,
              "Length of pipe" },
            { "D",     "Diameter",        "m",   PT_SCALAR, NULL, NULL, 1,
              "Internal pipe diameter" },
            { "V",     "Velocity",        "m/s", PT_SCALAR, NULL, NULL, 1,
              "Mean flow velocity" },
            { "units", "Unit system",     "",    PT_CHOICE, units_choices, "si", 0,
              "SI or US customary" },
        },
        5,
        {
            { "darcy_hf",     "Head loss", "m",    0, "" },
            { "darcy_dP_rho", "ΔP/ρ",      "J/kg", 0, "" },
        },
        2,
        0, PLOT_NONE, NULL
    },

    /* ── Bernoulli ─────────────────────────────────────────── */
    {
        "bernoulli",
        "Bernoulli's Equation",
        "Fluid Mechanics",
        "Solve for any one Bernoulli variable given the others",
        {
            { "P1",    "Pressure 1",  "Pa",   PT_SCALAR, NULL, "0",    0,
              "Upstream pressure" },
            { "V1",    "Velocity 1",  "m/s",  PT_SCALAR, NULL, "0",    0,
              "Upstream velocity" },
            { "z1",    "Elevation 1", "m",    PT_SCALAR, NULL, "0",    0,
              "Upstream elevation" },
            { "P2",    "Pressure 2",  "Pa",   PT_SCALAR, NULL, "0",    0,
              "Downstream pressure" },
            { "V2",    "Velocity 2",  "m/s",  PT_SCALAR, NULL, "0",    0,
              "Downstream velocity" },
            { "z2",    "Elevation 2", "m",    PT_SCALAR, NULL, "0",    0,
              "Downstream elevation" },
            { "rho",   "Density",     "kg/m³",PT_SCALAR, NULL, "1000", 0,
              "Fluid density" },
            { "solve", "Solve for",   "",     PT_CHOICE, bern_solve_choices, "P2", 1,
              "Which variable to solve for" },
        },
        8,
        {
            { "bern_P1", "Pressure 1",  "Pa",  0, "" },
            { "bern_V1", "Velocity 1",  "m/s", 0, "" },
            { "bern_z1", "Elevation 1", "m",   0, "" },
            { "bern_P2", "Pressure 2",  "Pa",  0, "" },
            { "bern_V2", "Velocity 2",  "m/s", 0, "" },
            { "bern_z2", "Elevation 2", "m",   0, "" },
        },
        6,
        0, PLOT_NONE, NULL
    },

    /* ── Orifice Flow ──────────────────────────────────────── */
    {
        "orifice",
        "Orifice Flow",
        "Hydraulics",
        "Flow rate and velocity through a submerged orifice",
        {
            { "Cd",    "Discharge coeff", "",   PT_SCALAR, NULL, "0.61", 1,
              "Discharge coefficient (0.61 sharp-edged, 0.98 rounded)" },
            { "A",     "Orifice area",    "m²", PT_SCALAR, NULL, NULL,   1,
              "Cross-sectional area of the orifice" },
            { "h",     "Head",            "m",  PT_SCALAR, NULL, NULL,   1,
              "Driving head above orifice centreline" },
            { "units", "Unit system",     "",   PT_CHOICE, units_choices, "si", 0,
              "SI or US customary" },
        },
        4,
        {
            { "orifice_Q", "Flow rate", "m³/s", 0, "" },
            { "orifice_V", "Velocity",  "m/s",  0, "" },
        },
        2,
        0, PLOT_NONE, NULL
    },

    /* ── Beam Deflection ───────────────────────────────────── */
    {
        "beam",
        "Beam Deflection",
        "Structural",
        "Maximum deflection, moment, and reaction for simple beams",
        {
            { "type", "Support type",    "",    PT_CHOICE, beam_type_choices, "ss",    1,
              "ss = simply supported, cant = cantilever" },
            { "load", "Load type",       "",    PT_CHOICE, beam_load_choices, "point", 1,
              "point = point load, udl = uniformly distributed" },
            { "P",    "Point load",      "N",   PT_SCALAR, NULL, NULL,   0,
              "Applied point load (required for load=point)" },
            { "w",    "UDL intensity",   "N/m", PT_SCALAR, NULL, NULL,   0,
              "Distributed load intensity (required for load=udl)" },
            { "L",    "Span",            "m",   PT_SCALAR, NULL, NULL,   1,
              "Beam span length" },
            { "E",    "Young's modulus", "Pa",  PT_SCALAR, NULL, "200e9",1,
              "Modulus of elasticity" },
            { "I",    "Second moment",   "m⁴",  PT_SCALAR, NULL, NULL,   1,
              "Second moment of area" },
        },
        7,
        {
            { "beam_delta", "Max deflection", "m",   0, "" },
            { "beam_Mmax",  "Max moment",     "N·m", 0, "" },
            { "beam_R",     "Reaction",       "N",   0, "" },
        },
        3,
        1, PLOT_BEAM, "Beam Deflection Diagram"
    },

    /* ── Stress / Strain ───────────────────────────────────── */
    {
        "stress",
        "Axial Stress / Strain",
        "Structural",
        "Axial stress, strain, and deformation for a member",
        {
            { "F", "Axial force",     "N",  PT_SCALAR, NULL, NULL, 1,
              "Applied axial force (positive = tension)" },
            { "A", "Cross-section",   "m²", PT_SCALAR, NULL, NULL, 1,
              "Cross-sectional area" },
            { "E", "Young's modulus", "Pa", PT_SCALAR, NULL, NULL, 0,
              "Modulus of elasticity (required for strain)" },
            { "L", "Member length",   "m",  PT_SCALAR, NULL, NULL, 0,
              "Length (required for deformation)" },
        },
        4,
        {
            { "stress_sigma", "Stress",      "Pa", 0, "" },
            { "stress_eps",   "Strain",      "",   0, "" },
            { "stress_delta", "Deformation", "m",  0, "" },
        },
        3,
        1, PLOT_STRESS, "Axial Stress / Strain"
    },

    /* ── Mohr's Circle ─────────────────────────────────────── */
    {
        "mohrs",
        "Mohr's Circle",
        "Structural",
        "Principal stresses and max shear from a 2-D stress state",
        {
            { "sx",  "σx — normal stress", "Pa", PT_SCALAR, NULL, NULL, 1,
              "Normal stress on x-face" },
            { "sy",  "σy — normal stress", "Pa", PT_SCALAR, NULL, NULL, 1,
              "Normal stress on y-face" },
            { "txy", "τxy — shear stress", "Pa", PT_SCALAR, NULL, NULL, 1,
              "Shear stress on x-face" },
        },
        3,
        {
            { "mohrs_s1",    "Principal σ1", "Pa",  0, "" },
            { "mohrs_s2",    "Principal σ2", "Pa",  0, "" },
            { "mohrs_tmax",  "Max shear",    "Pa",  0, "" },
            { "mohrs_theta", "Angle θp",     "deg", 0, "" },
        },
        4,
        1, PLOT_MOHR, "Mohr's Circle"
    },

    /* ── Ideal Gas Law ─────────────────────────────────────── */
    {
        "idealgas",
        "Ideal Gas Law",
        "Thermodynamics",
        "Solve for any ideal gas variable  PV = nRT",
        {
            { "P",     "Pressure",    "Pa",  PT_SCALAR, NULL, "0", 0,
              "Absolute pressure" },
            { "V",     "Volume",      "m³",  PT_SCALAR, NULL, "0", 0,
              "Volume of gas" },
            { "n",     "Moles",       "mol", PT_SCALAR, NULL, "0", 0,
              "Amount of substance" },
            { "T",     "Temperature", "K",   PT_SCALAR, NULL, "0", 0,
              "Absolute temperature" },
            { "solve", "Solve for",   "",    PT_CHOICE, gas_solve_choices, "P", 1,
              "Which variable to solve for" },
            { "units", "Unit system", "",    PT_CHOICE, units_choices, "si", 0,
              "SI or US customary" },
        },
        6,
        {
            { "gas_P", "Pressure",    "Pa",  0, "" },
            { "gas_V", "Volume",      "m³",  0, "" },
            { "gas_n", "Moles",       "mol", 0, "" },
            { "gas_T", "Temperature", "K",   0, "" },
        },
        4,
        0, PLOT_NONE, NULL
    },

    /* ── Heat Conduction ───────────────────────────────────── */
    {
        "conduction",
        "Heat Conduction",
        "Thermodynamics",
        "Fourier's Law: steady-state conduction through a slab",
        {
            { "k",     "Conductivity",    "W/m·K", PT_SCALAR, NULL, NULL, 1,
              "Thermal conductivity of the material" },
            { "A",     "Area",            "m²",    PT_SCALAR, NULL, NULL, 1,
              "Cross-sectional area perpendicular to heat flow" },
            { "dT",    "Temp difference", "K",     PT_SCALAR, NULL, NULL, 1,
              "Temperature difference across the slab" },
            { "L",     "Thickness",       "m",     PT_SCALAR, NULL, NULL, 1,
              "Slab thickness in direction of heat flow" },
            { "units", "Unit system",     "",      PT_CHOICE, units_choices, "si", 0,
              "SI or US customary" },
        },
        5,
        {
            { "cond_Q",    "Heat flow rate", "W",    0, "" },
            { "cond_flux", "Heat flux",      "W/m²", 0, "" },
            { "cond_Rth",  "Thermal resist", "K/W",  0, "" },
        },
        3,
        0, PLOT_NONE, NULL
    },

    /* ── Specific Heat ─────────────────────────────────────── */
    {
        "specificheat",
        "Specific Heat",
        "Thermodynamics",
        "Q = m·c·ΔT — solve for any variable",
        {
            { "m",     "Mass",         "kg",     PT_SCALAR, NULL, "0", 0,
              "Mass of the substance" },
            { "c",     "Specific heat","J/kg·K", PT_SCALAR, NULL, "0", 0,
              "Specific heat capacity" },
            { "dT",    "Temp change",  "K",      PT_SCALAR, NULL, "0", 0,
              "Temperature change" },
            { "Q",     "Heat energy",  "J",      PT_SCALAR, NULL, "0", 0,
              "Heat transferred (leave 0 when solving for Q)" },
            { "solve", "Solve for",   "",        PT_CHOICE, heat_solve_choices, "Q", 1,
              "Which variable to solve for" },
        },
        5,
        {
            { "heat_Q",  "Heat energy",  "J",      0, "" },
            { "heat_m",  "Mass",         "kg",     0, "" },
            { "heat_c",  "Specific heat","J/kg·K", 0, "" },
            { "heat_dT", "Temp change",  "K",      0, "" },
        },
        4,
        0, PLOT_NONE, NULL
    },

    /* ── PID Controller ────────────────────────────────────── */
    {
        "pid",
        "PID Controller",
        "Control Systems",
        "PID step, simulation, tuning, and reset",
        {
            /* index 0 — mode (positional, default sim) */
            { "mode",   "Mode",            "",  PT_CHOICE, pid_mode_choices,   "sim", 1,
              "sim=simulation, step=single step, tune=auto-tune, reset=clear" },
            /* index 1-6 — common params */
            { "Kp",     "Kp",              "",  PT_SCALAR, NULL, "1",   0,
              "Proportional gain" },
            { "Ki",     "Ki",              "",  PT_SCALAR, NULL, "0",   0,
              "Integral gain" },
            { "Kd",     "Kd",              "",  PT_SCALAR, NULL, "0",   0,
              "Derivative gain" },
            { "sp",     "Setpoint",        "",  PT_SCALAR, NULL, "1",   0,
              "Desired setpoint" },
            { "pv",     "Process var",     "",  PT_SCALAR, NULL, "0",   0,
              "Current process variable (step mode only)" },
            { "dt",     "Time step",       "s", PT_SCALAR, NULL, "0.1", 0,
              "Time step" },
            /* index 7-9 — sim-only params */
            { "pv0",    "Initial PV",      "",  PT_SCALAR, NULL, "0",   0,
              "Initial process variable (sim mode)" },
            { "n",      "Steps",           "",  PT_SCALAR, NULL, "100", 0,
              "Number of simulation steps (sim mode)" },
            { "gain",   "Plant gain",      "",  PT_SCALAR, NULL, "1",   0,
              "Plant gain K (sim mode)" },
            { "tau",    "Plant tau",       "s", PT_SCALAR, NULL, "1",   0,
              "Plant time constant (sim mode)" },
            /* index 11-12 — tune-only params */
            { "method", "Tune method",     "",  PT_CHOICE, pid_method_choices, "zn", 0,
              "zn=Ziegler-Nichols, znol=ZN open-loop, cc=Cohen-Coon" },
            { "type",   "Controller type", "",  PT_CHOICE, pid_type_choices,   "PID",0,
              "P, PI, or PID controller" },
        },
        13,
        {
            { "pid_out",      "Output",          "", 0, ""  },
            { "pid_error",    "Error",           "", 0, ""  },
            { "pid_integral", "Integral",        "", 0, ""  },
            { "pid_pv",       "Process var",     "", 0, ""  },
            { "pid_Kp",       "Tuned Kp",        "", 0, ""  },
            { "pid_Ki",       "Tuned Ki",        "", 0, ""  },
            { "pid_Kd",       "Tuned Kd",        "", 0, ""  },
            { "pid_pv_vec",   "PV time series",  "", 1, "y" },
            { "pid_out_vec",  "Output series",   "", 1, ""  },
        },
        9,
        1, PLOT_LINE, "PID Simulation — Process Variable"
    },

    /* ── Load CSV ──────────────────────────────────────────── */
    {
        "load",
        "Load CSV",
        "Signal Processing",
        "Load a column from a CSV file into a matrix variable",
        {
            { "file", "CSV filename",  "",  PT_STRING, NULL, NULL,     1,
              "Path to the CSV file" },
            { "col",  "Column number", "",  PT_SCALAR, NULL, "1",      0,
              "1-based column index to load" },
            { "var",  "Variable name", "",  PT_STRING, NULL, "signal", 0,
              "Name of the matrix variable to store the data in" },
        },
        3,
        {
            { "signal", "Loaded data", "", 1, "y" },
        },
        1,
        1, PLOT_LINE, "CSV Data"
    },

    /* ── FFT ───────────────────────────────────────────────── */
    {
        "fft",
        "FFT",
        "Signal Processing",
        "Cooley-Tukey radix-2 FFT of a column-vector variable",
        {
            { "var",    "Source variable", "", PT_STRING, NULL, "signal", 1,
              "Matrix variable holding the input signal (without $)" },
            { "prefix", "Output prefix",   "", PT_STRING, NULL, "fft",   0,
              "Prefix for output variables (_re, _im, _mag, _phase)" },
        },
        2,
        {
            { "fft_re",    "Real part",  "", 1, ""  },
            { "fft_im",    "Imaginary",  "", 1, ""  },
            { "fft_mag",   "Magnitude",  "", 1, "y" },
            { "fft_phase", "Phase",      "", 1, ""  },
        },
        4,
        1, PLOT_STEM, "FFT Magnitude Spectrum"
    },

    /* ── IFFT ──────────────────────────────────────────────── */
    {
        "ifft",
        "Inverse FFT",
        "Signal Processing",
        "Inverse FFT from real and imaginary column-vector variables",
        {
            { "re_var", "Real variable", "", PT_STRING, NULL, "fft_re", 1,
              "Matrix variable holding the real part (without $)" },
            { "im_var", "Imag variable", "", PT_STRING, NULL, "fft_im", 1,
              "Matrix variable holding the imaginary part (without $)" },
            { "prefix", "Output prefix", "", PT_STRING, NULL, "ifft",   0,
              "Prefix for the output variable (_out)" },
        },
        3,
        {
            { "ifft_out", "Recovered signal", "", 1, "y" },
        },
        1,
        1, PLOT_LINE, "IFFT — Recovered Signal"
    },

    /* ── terminator ─────────────────────────────────────────── */
    { NULL }
};

/* ═══════════════════════════════════════════════════════════
   HELPER IMPLEMENTATIONS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    md_find
 * Input:       command (const char*) — parse command keyword
 * Output:      const ModuleDesc* — matching descriptor or NULL
 * Description: Linear search through modules[].
 *************************************************************/
const ModuleDesc *md_find(const char *command)
{
    const ModuleDesc *m;
    for (m = modules; m->command; m++)
        if (strcmp(m->command, command) == 0) return m;
    return NULL;
}

/*************************************************************
 * Function:    md_categories
 * Input:       cats     (const char**) — array to fill
 *              max_cats (int)          — capacity of cats[]
 * Output:      int — number of unique categories found
 * Description: Walks modules[] collecting unique category
 *              strings in first-seen order.
 *************************************************************/
int md_categories(const char **cats, int max_cats)
{
    const ModuleDesc *m;
    int               count = 0;
    int               i;
    int               found;

    for (m = modules; m->command && count < max_cats; m++)
    {
        found = 0;
        for (i = 0; i < count; i++)
            if (strcmp(cats[i], m->category) == 0) { found = 1; break; }
        if (!found) cats[count++] = m->category;
    }
    return count;
}

/*************************************************************
 * Function:    md_in_category
 * Input:       category (const char*)        — category to match
 *              results  (const ModuleDesc**) — array to fill
 *              max      (int)                — capacity of results[]
 * Output:      int — number of modules found
 * Description: Fills results[] with modules matching category.
 *************************************************************/
int md_in_category(const char *category,
                   const ModuleDesc **results, int max)
{
    const ModuleDesc *m;
    int               count = 0;

    for (m = modules; m->command && count < max; m++)
        if (strcmp(m->category, category) == 0)
            results[count++] = m;
    return count;
}

/*************************************************************
 * Function:    md_build_command
 * Input:       desc   (const ModuleDesc*) — module descriptor
 *              values (const char**)      — value per param
 *              buf    (char*)             — output buffer
 *              buflen (size_t)            — buffer capacity
 * Output:      int — 1 on success, 0 if buf too small
 * Description: Builds a complete parse command string.
 *              Special handling:
 *                - "load" uses positional filename before key=val
 *                - "fft"/"ifft" use bare variable name
 *                - "pid" prepends the mode choice and filters
 *                  mode-specific parameters so that sim-only
 *                  params are omitted in step mode, and
 *                  tune-only params are omitted in sim/step mode.
 *              All other commands use standard key=value pairs.
 *************************************************************/
int md_build_command(const ModuleDesc  *desc,
                     const char       **values,
                     char              *buf,
                     size_t             buflen)
{
    int         i;
    size_t      pos = 0;
    int         n;
    const char *mode;

    /* command name */
    n = snprintf(buf + pos, buflen - pos, "%s", desc->command);
    if (n < 0 || (size_t)n >= buflen - pos) return 0;
    pos += n;

    /* ── special: load <filename> [col=N] [var=name] ── */
    if (strcmp(desc->command, "load") == 0)
    {
        for (i = 0; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;
            if (strcmp(desc->params[i].key, "file") == 0)
                n = snprintf(buf + pos, buflen - pos, " %s", values[i]);
            else
                n = snprintf(buf + pos, buflen - pos, " %s=%s",
                             desc->params[i].key, values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
        }
    }
    /* ── special: fft $var [var=prefix] ── */
    else if (strcmp(desc->command, "fft") == 0)
    {
        for (i = 0; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;
            if (strcmp(desc->params[i].key, "var") == 0 && i == 0)
                n = snprintf(buf + pos, buflen - pos, " $%s", values[i]);
            else
                n = snprintf(buf + pos, buflen - pos, " var=%s", values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
        }
    }
    /* ── special: ifft $re $im [var=prefix] ── */
    else if (strcmp(desc->command, "ifft") == 0)
    {
        for (i = 0; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;
            if (strcmp(desc->params[i].key, "re_var") == 0)
                n = snprintf(buf + pos, buflen - pos, " $%s", values[i]);
            else if (strcmp(desc->params[i].key, "im_var") == 0)
                n = snprintf(buf + pos, buflen - pos, " $%s", values[i]);
            else
                n = snprintf(buf + pos, buflen - pos, " var=%s", values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
        }
    }
    /* ── special: pid <mode> key=val ... ── */
    else if (strcmp(desc->command, "pid") == 0)
    {
        /* index 0 is mode — emit as positional word */
        mode = (values[0] && values[0][0]) ? values[0] : "sim";
        n = snprintf(buf + pos, buflen - pos, " %s", mode);
        if (n < 0 || (size_t)n >= buflen - pos) return 0;
        pos += n;

        for (i = 1; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;

            /* skip tune-only params unless mode is tune */
            if (strcmp(mode, "tune") != 0 &&
                (strcmp(desc->params[i].key, "method") == 0 ||
                 strcmp(desc->params[i].key, "type")   == 0))
                continue;

            /* skip sim-only params when in step mode */
            if (strcmp(mode, "step") == 0 &&
                (strcmp(desc->params[i].key, "pv0")  == 0 ||
                 strcmp(desc->params[i].key, "n")    == 0 ||
                 strcmp(desc->params[i].key, "gain") == 0 ||
                 strcmp(desc->params[i].key, "tau")  == 0))
                continue;

            /* skip step-only params when in sim mode */
            if (strcmp(mode, "sim") == 0 &&
                strcmp(desc->params[i].key, "pv") == 0)
                continue;

            n = snprintf(buf + pos, buflen - pos, " %s=%s",
                         desc->params[i].key, values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
        }
    }
    /* ── standard: command key=val key=val ... ── */
    else
    {
        for (i = 0; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;
            n = snprintf(buf + pos, buflen - pos, " %s=%s",
                         desc->params[i].key, values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
        }
    }

    /* trailing newline for parse */
    n = snprintf(buf + pos, buflen - pos, "\n");
    if (n < 0 || (size_t)n >= buflen - pos) return 0;
    return 1;
}
