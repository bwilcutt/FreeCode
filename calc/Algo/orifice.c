#include "orifice.h"

/*************************************************************
 * Function:    run_orifice
 * Input:       args (const char*) — the portion of the input line following
 *              the "orifice" command keyword; contains named parameters
 *              Cd=<val>, A=<val>, h=<val>, and optional units=si|us
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Computes orifice flow rate Q = Cd * A * sqrt(2*g*h) and
 *              jet velocity V = Q/A.  Results stored in $orifice_Q, $orifice_V.
 *              Inputs stored in $orifice_Cd, $orifice_A, $orifice_h, $orifice_g
 *              so the GUI diagram can read them.
 *************************************************************/
void run_orifice(const char *args)
{
    double      Cd       = 0;
    double      A        = 0;
    double      h        = 0;
    int         have_Cd  = 0;
    int         have_A   = 0;
    int         have_h   = 0;
    int         us       = args_have_us_units(args);
    double      g        = us ? 32.174 : 9.81;
    const char *unit_label = us
        ? "US customary (ft, ft/s, cfs)"
        : "SI (m, m/s, m\xc2\xb3/s)";
    double      Q        = 0;
    double      V        = 0;

    parse_named_param(args, "Cd", &Cd, &have_Cd);
    parse_named_param(args, "A",  &A,  &have_A);
    parse_named_param(args, "h",  &h,  &have_h);

    if (!have_Cd || !have_A || !have_h)
    {
        printf("  Usage: orifice Cd=<val> A=<val> h=<val> [units=si|us]\n");
        printf("  Typical Cd: sharp-edged=0.61, rounded=0.98, short tube=0.82\n");
        return;
    }
    if (Cd <= 0 || Cd > 1) { printf("  orifice: Cd must be in (0, 1]\n"); return; }
    if (A  <= 0)            { printf("  orifice: A must be > 0\n");        return; }
    if (h  <= 0)            { printf("  orifice: h must be > 0\n");        return; }

    Q = Cd * A * sqrt(2.0 * g * h);
    V = Q / A;

    printf("\n  Orifice Flow  [%s]\n", unit_label);
    printf("  \xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80\n");
    printf("  Inputs\n");
    printf("    Cd (discharge coeff)    = %g\n",   Cd);
    printf("    A  (orifice area)       = %g\n",   A);
    printf("    h  (head above orifice) = %g\n",   h);
    printf("  Results\n");
    printf("    Q  (discharge)          = %.4f\n", Q);
    printf("    V  (jet velocity)       = %.4f\n", V);

    /* ── store inputs for GUI diagram ── */
    set_var("orifice_Cd", Cd);
    set_var("orifice_A",  A);
    set_var("orifice_h",  h);
    set_var("orifice_g",  g);

    /* ── store results ── */
    set_var("orifice_Q",  Q);
    set_var("orifice_V",  V);

    printf("  (results stored in $orifice_Q, $orifice_V)\n\n");
}
