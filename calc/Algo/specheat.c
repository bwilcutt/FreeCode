#include "specheat.h"
 
/*************************************************************
 * Function:    run_specheat
 * Input:       args (const char*) — the portion of the input line following
 *              the "specificheat" command keyword; contains named parameters
 *              Q=<val>, m=<val>, c=<val>, dT=<val> and an optional
 *              solve=<Q|m|c|dT> target; omitting solve= defaults to solving Q
 *              when m, c, and dT are all provided
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Solves the calorimetry equation Q = m * c * dT for any one unknown
 *              given the remaining three values.
 *              Validates that divisor variables are non-zero before solving.
 *              Results are stored in $heat_Q, $heat_m, $heat_c, and $heat_dT.
 **************************************************************/
void run_specheat(const char *args)
{
    double heatEnergy;
    double mass;
    double specificHeat;
    double tempChange;
    int    haveHeatEnergy;
    int    haveMass;
    int    haveSpecificHeat;
    int    haveTempChange;
    char   solveTarget[4];
    double solvedResult;
 
    heatEnergy     = 0;
    mass           = 0;
    specificHeat   = 0;
    tempChange     = 0;
    haveHeatEnergy  = 0;
    haveMass        = 0;
    haveSpecificHeat = 0;
    haveTempChange  = 0;
    solveTarget[0] = '\0';
    solvedResult   = 0;
 
    parse_named_param(args, "Q",  &heatEnergy,   &haveHeatEnergy);
    parse_named_param(args, "m",  &mass,          &haveMass);
    parse_named_param(args, "c",  &specificHeat,  &haveSpecificHeat);
    parse_named_param(args, "dT", &tempChange,    &haveTempChange);
    parse_named_string_param(args, "solve", solveTarget, sizeof(solveTarget));
 
    /* Default: solve for Q when m, c, dT are all given */
    if (!solveTarget[0])
    {
        if (haveMass && haveSpecificHeat && haveTempChange)
        {
            strcpy(solveTarget, "Q");
        }
        else
        {
            printf("  Usage: specificheat m=<> c=<> dT=<>               (solves Q)\n");
            printf("      or specificheat solve=<Q|m|c|dT> with three known values\n");
            printf("  Common c (SI, J/kg·K): water=4186, steel=490, aluminium=900, copper=385\n");
            return;
        }
    }
 
    if (strcmp(solveTarget, "Q") == 0)
    {
        if (!haveMass || !haveSpecificHeat || !haveTempChange)
        {
            printf("  specificheat: need m, c, dT to solve Q\n");
            return;
        }
        solvedResult = heatEnergy = mass * specificHeat * tempChange;
    }
    else if (strcmp(solveTarget, "m") == 0)
    {
        if (!haveHeatEnergy || !haveSpecificHeat || !haveTempChange)
        {
            printf("  specificheat: need Q, c, dT to solve m\n");
            return;
        }
        if (specificHeat == 0 || tempChange == 0)
        {
            printf("  specificheat: c and dT must be non-zero\n");
            return;
        }
        solvedResult = mass = heatEnergy / (specificHeat * tempChange);
    }
    else if (strcmp(solveTarget, "c") == 0)
    {
        if (!haveHeatEnergy || !haveMass || !haveTempChange)
        {
            printf("  specificheat: need Q, m, dT to solve c\n");
            return;
        }
        if (mass == 0 || tempChange == 0)
        {
            printf("  specificheat: m and dT must be non-zero\n");
            return;
        }
        solvedResult = specificHeat = heatEnergy / (mass * tempChange);
    }
    else if (strcmp(solveTarget, "dT") == 0)
    {
        if (!haveHeatEnergy || !haveMass || !haveSpecificHeat)
        {
            printf("  specificheat: need Q, m, c to solve dT\n");
            return;
        }
        if (mass == 0 || specificHeat == 0)
        {
            printf("  specificheat: m and c must be non-zero\n");
            return;
        }
        solvedResult = tempChange = heatEnergy / (mass * specificHeat);
    }
    else
    {
        printf("  specificheat: unknown solve target '%s'. Use Q, m, c, or dT\n", solveTarget);
        return;
    }
 
    printf("\n  Specific Heat  Q = mc * dT\n");
    printf("  ─────────────────────────────────────\n");
    printf("    Q  (heat energy)      = %g\n", heatEnergy);
    printf("    m  (mass)             = %g\n", mass);
    printf("    c  (specific heat)    = %g\n", specificHeat);
    printf("    dT (temp change)      = %g\n", tempChange);
    printf("  Solved:  %s = %.6g\n", solveTarget, solvedResult);
    set_var("heat_Q",  heatEnergy);
    set_var("heat_m",  mass);
    set_var("heat_c",  specificHeat);
    set_var("heat_dT", tempChange);
    printf("  (results stored in $heat_Q, $heat_m, $heat_c, $heat_dT)\n\n");
}
 