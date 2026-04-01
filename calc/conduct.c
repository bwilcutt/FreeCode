#include "conduct.h"

/*************************************************************
 * Function:    run_conduction
 * Input:       args (const char*) — the portion of the input line following
 *              the "conduction" command keyword; contains named parameters
 *              k=<val>, A=<val>, dT=<val>, L=<val>, and optional units=si|us
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Applies Fourier's Law of heat conduction: Q = k*A*dT/L.
 *              Also computes heat flux q = k*dT/L and thermal resistance Rth = L/(k*A).
 *              Results are stored in $cond_Q, $cond_flux, and $cond_Rth.
 **************************************************************/
void run_conduction(const char *args)
{
    double      thermalConductivity;
    double      crossSectionArea;
    double      tempDifference;
    double      slabThickness;
    int         haveConductivity;
    int         haveArea;
    int         haveTempDiff;
    int         haveThickness;
    int         useUsUnits;
    const char *unitLabel;
    double      heatFlowRate;
    double      heatFlux;
    double      thermalResistance;
 
    thermalConductivity = 0;
    crossSectionArea    = 0;
    tempDifference      = 0;
    slabThickness       = 0;
    haveConductivity    = 0;
    haveArea            = 0;
    haveTempDiff        = 0;
    haveThickness       = 0;
    heatFlowRate        = 0;
    heatFlux            = 0;
    thermalResistance   = 0;
    useUsUnits          = args_have_us_units(args);
    unitLabel           = useUsUnits
                        ? "US  (BTU/hr·ft·degF, ft^2, degF, ft -> BTU/hr)"
                        : "SI  (W/m·K, m^2, K, m -> W)";
 
    parse_named_param(args, "k",  &thermalConductivity, &haveConductivity);
    parse_named_param(args, "A",  &crossSectionArea,    &haveArea);
    parse_named_param(args, "dT", &tempDifference,      &haveTempDiff);
    parse_named_param(args, "L",  &slabThickness,       &haveThickness);
 
    if (!haveConductivity || !haveArea || !haveTempDiff || !haveThickness)
    {
        printf("  Usage: conduction k=<val> A=<val> dT=<val> L=<val> [units=si|us]\n");
        printf("    k  = thermal conductivity (W/m·K or BTU/hr·ft·degF)\n");
        printf("    A  = cross-sectional area perpendicular to flow\n");
        printf("    dT = temperature difference across the slab\n");
        printf("    L  = thickness in direction of heat flow\n");
        printf("  Common k (SI, W/m·K): copper=401, steel=50, concrete=1.7, glass=1.05\n");
        return;
    }
    if (thermalConductivity <= 0) { printf("  conduction: k must be > 0\n"); return; }
    if (crossSectionArea    <= 0) { printf("  conduction: A must be > 0\n"); return; }
    if (slabThickness       <= 0) { printf("  conduction: L must be > 0\n"); return; }
 
    heatFlowRate      = thermalConductivity * crossSectionArea * tempDifference / slabThickness;
    heatFlux          = thermalConductivity * tempDifference / slabThickness;
    thermalResistance = slabThickness / (thermalConductivity * crossSectionArea);
 
    printf("\n  Fourier's Law — Heat Conduction  [%s]\n", unitLabel);
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    k  (conductivity)     = %g\n",   thermalConductivity);
    printf("    A  (area)             = %g\n",   crossSectionArea);
    printf("    dT (temp difference)  = %g\n",   tempDifference);
    printf("    L  (thickness)        = %g\n",   slabThickness);
    printf("  Results\n");
    printf("    Qdot (heat flow rate) = %.4f\n", heatFlowRate);
    printf("    q    (heat flux)      = %.4f\n", heatFlux);
    printf("    Rth  (thermal resist) = %.4f\n", thermalResistance);
    set_var("cond_Q",   heatFlowRate);
    set_var("cond_flux", heatFlux);
    set_var("cond_Rth",  thermalResistance);
    printf("  (results stored in $cond_Q, $cond_flux, $cond_Rth)\n\n");
}
