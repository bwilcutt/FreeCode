#include "stress.h"
 
/*************************************************************
 * Function:    run_stress
 * Input:       args (const char*) — the portion of the input line following
 *              the "stress" command keyword; contains named parameters
 *              F=<val>, A=<val>, and optionally E=<val> and L=<val>
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Computes axial normal stress sigma = F/A.
 *              If Young's modulus E is provided, also computes axial strain
 *              epsilon = sigma/E.  If member length L is additionally provided,
 *              computes axial deformation delta = epsilon * L.
 *              Results are stored in $stress_sigma, $stress_eps, $stress_delta.
 *              Inputs are always stored in $stress_F, $stress_A, $stress_E,
 *              $stress_L (0 when not provided) so the GUI diagram can read them.
 **************************************************************/
void run_stress(const char *args)
{
    double axialForce        = 0;
    double crossSectionArea  = 0;
    double youngsModulus     = 0;
    double memberLength      = 0;
    int    haveForce         = 0;
    int    haveArea          = 0;
    int    haveModulus       = 0;
    int    haveLength        = 0;
    double axialStress       = 0;
    double axialStrain       = 0;
    double axialDeformation  = 0;
 
    parse_named_param(args, "F", &axialForce,       &haveForce);
    parse_named_param(args, "A", &crossSectionArea, &haveArea);
    parse_named_param(args, "E", &youngsModulus,    &haveModulus);
    parse_named_param(args, "L", &memberLength,     &haveLength);
 
    if (!haveForce || !haveArea)
    {
        printf("  Usage: stress F=<val> A=<val> [E=<val>] [L=<val>]\n");
        printf("  F = axial force, A = cross-section area\n");
        printf("  Add E (Young's modulus) to get strain; also add L for deformation.\n");
        return;
    }
    if (crossSectionArea == 0) { printf("  stress: A must not be zero\n"); return; }
 
    axialStress = axialForce / crossSectionArea;
 
    printf("\n  Axial Stress / Strain\n");
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    F  (axial force)      = %g\n", axialForce);
    printf("    A  (cross-section)    = %g\n", crossSectionArea);
    printf("  Results\n");
    printf("    sigma (axial stress)  = %.6g\n", axialStress);
 
    /* ── always store inputs so GUI diagram can read them ── */
    set_var("stress_F",     axialForce);
    set_var("stress_A",     crossSectionArea);
    set_var("stress_E",     haveModulus ? youngsModulus : 0.0);
    set_var("stress_L",     haveLength  ? memberLength  : 0.0);
 
    /* ── always store results (0 when not computed) ── */
    set_var("stress_sigma", axialStress);
    set_var("stress_eps",   0.0);
    set_var("stress_delta", 0.0);
 
    if (haveModulus && youngsModulus != 0)
    {
        axialStrain = axialStress / youngsModulus;
        printf("    E  (Young's modulus)  = %g\n", youngsModulus);
        printf("    eps (axial strain)    = %.6g\n", axialStrain);
        set_var("stress_eps", axialStrain);
 
        if (haveLength)
        {
            axialDeformation = axialStrain * memberLength;
            printf("    L  (member length)    = %g\n", memberLength);
            printf("    delta (deformation)   = %.6g\n", axialDeformation);
            set_var("stress_delta", axialDeformation);
        }
    }
 
    printf("  (results stored in $stress_sigma");
    if (haveModulus && youngsModulus != 0)              printf(", $stress_eps");
    if (haveModulus && youngsModulus != 0 && haveLength) printf(", $stress_delta");
    printf(")\n\n");
}