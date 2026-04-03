#include "bernoulli.h"

/*************************************************************
 * Function:    run_bernoulli
 * Input:       args (const char*) — the portion of the input line following
 *              the "bernoulli" command keyword; contains named parameters
 *              P1, V1, z1, P2, V2, z2, optional rho and units=si|us,
 *              and a required solve=<P1|V1|z1|P2|V2|z2> target
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Solves Bernoulli's equation P/(rho*g) + V^2/(2g) + z = constant
 *              for any one unknown given the remaining five state variables.
 *              Supports both SI and US customary unit systems; rho defaults to
 *              1000 kg/m^3 (water).  Computed values are stored in
 *              $bern_P1, $bern_V1, $bern_z1, $bern_P2, $bern_V2, $bern_z2.
 *              Input parameters rho and g are stored in $bern_rho and $bern_g
 *              so the GUI diagram can reconstruct the head components.
 **************************************************************/
void run_bernoulli(const char *args)
{
    double      pressure1    = 0;
    double      velocity1    = 0;
    double      elevation1   = 0;
    double      pressure2    = 0;
    double      velocity2    = 0;
    double      elevation2   = 0;
    double      fluidDensity = 1000.0;
    int         havePressure1  = 0;
    int         haveVelocity1  = 0;
    int         haveElevation1 = 0;
    int         havePressure2  = 0;
    int         haveVelocity2  = 0;
    int         haveElevation2 = 0;
    int         haveDensity    = 0;
    char        solveTarget[8] = {};
    int         useUsUnits     = args_have_us_units(args);
    double      gravity        = useUsUnits ? 32.174 : 9.81;
    const char *unitLabel      = useUsUnits ? "US customary" : "SI";
    double      densityGravity = 0;
    double      totalHead1     = 0;
    double      totalHead2     = 0;
    double      headDiff       = 0;

    parse_named_param(args, "P1",  &pressure1,    &havePressure1);
    parse_named_param(args, "V1",  &velocity1,    &haveVelocity1);
    parse_named_param(args, "z1",  &elevation1,   &haveElevation1);
    parse_named_param(args, "P2",  &pressure2,    &havePressure2);
    parse_named_param(args, "V2",  &velocity2,    &haveVelocity2);
    parse_named_param(args, "z2",  &elevation2,   &haveElevation2);
    parse_named_param(args, "rho", &fluidDensity, &haveDensity);
    parse_named_string_param(args, "solve", solveTarget, sizeof(solveTarget));

    if (!solveTarget[0])
    {
        printf("  Usage: bernoulli P1=<> V1=<> z1=<> P2=<> V2=<> z2=<> [rho=<>] solve=<P1|V1|z1|P2|V2|z2>\n");
        printf("  Supply all variables except the one named in solve=\n");
        printf("  rho defaults to 1000 kg/m^3 (water)\n");
        return;
    }
    if (fluidDensity <= 0) { printf("  bernoulli: rho must be > 0\n"); return; }

    densityGravity = fluidDensity * gravity;

    /* Compute total head at each section (unknown contribution = 0 initially) */
    totalHead1 = pressure1 / densityGravity +
                 velocity1 * velocity1 / (2.0 * gravity) + elevation1;
    totalHead2 = pressure2 / densityGravity +
                 velocity2 * velocity2 / (2.0 * gravity) + elevation2;

    if (strcmp(solveTarget, "P1") == 0)
    {
        pressure1 = (totalHead2 - velocity1 * velocity1 /
                     (2.0 * gravity) - elevation1) * densityGravity;
    }
    else if (strcmp(solveTarget, "V1") == 0)
    {
        headDiff = totalHead2 - pressure1 / densityGravity - elevation1;
        if (headDiff < 0) { printf("  bernoulli: no real solution for V1\n"); return; }
        velocity1 = sqrt(2.0 * gravity * headDiff);
    }
    else if (strcmp(solveTarget, "z1") == 0)
    {
        elevation1 = totalHead2 - pressure1 / densityGravity -
                     velocity1 * velocity1 / (2.0 * gravity);
    }
    else if (strcmp(solveTarget, "P2") == 0)
    {
        pressure2 = (totalHead1 - velocity2 * velocity2 /
                     (2.0 * gravity) - elevation2) * densityGravity;
    }
    else if (strcmp(solveTarget, "V2") == 0)
    {
        headDiff = totalHead1 - pressure2 / densityGravity - elevation2;
        if (headDiff < 0) { printf("  bernoulli: no real solution for V2\n"); return; }
        velocity2 = sqrt(2.0 * gravity * headDiff);
    }
    else if (strcmp(solveTarget, "z2") == 0)
    {
        elevation2 = totalHead1 - pressure2 / densityGravity -
                     velocity2 * velocity2 / (2.0 * gravity);
    }
    else
    {
        printf("  bernoulli: unknown solve target '%s'. Use P1,V1,z1,P2,V2,z2\n",
               solveTarget);
        return;
    }

    /* Recompute heads with the solved value in place */
    totalHead1 = pressure1 / densityGravity +
                 velocity1 * velocity1 / (2.0 * gravity) + elevation1;
    totalHead2 = pressure2 / densityGravity +
                 velocity2 * velocity2 / (2.0 * gravity) + elevation2;

    printf("\n  Bernoulli's Equation  [%s]\n", unitLabel);
    printf("  ─────────────────────────────────────\n");
    printf("  Section 1\n");
    printf("    P1  (pressure)        = %g\n",   pressure1);
    printf("    V1  (velocity)        = %g\n",   velocity1);
    printf("    z1  (elevation)       = %g\n",   elevation1);
    printf("    H1  (total head)      = %.4f\n", totalHead1);
    printf("  Section 2\n");
    printf("    P2  (pressure)        = %g\n",   pressure2);
    printf("    V2  (velocity)        = %g\n",   velocity2);
    printf("    z2  (elevation)       = %g\n",   elevation2);
    printf("    H2  (total head)      = %.4f\n", totalHead2);
    printf("  Energy balance check\n");
    printf("    H1 - H2               = %.6g  %s\n",
           totalHead1 - totalHead2,
           fabs(totalHead1 - totalHead2) < 1e-9
               ? "(balanced \xe2\x9c\x93)" : "(head loss present)");

    /* ── store results ── */
    set_var("bern_P1", pressure1);
    set_var("bern_V1", velocity1);
    set_var("bern_z1", elevation1);
    set_var("bern_P2", pressure2);
    set_var("bern_V2", velocity2);
    set_var("bern_z2", elevation2);

    /* ── store inputs for GUI diagram ── */
    set_var("bern_rho", fluidDensity);
    set_var("bern_g",   gravity);

    printf("  (results stored in $bern_P1/V1/z1/P2/V2/z2)\n\n");
}
