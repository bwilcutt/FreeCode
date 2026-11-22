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
static const char *heat_solve_choices[] = { "Q", "k", "A", "L", "T1", "T2", NULL };
static const char *pid_mode_choices[]   = { "sim", "step", "tune", "reset", NULL };
static const char *pid_type_choices[]   = { "PID", "PI", "P", NULL };
static const char *pid_method_choices[] = { "zn", "znol", "cc", NULL };
static const char *sch_units_choices[]  = { "au", "ev", NULL };

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
        "Fluids",
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
        1, PLOT_REYNOLDS, "Reynolds Number"
    },

    /* ── Navier-Stokes Cavity ──────────────────────────────── */
    {
        "navier",
        "Navier-Stokes Cavity",
        "Fluids",
        "Steady 2D flow in a square box whose lid slides sideways, checked "
        "against the published Ghia (1982) results at Re = 100, 400 and 1000",
        {
            { "Re",    "Reynolds number",  "",       PT_SCALAR, NULL, "100",    0,
              "Leave blank to work it out from lid speed, box size and viscosity" },
            { "V",     "Lid speed",        "m/s",    PT_SCALAR, NULL, NULL,     0,
              "Speed of the sliding lid (used only when Re is blank)" },
            { "D",     "Box size",         "m",      PT_SCALAR, NULL, NULL,     0,
              "Side length of the square box (used only when Re is blank)" },
            { "nu",    "Kinematic visc.",  "m²/s",   PT_SCALAR, NULL, NULL,     0,
              "Kinematic viscosity (use instead of rho+mu)" },
            { "rho",   "Density",          "kg/m³",  PT_SCALAR, NULL, NULL,     0,
              "Fluid density (use with mu)" },
            { "mu",    "Dynamic visc.",    "Pa·s",   PT_SCALAR, NULL, NULL,     0,
              "Dynamic viscosity (use with rho)" },
            { "N",     "Grid points",      "",       PT_SCALAR, NULL, "65",     0,
              "Points along each side; more is slower but more accurate. "
              "Use 129 or more for Re = 1000" },
            { "tol",   "Settle tolerance", "",       PT_SCALAR, NULL, "1e-5",   0,
              "How still the flow must be before it counts as settled" },
            { "maxit", "Max steps",        "",       PT_SCALAR, NULL, "400000", 0,
              "Give up after this many time steps if the flow has not settled" },
        },
        9,
        {
            { "navier_Re",     "Reynolds number",        "",  0, ""  },
            { "navier_psimin", "Main vortex strength",   "",  0, ""  },
            { "navier_xc",     "Main vortex centre x",   "",  0, ""  },
            { "navier_yc",     "Main vortex centre y",   "",  0, ""  },
            { "navier_err",    "Worst difference from Ghia", "", 0, "" },
            { "navier_conv",   "Settled (1 = yes)",      "",  0, ""  },
            { "navier_steps",  "Time steps taken",       "",  0, ""  },
            { "navier_y",      "Height on centre line",  "",  1, "x" },
            { "navier_u",      "Horizontal speed",       "",  1, "y" },
            { "navier_x",      "Position on centre line","",  1, ""  },
            { "navier_v",      "Vertical speed",         "",  1, ""  },
        },
        11,
        1, PLOT_NAVIER, "Navier-Stokes Cavity"
    },

    /* ── Channel Flow (Cylinder) ───────────────────────────── */
    {
        "channel",
        "Channel Flow (Cylinder)",
        "Fluids",
        "Flow through a channel past a cylinder: drag, lift, pressure drop and "
        "vortex shedding.  Defaults are the DFG benchmark (Schäfer & Turek 1996)",
        {
            { "Re",  "Reynolds number",  "",       PT_SCALAR, NULL, "20",    0,
              "Sets the inlet speed for you.  Leave blank to use Peak inlet "
              "speed instead.  20 and 100 are the benchmark cases" },
            { "U",   "Peak inlet speed", "m/s",    PT_SCALAR, NULL, NULL,    0,
              "Fastest speed at the inlet, mid-channel (used only when "
              "Reynolds number is blank)" },
            { "nu",  "Kinematic visc.",  "m²/s",   PT_SCALAR, NULL, "0.001", 0,
              "Kinematic viscosity of the fluid" },
            { "rho", "Density",          "kg/m³",  PT_SCALAR, NULL, "1",     0,
              "Fluid density — scales the forces and pressure" },
            { "L",   "Channel length",   "m",      PT_SCALAR, NULL, "2.2",   0,
              "Length of the channel" },
            { "H",   "Channel height",   "m",      PT_SCALAR, NULL, "0.41",  0,
              "Height of the channel, wall to wall" },
            { "cx",  "Cylinder x",       "m",      PT_SCALAR, NULL, "0.2",   0,
              "Distance of the cylinder centre from the inlet" },
            { "cy",  "Cylinder y",       "m",      PT_SCALAR, NULL, "0.2",   0,
              "Height of the cylinder centre above the bottom wall" },
            { "D",   "Cylinder diameter","m",      PT_SCALAR, NULL, "0.1",   0,
              "Diameter of the cylinder" },
            { "res", "Grid cells across","",       PT_SCALAR, NULL, "10",    0,
              "Grid cells across the cylinder.  10 takes seconds; 20 is "
              "about twice as accurate but takes minutes" },
            { "t",   "Longest time",     "s",      PT_SCALAR, NULL, "30",    0,
              "Stop after this much simulated time if the flow has not "
              "settled.  Use 8 or more to see vortex shedding" },
            { "tol", "Settle tolerance", "",       PT_SCALAR, NULL, "1e-4",  0,
              "How still the flow must be before it counts as settled" },
        },
        12,
        {
            { "channel_cd",     "Drag coefficient",           "",   0, ""  },
            { "channel_cl",     "Lift coefficient",           "",   0, ""  },
            { "channel_cdmax",  "Largest drag coefficient",   "",   0, ""  },
            { "channel_clmax",  "Largest lift coefficient",   "",   0, ""  },
            { "channel_dp",     "Pressure drop over cylinder","Pa", 0, ""  },
            { "channel_st",     "Strouhal number (0 = none)", "",   0, ""  },
            { "channel_steady", "Settled (1 = yes)",          "",   0, ""  },
            { "channel_time",   "Simulated time",             "s",  0, ""  },
            { "channel_steps",  "Time steps taken",           "",   0, ""  },
            { "channel_tv",     "Time",                       "s",  1, "x" },
            { "channel_cdv",    "Drag coefficient history",   "",   1, "y" },
            { "channel_clv",    "Lift coefficient history",   "",   1, ""  },
        },
        12,
        1, PLOT_CHANNEL, "Channel Flow Past a Cylinder"
    },

    /* ── Two Slits Against One ─────────────────────────────── */
    {
        "slittest",
        "Two Slits Against One",
        "Fluids",
        "Does a fluid make a double-slit pattern?  Massless particles ride the "
        "flow through two slits, then one, and are scored against wave optics "
        "over a range of Reynolds numbers.  Takes a few minutes",
        {
            { "Re_min",   "Lowest Reynolds no.",  "",  PT_SCALAR, NULL, "10",   0,
              "Start of the sweep, measured on the jet through a slit" },
            { "Re_max",   "Highest Reynolds no.", "",  PT_SCALAR, NULL, "1000", 0,
              "End of the sweep.  Past about 1000, raise Grid cells across "
              "or the fluid acts thicker than asked" },
            { "Re_steps", "Reynolds numbers",     "",  PT_SCALAR, NULL, "8",    0,
              "How many to try, evenly spread on a log scale.  Each one "
              "takes about 15 seconds" },
            { "a",        "Slit width",           "m", PT_SCALAR, NULL, "0.02", 0,
              "Width of each slit" },
            { "d",        "Slit separation",      "m", PT_SCALAR, NULL, "0.08", 0,
              "Distance between the two slits, centre to centre" },
            { "w",        "Wall thickness",       "m", PT_SCALAR, NULL, "0.02", 0,
              "Thickness of the wall the slits are cut in" },
            { "H",        "Channel height",       "m", PT_SCALAR, NULL, "0.8",  0,
              "Height of the channel, which is also the height of the screen" },
            { "Ls",       "Wall to screen",       "m", PT_SCALAR, NULL, "0.45", 0,
              "How far behind the wall the screen sits" },
            { "res",      "Grid cells across",    "",  PT_SCALAR, NULL, "4",    0,
              "Grid cells across one slit.  Doubling it is far more "
              "accurate and about 8 times slower" },
        },
        9,
        {
            { "slit_best",   "Best two-slit match (0 to 1)",   "", 0, ""  },
            { "slit_bestRe", "Reynolds number of best match",  "", 0, ""  },
            { "slit_re",     "Reynolds numbers tried",         "", 1, "x" },
            { "slit_match2", "Two-slit match",                 "", 1, "y" },
            { "slit_match1", "One-slit match",                 "", 1, ""  },
            { "slit_lambda", "Fitted wavelength",              "m", 1, "" },
        },
        6,
        1, PLOT_SLITTEST, "Two Slits Against One"
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
        1, PLOT_MANNING, "Manning's Equation"
    },

    /* ── Darcy-Weisbach ────────────────────────────────────── */
    {
        "darcy",
        "Darcy-Weisbach",
        "Fluids",
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
        1, PLOT_DARCY, "Darcy-Weisbach"
    },

    /* ── Bernoulli ─────────────────────────────────────────── */
    {
        "bernoulli",
        "Bernoulli's Equation",
        "Fluids",
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
        1, PLOT_BERNOULLI, "Bernoulli's Equation"
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
        1, PLOT_ORIFICE, "Orifice Flow"
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
        "Thermo",
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
        1, PLOT_IDEALGAS, "Ideal Gas Law"
    },


