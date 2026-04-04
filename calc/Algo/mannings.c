#include "mannings.h"
 
/*************************************************************
 * Function:    manning_print_roughness_table
 * Input:       void
 * Output:      void — table is printed to stdout
 * Description: Prints a formatted reference table of common Manning's n
 *              roughness coefficients for natural channels, constructed
 *              channels, and full-flow pipes.
 *              Called when the user types  manning ?  at the prompt.
 **************************************************************/
void manning_print_roughness_table()
{
    printf("\n"
        "  Manning's n — common roughness coefficients\n"
        "  ─────────────────────────────────────────────────────\n"
        "  Open channels (natural)\n"
        "    Clean, straight, full-bank river      0.025 – 0.033\n"
        "    Winding, some pools & shoals           0.033 – 0.045\n"
        "    Sluggish, weedy reaches                0.050 – 0.080\n"
        "    Mountain stream, rocky bed             0.040 – 0.070\n"
        "\n"
        "  Open channels (constructed)\n"
        "    Concrete, float finish                 0.013 – 0.015\n"
        "    Concrete, formed, no finish            0.014 – 0.017\n"
        "    Earth, clean & straight                0.018 – 0.025\n"
        "    Earth, winding, with grass             0.025 – 0.033\n"
        "    Rock cut, smooth & uniform             0.025 – 0.035\n"
        "    Riprap-lined channel                   0.023 – 0.035\n"
        "\n"
        "  Pipes (full flow)\n"
        "    Smooth concrete pipe                   0.011 – 0.013\n"
        "    Corrugated metal pipe                  0.019 – 0.027\n"
        "    Cast iron, uncoated                    0.013 – 0.015\n"
        "    PVC / HDPE, smooth                     0.009 – 0.011\n"
        "    Vitrified clay pipe                    0.011 – 0.015\n"
        "  ─────────────────────────────────────────────────────\n"
        "\n"
    );
}
 
/*************************************************************
 * Function:    run_manning
 * Input:       args (const char*) — the portion of the input line following
 *              the "manning" command keyword; contains named parameters of the
 *              form n=<val> R=<val> S=<val> and optional A=<val> D=<val>
 *              and units=si|us; passing "?" prints the roughness table instead
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Implements Manning's equation for uniform open-channel flow:
 *              V = (k/n) * R^(2/3) * S^(1/2), where k=1.0 for SI and 1.486 for US.
 *              Optionally computes discharge Q = V*A when flow area is supplied,
 *              and the Froude number Fr = V/sqrt(g*D) when hydraulic depth is supplied.
 *              Results are stored in $manning_V and optionally $manning_Q, $manning_Fr.
 **************************************************************/
void run_manning(const char *args)
{
    double      roughnessCoeff = 0;
    double      hydraulicRadius = 0;
    double      channelSlope = 0;
    double      flowArea = 0;
    double      hydraulicDepth = 0;
    int         haveRoughness = 0;
    int         haveRadius = 0;
    int         haveSlope = 0;
    int         haveArea = 0;
    int         haveDepth = 0;
    double      unitConvFactor = 0;
    double      flowVelocity = 0;
    const char *unitLabel = NULL;
    double      discharge = 0;
    double      gravity = 0;
    double      froudeNumber = 0;
 
    while (isspace(*args)) args++;

    if (*args == '?') {
        manning_print_roughness_table(); 
    } else {
    
        unitConvFactor = args_have_us_units(args) ? 1.486 : 1.0;
    
        parse_named_param(args, "n", &roughnessCoeff,  &haveRoughness);
        parse_named_param(args, "R", &hydraulicRadius, &haveRadius);
        parse_named_param(args, "S", &channelSlope,    &haveSlope);
        parse_named_param(args, "A", &flowArea,        &haveArea);
        parse_named_param(args, "D", &hydraulicDepth,  &haveDepth);
    
        if (!haveRoughness || !haveRadius || !haveSlope)
        {
            printf("  Usage: manning n=<val> R=<val> S=<val> [A=<val>] [D=<val>] [units=si|us]\n");
            printf("         manning ?    (roughness coefficient table)\n");
            return;
        }
        if (roughnessCoeff  <= 0) { printf("  Manning: n must be > 0\n"); return; }
        if (hydraulicRadius <= 0) { printf("  Manning: R must be > 0\n"); return; }
        if (channelSlope    <= 0) { printf("  Manning: S must be > 0\n"); return; }
    
        flowVelocity = (unitConvFactor / roughnessCoeff) *
                    pow(hydraulicRadius, 2.0/3.0) * sqrt(channelSlope);
        unitLabel    = (unitConvFactor > 1.0) ? "US customary (ft, ft/s, cfs)"
                                            : "SI (m, m/s, m³/s)";
    
        printf("\n  Manning's Equation  [%s]\n", unitLabel);
        printf("  ─────────────────────────────────────\n");
        printf("  Inputs\n");
        printf("    n (roughness)     = %g\n",   roughnessCoeff);
        printf("    R (hydraulic rad) = %g\n",   hydraulicRadius);
        printf("    S (slope)         = %g  (1 in %g)\n", channelSlope, 1.0 / channelSlope);
        printf("  Results\n");
        printf("    V (velocity)      = %.4f\n", flowVelocity);
        
        set_var("manning_V", flowVelocity);
        set_var("manning_n", roughnessCoeff);
        set_var("manning_R", hydraulicRadius);
        set_var("manning_S", channelSlope);
        set_var("manning_A", flowArea);
        set_var("manning_D", hydraulicDepth);
        set_var("manning_k", unitConvFactor);

        if (haveArea && flowArea > 0)
        {
            discharge = flowVelocity * flowArea;

            printf("    A (flow area)     = %g\n",   flowArea);
            printf("    Q (discharge)     = %.4f\n", discharge);
            set_var("manning_Q", discharge);
        }
    
        if (haveDepth && hydraulicDepth > 0)
        {
            gravity      = (unitConvFactor > 1.0) ? 32.174 : 9.81;
            froudeNumber = flowVelocity / sqrt(gravity * hydraulicDepth);

            printf("    D (hydraulic dep) = %g\n",   hydraulicDepth);
            printf("    Fr (Froude no.)   = %.4f  (%s)\n", froudeNumber,
                froudeNumber < 1.0 ? "subcritical" :
                froudeNumber > 1.0 ? "supercritical" : "critical");

            set_var("manning_Fr", froudeNumber);
        }
    
        printf("  (results stored in $manning_V");

        if (haveArea  && flowArea       > 0) 
            printf(", $manning_Q");

        if (haveDepth && hydraulicDepth > 0)    
            printf(", $manning_Fr");

        printf(")\n\n");
    }
}
 