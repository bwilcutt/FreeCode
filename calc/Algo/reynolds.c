#include "reynolds.h"
#include "parse.h"
 
/*************************************************************
 * Function:    run_reynolds
 * Input:       args (const char*) — the portion of the input line following
 *              the "reynolds" command keyword; contains named parameters of the
 *              form V=<val> D=<val> and either nu=<val> or rho=<val> mu=<val>
 * Output:      void — result is printed to stdout and stored in scalar variable $Re
 * Description: Computes the Reynolds number using either the kinematic viscosity
 *              form (Re = V*D/nu) or the dynamic viscosity form (Re = rho*V*D/mu).
 *              Classifies the resulting flow regime as laminar (Re < 2300),
 *              transitional (2300-4000), or turbulent (> 4000).
 *              The computed Re is stored in $Re for further use.
 **************************************************************/
void run_reynolds(const char *args)
{
    double      flowVelocity;
    double      characteristicLength;
    double      kinematicViscosity;
    double      fluidDensity;
    double      dynamicViscosity;
    int         haveVelocity;
    int         haveLength;
    int         haveKinematicVisc;
    int         haveDensity;
    int         haveDynamicVisc;
    double      reynoldsNumber;
    const char *flowRegime;
 
    flowVelocity         = 0;
    characteristicLength = 0;
    kinematicViscosity   = 0;
    fluidDensity         = 0;
    dynamicViscosity     = 0;
    haveVelocity         = 0;
    haveLength           = 0;
    haveKinematicVisc    = 0;
    haveDensity          = 0;
    haveDynamicVisc      = 0;
    reynoldsNumber       = 0;
    flowRegime           = NULL;
 
    parse_named_param(args, "V",   &flowVelocity,         &haveVelocity);
    parse_named_param(args, "D",   &characteristicLength, &haveLength);
    parse_named_param(args, "nu",  &kinematicViscosity,   &haveKinematicVisc);
    parse_named_param(args, "rho", &fluidDensity,         &haveDensity);
    parse_named_param(args, "mu",  &dynamicViscosity,     &haveDynamicVisc);
 
    if (!haveVelocity || !haveLength)
    {
        printf("  Usage: reynolds V=<val> D=<val> nu=<val>\n");
        printf("      or reynolds V=<val> D=<val> rho=<val> mu=<val>\n");
        printf("  Common nu (m²/s): water@20°C=1.004e-6, air@20°C=1.516e-5\n");
        return;
    }
 
    if (haveKinematicVisc && kinematicViscosity > 0)
    {
        reynoldsNumber = flowVelocity * characteristicLength / kinematicViscosity;
    }
    else if (haveDensity && haveDynamicVisc && dynamicViscosity > 0)
    {
        reynoldsNumber = fluidDensity * flowVelocity * characteristicLength / dynamicViscosity;
    }
    else
    {
        printf("  reynolds: provide nu=<kinematic viscosity>  OR  rho=<> mu=<>\n");
        return;
    }
 
    flowRegime = (reynoldsNumber < 2300) ? "laminar"
               : (reynoldsNumber < 4000) ? "transitional"
                                         : "turbulent";
 
    printf("\n  Reynolds Number\n");
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    V   (velocity)              = %g\n", flowVelocity);
    printf("    D   (characteristic length) = %g\n", characteristicLength);
    if (haveKinematicVisc)
        printf("    nu  (kinematic visc)        = %g\n", kinematicViscosity);
    else
    {
        printf("    rho (density)               = %g\n", fluidDensity);
        printf("    mu  (dynamic visc)          = %g\n", dynamicViscosity);
    }
    printf("  Result\n");
    printf("    Re                          = %.2f  (%s)\n", reynoldsNumber, flowRegime);
    set_var("Re", reynoldsNumber);
    printf("  (result stored in $Re)\n\n");
}
 