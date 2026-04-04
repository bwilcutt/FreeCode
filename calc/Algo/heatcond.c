#include "heatcond.h"

/*************************************************************
 * Function:    run_heatcond
 * Input:       args (const char*) — the portion of the input line following
 *              the "heatcond" command keyword; contains named parameters
 *              k=<val>, A=<val>, L=<val>, T1=<val>, T2=<val>, and an
 *              optional solve=<k|A|L|T1|T2> target; omitting solve= defaults
 *              to solving Q when all five parameters are provided.
 *              Optional units=si|us selects the unit system.
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Solves Fourier's Law of heat conduction:
 *
 *                Q = k * A * (T1 - T2) / L
 *
 *              for any one unknown given the remaining four.  Also computes
 *              heat flux q'' = Q / A and thermal resistance R_th = L / (k*A).
 *
 *              SI units:  k [W/m·K], A [m²], L [m], T [K or °C], Q [W],
 *                         q'' [W/m²], R_th [K/W]
 *              US units:  k [BTU·in/hr·ft²·°F], A [ft²], L [in],
 *                         T [°F], Q [BTU/hr], q'' [BTU/hr·ft²]
 *
 *              Results stored in:
 *                $heatcond_k, $heatcond_A, $heatcond_L,
 *                $heatcond_T1, $heatcond_T2,
 *                $heatcond_Q, $heatcond_q, $heatcond_Rth
 *************************************************************/