/* ── Heat Conduction ───────────────────────────────────── */
{
    "heatcond",
    "Heat Conduction",
    "Thermo",
    "Fourier's Law: steady-state conduction through a slab  Q = kA(T1-T2)/L",
    {
        { "k",     "Conductivity",      "W/m·K", PT_SCALAR, NULL,         NULL, 1,
          "Thermal conductivity (copper=385, steel=50, glass=1.05, wood=0.12)" },
        { "A",     "Area",              "m²",    PT_SCALAR, NULL,         NULL, 1,
          "Cross-sectional area perpendicular to heat flow" },
        { "L",     "Thickness",         "m",     PT_SCALAR, NULL,         NULL, 1,
          "Slab thickness in direction of heat flow" },
        { "T1",    "Hot-face temp",     "K",     PT_SCALAR, NULL,         NULL, 1,
          "Temperature of the hot face" },
        { "T2",    "Cold-face temp",    "K",     PT_SCALAR, NULL,         NULL, 1,
          "Temperature of the cold face" },
        { "units", "Unit system",       "",      PT_CHOICE, units_choices, "si", 0,
          "SI or US customary" },
        { "solve", "Solve for",         "",      PT_CHOICE, heat_solve_choices, "Q", 0,
          "Leave blank to compute Q, or pick a variable to solve for" },
    },
    7,
    {
        { "heatcond_Q",   "Heat flow rate",    "W",    0, "" },
        { "heatcond_q",   "Heat flux",         "W/m²", 0, "" },
        { "heatcond_Rth", "Thermal resistance","K/W",  0, "" },
        { "heatcond_k",   "Conductivity",      "W/m·K",0, "" },
        { "heatcond_A",   "Area",              "m²",   0, "" },
        { "heatcond_L",   "Thickness",         "m",    0, "" },
        { "heatcond_T1",  "Hot-face temp",     "K",    0, "" },
        { "heatcond_T2",  "Cold-face temp",    "K",    0, "" },
    },
    8,
    1, PLOT_HEATCOND, "Heat Conduction"
},
    /* ── Specific Heat ─────────────────────────────────────── */
    {
        "specheat",
        "Specific Heat",
        "Thermo",
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
        1, PLOT_SPECHEAT, "Specific Heat "
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

    /* ── Asteroid Impact Screening ─────────────────────────── */
    {
        "asteroid",
        "Asteroid Impact Screening",
        "Astro",
        "Will this asteroid hit Earth? Closest-approach search and impact "
        "probability from JPL orbital elements and their uncertainties",
        {
            { "a",     "Semi-major axis",   "AU",   PT_SCALAR, NULL, NULL,   1,
              "Size of the orbit (JPL: a)" },
            { "e",     "Eccentricity",      "",     PT_SCALAR, NULL, NULL,   1,
              "Shape of the orbit, 0 = circle, must be below 1 (JPL: e)" },
            { "i",     "Inclination",       "deg",  PT_SCALAR, NULL, NULL,   1,
              "Tilt of the orbit to the ecliptic (JPL: i)" },
            { "om",    "Ascending node",    "deg",  PT_SCALAR, NULL, NULL,   1,
              "Longitude of the ascending node (JPL: node, Omega)" },
            { "w",     "Arg. of perihelion","deg",  PT_SCALAR, NULL, NULL,   1,
              "Argument of perihelion (JPL: peri, omega)" },
            { "M",     "Mean anomaly",      "deg",  PT_SCALAR, NULL, NULL,   1,
              "Mean anomaly at the epoch (JPL: M)" },
            { "epoch", "Epoch",             "JD",   PT_SCALAR, NULL, NULL,   1,
              "Date the elements apply to, as JD or MJD (JPL: Epoch)" },
            { "start", "Search start",      "JD",   PT_SCALAR, NULL, NULL,   0,
              "First date to search, JD or MJD (blank = the epoch)" },
            { "span",  "Search length",     "days", PT_SCALAR, NULL, "365",  0,
              "How many days to search from the start" },
            { "step",  "Scan step",         "days", PT_SCALAR, NULL, "0.25", 0,
              "Sampling interval; every dip in distance is then refined" },
            { "sa",    "± Semi-major axis", "AU",   PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of a (JPL lists it beside each element). "
              "Leave all ± fields blank for a plain yes/no answer" },
            { "se",    "± Eccentricity",    "",     PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of e" },
            { "si",    "± Inclination",     "deg",  PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of i" },
            { "som",   "± Ascending node",  "deg",  PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of the ascending node" },
            { "sw",    "± Arg. of perihelion","deg",PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of the argument of perihelion" },
            { "sM",    "± Mean anomaly",    "deg",  PT_SCALAR, NULL, NULL,   0,
              "1-sigma uncertainty of the mean anomaly" },
        },
        16,
        {
            { "asteroid_hit",     "Impact (1 = yes)",          "",     0, ""  },
            { "asteroid_prob",    "Impact probability",        "",     0, ""  },
            { "asteroid_dmin",    "Closest approach",          "km",   0, ""  },
            { "asteroid_dmin_er", "Closest approach",          "R⊕",   0, ""  },
            { "asteroid_dmin_ld", "Closest approach",          "LD",   0, ""  },
            { "asteroid_tca_d",   "Days to closest approach",  "days", 0, ""  },
            { "asteroid_vrel",    "Speed relative to Earth",   "km/s", 0, ""  },
            { "asteroid_bcap",    "Earth capture radius",      "km",   0, ""  },
            { "asteroid_t",       "Time from start",           "days", 1, "x" },
            { "asteroid_d",       "Earth distance",            "LD",   1, "y" },
        },
        10,
        1, PLOT_ASTEROID, "Asteroid — Distance from Earth"
    },

    /* ── Schrödinger Equation ──────────────────────────────── */
    {
        "schrodinger",
        "Schrödinger Equation (1D)",
        "Quantum",
        "Energy levels and wavefunctions of a particle trapped in any 1D "
        "potential.  Pick a preset, or type your own formula in $x",
        {
            { "V",     "Potential",        "",    PT_STRING, NULL, "harmonic", 1,
              "A preset — well, harmonic, finite, barrier, double — or a "
              "formula in $x, such as 0.5*$x^2 + 0.1*$x^4" },
            { "xmin",  "Box left wall",    "",    PT_SCALAR, NULL, "-5",   0,
              "Where the box starts; the particle can never go past it "
              "(nm when units = ev)" },
            { "xmax",  "Box right wall",   "",    PT_SCALAR, NULL, "5",    0,
              "Where the box ends (nm when units = ev)" },
            { "n",     "States",           "",    PT_SCALAR, NULL, "5",    0,
              "How many energy levels to find, lowest first (up to 50)" },
            { "N",     "Grid points",      "",    PT_SCALAR, NULL, "1000", 0,
              "More is more accurate and a little slower (up to 5000)" },
            { "m",     "Mass",             "",    PT_SCALAR, NULL, "1",    0,
              "Particle mass; in electron masses when units = ev" },
            { "units", "Units",            "",    PT_CHOICE, sch_units_choices, "au", 0,
              "au: hbar = 1 and mass 1.  ev: positions in nanometres, "
              "energies in electron-volts, mass in electron masses" },
            { "V0",    "Depth / height",   "",    PT_SCALAR, NULL, NULL,   0,
              "For the finite, barrier and double presets (default 10)" },
            { "a",     "Width",            "",    PT_SCALAR, NULL, NULL,   0,
              "Well or barrier width; for double, where the two dips sit" },
            { "k",     "Spring constant",  "",    PT_SCALAR, NULL, NULL,   0,
              "Stiffness of the harmonic preset (default 1)" },
        },
        10,
        {
            { "schrod_E0",     "Ground-state energy",         "", 0, ""  },
            { "schrod_n",      "States found",                "", 0, ""  },
            { "schrod_nbound", "States the potential holds (-1 = box only)", "", 0, "" },
            { "schrod_err",    "Worst difference from exact (-1 = none)",    "", 0, "" },
            { "schrod_x",      "Position",                    "", 1, "x" },
            { "schrod_V",      "Potential",                   "", 1, ""  },
            { "schrod_E",      "Energy levels",               "", 1, ""  },
            { "schrod_psi",    "Wavefunctions",               "", 1, "y" },
        },
        8,
        1, PLOT_SCHRODINGER, "Schrödinger Equation — Energy Levels"
    },

    /* ── Load CSV ──────────────────────────────────────────── */
    {
        "load",
        "Load CSV",
        "Signaling",
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
        "Signaling",
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
        "Signaling",
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
 *                - "schrodinger" and "slittest" separate key=val
 *                  pairs with commas: schrodinger because its V
 *                  formula may hold spaces, slittest to match it.
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
    /* ── special: schrodinger / slittest key=val, key=val, ... ──
          Commas, not spaces: parse reads the potential formula up to
          the next top-level comma, so "0.5*$x^2 + 1" arrives whole.
          slittest takes the same punctuation, for consistency. ── */
    else if (strcmp(desc->command, "schrodinger") == 0 ||
             strcmp(desc->command, "slittest")    == 0)
    {
        const char *sep = " ";   /* first pair follows the command name */
        for (i = 0; i < desc->n_params; i++)
        {
            if (!values[i] || values[i][0] == '\0') continue;
            n = snprintf(buf + pos, buflen - pos, "%s%s=%s",
                         sep, desc->params[i].key, values[i]);
            if (n < 0 || (size_t)n >= buflen - pos) return 0;
            pos += n;
            sep = ", ";
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
