#include "idealgas.h"

/*************************************************************
 * Function:    run_idealgas
 * Input:       args (const char*) — the portion of the input line following
 *              the "idealgas" command keyword; contains named parameters
 *              P=<val>, V=<val>, n=<val>, T=<val>, optional units=si|us,
 *              and a required solve=<P|V|n|T> target
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Solves the ideal gas law PV = nRT for any one unknown given the
 *              remaining three state variables.  R = 8.314 J/(mol·K) for SI
 *              and 10.7316 psi·ft³/(lbmol·°R) for US customary units.
 *              Results are stored in $gas_P, $gas_V, $gas_n, and $gas_T.
 **************************************************************/
void run_idealgas(const char *args)
{
    double      pressure;
    double      volume;
    double      moles;
    double      temperature;
    int         havePressure;
    int         haveVolume;
    int         haveMoles;
    int         haveTemperature;
    char        solveTarget[4];
    int         useUsUnits;
    double      gasConstant;
    const char *unitLabel;
    double      solvedResult;
 
    pressure      = 0;
    volume        = 0;
    moles         = 0;
    temperature   = 0;
    havePressure  = 0;
    haveVolume    = 0;
    haveMoles     = 0;
    haveTemperature = 0;
    solveTarget[0] = '\0';
    useUsUnits    = args_have_us_units(args);
    gasConstant   = useUsUnits ? 10.7316 : 8.314;
    unitLabel     = useUsUnits ? "US  (psi, ft^3, lbmol, degR)"
                               : "SI  (Pa, m^3, mol, K)";
    solvedResult  = 0;
 
    parse_named_param(args, "P", &pressure,    &havePressure);
    parse_named_param(args, "V", &volume,      &haveVolume);
    parse_named_param(args, "n", &moles,       &haveMoles);
    parse_named_param(args, "T", &temperature, &haveTemperature);
    parse_named_string_param(args, "solve", solveTarget, sizeof(solveTarget));
 
    if (!solveTarget[0])
    {
        printf("  Usage: idealgas P=<> V=<> n=<> T=<> [units=si|us] solve=<P|V|n|T>\n");
        printf("  Supply the three known quantities plus solve= for the unknown.\n");
        printf("  R = %g  [%s]\n", gasConstant, unitLabel);
        return;
    }
 
    if (strcmp(solveTarget, "P") == 0)
    {
        if (!haveVolume || !haveMoles || !haveTemperature)
        {
            printf("  idealgas: need V, n, T to solve P\n"); return;
        }
        if (volume <= 0 || temperature <= 0)
        {
            printf("  idealgas: V and T must be > 0\n"); return;
        }
        solvedResult = pressure = moles * gasConstant * temperature / volume;
    }
    else if (strcmp(solveTarget, "V") == 0)
    {
        if (!havePressure || !haveMoles || !haveTemperature)
        {
            printf("  idealgas: need P, n, T to solve V\n"); return;
        }
        if (pressure <= 0 || temperature <= 0)
        {
            printf("  idealgas: P and T must be > 0\n"); return;
        }
        solvedResult = volume = moles * gasConstant * temperature / pressure;
    }
    else if (strcmp(solveTarget, "n") == 0)
    {
        if (!havePressure || !haveVolume || !haveTemperature)
        {
            printf("  idealgas: need P, V, T to solve n\n"); return;
        }
        if (temperature <= 0)
        {
            printf("  idealgas: T must be > 0\n"); return;
        }
        solvedResult = moles = pressure * volume / (gasConstant * temperature);
    }
    else if (strcmp(solveTarget, "T") == 0)
    {
        if (!havePressure || !haveVolume || !haveMoles)
        {
            printf("  idealgas: need P, V, n to solve T\n"); return;
        }
        if (moles <= 0)
        {
            printf("  idealgas: n must be > 0\n"); return;
        }
        solvedResult = temperature = pressure * volume / (moles * gasConstant);
    }
    else
    {
        printf("  idealgas: unknown solve target '%s'. Use P, V, n, or T\n", solveTarget);
        return;
    }
 
    printf("\n  Ideal Gas Law  PV = nRT  [%s]\n", unitLabel);
    printf("  ─────────────────────────────────────\n");
    printf("    R  (gas constant)     = %g\n", gasConstant);
    printf("    P  (pressure)         = %g\n", pressure);
    printf("    V  (volume)           = %g\n", volume);
    printf("    n  (moles / lbmol)    = %g\n", moles);
    printf("    T  (temperature)      = %g\n", temperature);
    printf("  Solved:  %s = %.6g\n", solveTarget, solvedResult);
    set_var("gas_P", pressure);
    set_var("gas_V", volume);
    set_var("gas_n", moles);
    set_var("gas_T", temperature);
    printf("  (results stored in $gas_P, $gas_V, $gas_n, $gas_T)\n\n");
}