void run_heatcond(const char *args)
{
    double      k           = 0;
    double      A           = 0;
    double      L           = 0;
    double      T1          = 0;
    double      T2          = 0;
    int         have_k      = 0;
    int         have_A      = 0;
    int         have_L      = 0;
    int         have_T1     = 0;
    int         have_T2     = 0;
    char        solveTarget[8];
    int         useUsUnits;
    const char *unitLabel;
    double      Q           = 0;
    double      q           = 0;   /* heat flux Q/A          */
    double      Rth         = 0;   /* thermal resistance L/(kA) */
    double      solvedResult = 0;

    solveTarget[0] = '\0';
    memset(solveTarget, 0, sizeof(solveTarget));
    useUsUnits = args_have_us_units(args);
    unitLabel  = useUsUnits
        ? "US  (BTU/hr, ft2, in, degF)"
        : "SI  (W, m2, m, K)";

    parse_named_param(args, "k",  &k,  &have_k);
    parse_named_param(args, "A",  &A,  &have_A);
    parse_named_param(args, "L",  &L,  &have_L);
    parse_named_param(args, "T1", &T1, &have_T1);
    parse_named_param(args, "T2", &T2, &have_T2);
    fprintf(stderr, "DEBUG heatcond: args='%s'\n", args);
    fprintf(stderr, "DEBUG: k=%g(%d) A=%g(%d) L=%g(%d) T1=%g(%d) T2=%g(%d)\n",
            k, have_k, A, have_A, L, have_L, T1, have_T1, T2, have_T2);
    if (strstr(args, "solve="))
        parse_named_string_param(args, "solve", solveTarget, sizeof(solveTarget));

    /* ── default: solve Q when all five inputs given ── */
    if (!solveTarget[0])
    {
        if (have_k && have_A && have_L && have_T1 && have_T2)
        {
            strcpy(solveTarget, "Q");
        }
        else
        {
            printf("  Usage: heatcond k=<> A=<> L=<> T1=<> T2=<> [units=si|us] [solve=<k|A|L|T1|T2>]\n");
            printf("  Omit one parameter and set solve= to that parameter to solve for it.\n");
            printf("  Omit solve= entirely (with all five given) to compute Q.\n");
            printf("\n");
            printf("  Common k values (SI, W/m·K): copper=385, aluminium=205,\n");
            printf("    steel=50, glass=1.05, brick=0.69, wood=0.12, air=0.026\n");
            return;
        }
    }

    /* ── solve for the requested unknown ── */
    if (strcmp(solveTarget, "Q") == 0)
    {
        if (!have_k || !have_A || !have_L || !have_T1 || !have_T2)
        {
            printf("  heatcond: need k, A, L, T1, T2 to compute Q\n"); return;
        }
        if (k <= 0) { printf("  heatcond: k must be > 0\n"); return; }
        if (A <= 0) { printf("  heatcond: A must be > 0\n"); return; }
        if (L <= 0) { printf("  heatcond: L must be > 0\n"); return; }
        Q            = k * A * (T1 - T2) / L;
        solvedResult = Q;
    }
    else if (strcmp(solveTarget, "k") == 0)
    {
        if (!have_A || !have_L || !have_T1 || !have_T2)
        {
            printf("  heatcond: need A, L, T1, T2 to solve k\n"); return;
        }
        if (A <= 0)         { printf("  heatcond: A must be > 0\n");          return; }
        if (L <= 0)         { printf("  heatcond: L must be > 0\n");          return; }
        if (!have_k)
        {
            /* Q must be supplied instead */
            if (T1 == T2)   { printf("  heatcond: T1 and T2 must differ to solve k\n"); return; }
            /* Q comes from the named param — re-parse as Q */
            int have_Q = 0;
            double Qin = 0;
            parse_named_param(args, "Q", &Qin, &have_Q);
            if (!have_Q)    { printf("  heatcond: supply Q=<val> or k=<val>\n"); return; }
            k            = Qin * L / (A * (T1 - T2));
            Q            = Qin;
        }
        else
        {
            printf("  heatcond: k is already given — nothing to solve\n"); return;
        }
        solvedResult = k;
    }
    else if (strcmp(solveTarget, "A") == 0)
    {
        if (!have_k || !have_L || !have_T1 || !have_T2)
        {
            printf("  heatcond: need k, L, T1, T2 (and Q=) to solve A\n"); return;
        }
        if (k <= 0)     { printf("  heatcond: k must be > 0\n");          return; }
        if (L <= 0)     { printf("  heatcond: L must be > 0\n");          return; }
        if (T1 == T2)   { printf("  heatcond: T1 and T2 must differ to solve A\n"); return; }
        int    have_Q = 0;
        double Qin    = 0;
        parse_named_param(args, "Q", &Qin, &have_Q);
        if (!have_Q)    { printf("  heatcond: supply Q=<val> to solve A\n"); return; }
        A            = Qin * L / (k * (T1 - T2));
        Q            = Qin;
        solvedResult = A;
    }
    else if (strcmp(solveTarget, "L") == 0)
    {
        if (!have_k || !have_A || !have_T1 || !have_T2)
        {
            printf("  heatcond: need k, A, T1, T2 (and Q=) to solve L\n"); return;
        }
        if (k <= 0)     { printf("  heatcond: k must be > 0\n");          return; }
        if (A <= 0)     { printf("  heatcond: A must be > 0\n");          return; }
        if (T1 == T2)   { printf("  heatcond: T1 and T2 must differ to solve L\n"); return; }
        int    have_Q = 0;
        double Qin    = 0;
        parse_named_param(args, "Q", &Qin, &have_Q);
        if (!have_Q)    { printf("  heatcond: supply Q=<val> to solve L\n"); return; }
        if (Qin == 0)   { printf("  heatcond: Q must be non-zero to solve L\n"); return; }
        L            = k * A * (T1 - T2) / Qin;
        Q            = Qin;
        solvedResult = L;
    }
    else if (strcmp(solveTarget, "T1") == 0)
    {
        if (!have_k || !have_A || !have_L || !have_T2)
        {
            printf("  heatcond: need k, A, L, T2 (and Q=) to solve T1\n"); return;
        }
        if (k <= 0) { printf("  heatcond: k must be > 0\n"); return; }
        if (A <= 0) { printf("  heatcond: A must be > 0\n"); return; }
        if (L <= 0) { printf("  heatcond: L must be > 0\n"); return; }
        int    have_Q = 0;
        double Qin    = 0;
        parse_named_param(args, "Q", &Qin, &have_Q);
        if (!have_Q) { printf("  heatcond: supply Q=<val> to solve T1\n"); return; }
        T1           = T2 + Qin * L / (k * A);
        Q            = Qin;
        solvedResult = T1;
    }
    else if (strcmp(solveTarget, "T2") == 0)
    {
        if (!have_k || !have_A || !have_L || !have_T1)
        {
            printf("  heatcond: need k, A, L, T1 (and Q=) to solve T2\n"); return;
        }
        if (k <= 0) { printf("  heatcond: k must be > 0\n"); return; }
        if (A <= 0) { printf("  heatcond: A must be > 0\n"); return; }
        if (L <= 0) { printf("  heatcond: L must be > 0\n"); return; }
        int    have_Q = 0;
        double Qin    = 0;
        parse_named_param(args, "Q", &Qin, &have_Q);
        if (!have_Q) { printf("  heatcond: supply Q=<val> to solve T2\n"); return; }
        T2           = T1 - Qin * L / (k * A);
        Q            = Qin;
        solvedResult = T2;
    }
    else
    {
        printf("  heatcond: unknown solve target '%s'. Use k, A, L, T1, or T2\n",
               solveTarget);
        return;
    }

    /* ── derived quantities ── */
    q   = (A > 0) ? Q / A : 0.0;
    Rth = (k > 0 && A > 0) ? L / (k * A) : 0.0;

    /* ── print results ── */
    printf("\n  Fourier Heat Conduction  Q = kA(T1-T2)/L  [%s]\n", unitLabel);
    printf("  -------------------------------------\n");
    printf("  Inputs\n");
    printf("    k   (thermal conductivity)  = %g\n",   k);
    printf("    A   (cross-section area)    = %g\n",   A);
    printf("    L   (wall thickness)        = %g\n",   L);
    printf("    T1  (hot-face temperature)  = %g\n",   T1);
    printf("    T2  (cold-face temperature) = %g\n",   T2);
    printf("  Results\n");
    printf("    Q   (heat flow rate)        = %.6g\n", Q);
    printf("    q'' (heat flux Q/A)         = %.6g\n", q);
    printf("    Rth (thermal resistance)    = %.6g\n", Rth);
    if (strcmp(solveTarget, "Q") != 0)
        printf("  Solved:  %s = %.6g\n", solveTarget, solvedResult);

    /* ── store all variables for GUI diagram ── */
    set_var("heatcond_k",   k);
    set_var("heatcond_A",   A);
    set_var("heatcond_L",   L);
    set_var("heatcond_T1",  T1);
    set_var("heatcond_T2",  T2);
    set_var("heatcond_Q",   Q);
    set_var("heatcond_q",   q);
    set_var("heatcond_Rth", Rth);

    printf("  (results stored in $heatcond_k, $heatcond_A, $heatcond_L,\n");
    printf("   $heatcond_T1, $heatcond_T2, $heatcond_Q, $heatcond_q, $heatcond_Rth)\n\n");
}
