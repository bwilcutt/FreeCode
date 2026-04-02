#include "orifice.h"

/* ── Orifice Flow ─────────────────────────────────────────
   Q = Cd * A * sqrt(2 * g * h)
   Command: orifice Cd=<> A=<> h=<> [units=si|us]
   ─────────────────────────────────────────────────────── */
void run_orifice(const char *args) {
    double Cd=0, A=0, h=0;
    int have_Cd=0, have_A=0, have_h=0;
    int us = args_have_us_units(args);
    double g = us ? 32.174 : 9.81;
    const char *unit_label = us ? "US customary (ft, ft/s, cfs)" : "SI (m, m/s, m³/s)";

    parse_named_param(args, "Cd", &Cd, &have_Cd);
    parse_named_param(args, "A",  &A,  &have_A);
    parse_named_param(args, "h",  &h,  &have_h);

    if (!have_Cd || !have_A || !have_h) {
        printf("  Usage: orifice Cd=<val> A=<val> h=<val> [units=si|us]\n");
        printf("  Typical Cd: sharp-edged orifice=0.61, rounded=0.98, short tube=0.82\n");
        return;
    }
    if (Cd <= 0 || Cd > 1) { printf("  orifice: Cd must be in (0, 1]\n"); return; }
    if (A  <= 0)            { printf("  orifice: A must be > 0\n");        return; }
    if (h  <= 0)            { printf("  orifice: h must be > 0\n");        return; }

    double Q = Cd * A * sqrt(2.0 * g * h);
    double V = Q / A;

    printf("\n  Orifice Flow  [%s]\n", unit_label);
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    Cd (discharge coeff)  = %g\n",   Cd);
    printf("    A  (orifice area)     = %g\n",   A);
    printf("    h  (head above orifice) = %g\n", h);
    printf("  Results\n");
    printf("    Q  (discharge)        = %.4f\n", Q);
    printf("    V  (jet velocity)     = %.4f\n", V);
    set_var("orifice_Q", Q);
    set_var("orifice_V", V);
    printf("  (results stored in $orifice_Q, $orifice_V)\n\n");
}

