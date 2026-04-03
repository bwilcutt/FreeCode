#include "darcy.h"

/*************************************************************
 * Function:    run_darcy
 * Input:       args (const char*) — the portion of the input line following
 *              the "darcy" command keyword; contains named parameters of the
 *              form f=<val> L=<val> D=<val> V=<val> and an optional units=si|us flag
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Implements the Darcy-Weisbach equation for pipe head loss:
 *              hf = f * (L/D) * V^2 / (2g).
 *              Parses four required named parameters (f, L, D, V) plus an optional
 *              unit system flag, validates that all inputs are positive, then
 *              computes the head loss (hf) and specific pressure loss (dP/rho).
 *              Results are stored in $darcy_hf and $darcy_dP_rho.
 *              Inputs are always stored in $darcy_f, $darcy_L, $darcy_D,
 *              $darcy_V, $darcy_g so the GUI diagram can read them.
 **************************************************************/
void run_darcy(const char *args)
{
    double      frictionFactor;
    double      pipeLength;
    double      pipeDiameter;
    double      flowVelocity;
    int         haveFriction;
    int         haveLength;
    int         haveDiameter;
    int         haveVelocity;
    int         useUsUnits;
    double      gravity;
    const char *unitLabel;
    double      headLoss;
    double      specificPressureLoss;

    frictionFactor       = 0;
    pipeLength           = 0;
    pipeDiameter         = 0;
    flowVelocity         = 0;
    haveFriction         = 0;
    haveLength           = 0;
    haveDiameter         = 0;
    haveVelocity         = 0;
    useUsUnits           = args_have_us_units(args);
    gravity              = useUsUnits ? 32.174 : 9.81;
    unitLabel            = useUsUnits ? "US customary (ft, ft/s)" : "SI (m, m/s)";
    headLoss             = 0;
    specificPressureLoss = 0;

    parse_named_param(args, "f", &frictionFactor, &haveFriction);
    parse_named_param(args, "L", &pipeLength,     &haveLength);
    parse_named_param(args, "D", &pipeDiameter,   &haveDiameter);
    parse_named_param(args, "V", &flowVelocity,   &haveVelocity);

    if (!haveFriction || !haveLength || !haveDiameter || !haveVelocity)
    {
        printf("  Usage: darcy f=<val> L=<val> D=<val> V=<val> [units=si|us]\n");
        printf("  Tip: use  reynolds  to find the friction factor regime,\n");
        printf("       then look up f from a Moody chart (typical 0.01-0.05).\n");
        return;
    }
    if (frictionFactor <= 0) { printf("  darcy: f must be > 0\n"); return; }
    if (pipeLength     <= 0) { printf("  darcy: L must be > 0\n"); return; }
    if (pipeDiameter   <= 0) { printf("  darcy: D must be > 0\n"); return; }

    headLoss             = frictionFactor * (pipeLength / pipeDiameter) *
                           (flowVelocity * flowVelocity) / (2.0 * gravity);
    specificPressureLoss = headLoss * gravity;

    printf("\n  Darcy-Weisbach — Pipe Head Loss  [%s]\n", unitLabel);
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    f  (Darcy friction factor) = %g\n", frictionFactor);
    printf("    L  (pipe length)           = %g\n", pipeLength);
    printf("    D  (pipe diameter)         = %g\n", pipeDiameter);
    printf("    V  (flow velocity)         = %g\n", flowVelocity);
    printf("    g  (gravity)               = %g\n", gravity);
    printf("  Results\n");
    printf("    hf (head loss)             = %.4f\n", headLoss);
    printf("    \xce\x94P/\xcf\x81 (specific press loss) = %.4f\n", specificPressureLoss);

    /* ── store inputs for GUI diagram ── */
    set_var("darcy_f",   frictionFactor);
    set_var("darcy_L",   pipeLength);
    set_var("darcy_D",   pipeDiameter);
    set_var("darcy_V",   flowVelocity);
    set_var("darcy_g",   gravity);

    /* ── store results ── */
    set_var("darcy_hf",     headLoss);
    set_var("darcy_dP_rho", specificPressureLoss);

    printf("  (results stored in $darcy_hf, $darcy_dP_rho)\n\n");
}
