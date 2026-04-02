#include "mohr.h"

/*************************************************************
 * Function:    run_mohrs
 * Input:       args (const char*) — the portion of the input line following
 *              the "mohrs" command keyword; contains named parameters of the
 *              form sx=<val> sy=<val> txy=<val> representing the 2-D stress
 *              state on an element
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Computes Mohr's circle quantities for a 2-D stress element.
 *              Calculates the average normal stress, circle radius, maximum and
 *              minimum principal stresses, maximum shear stress, and the angle
 *              to the principal plane in degrees.
 *              Results are stored in $mohrs_s1, $mohrs_s2, $mohrs_tmax,
 *              $mohrs_theta, $mohrs_sx, $mohrs_sy, $mohrs_txy.
 *              The sx/sy/txy inputs are also stored so the GUI can reconstruct
 *              the original stress points on the Mohr's Circle diagram.
 **************************************************************/
void run_mohrs(const char *args)
{
    double normalStressX = 0;
    double normalStressY = 0;
    double shearStressXY = 0;
    int    haveNormalX = 0;
    int    haveNormalY = 0;
    int    haveShearXY = 0;
    double averageNormalStress = 0;
    double circleRadius = 0;
    double maxPrincipalStress = 0;
    double minPrincipalStress = 0;
    double maxShearStress = 0;
    double principalAngleDeg = 0;

    parse_named_param(args, "sx",  &normalStressX,  &haveNormalX);
    parse_named_param(args, "sy",  &normalStressY,  &haveNormalY);
    parse_named_param(args, "txy", &shearStressXY,  &haveShearXY);

    if (!haveNormalX || !haveNormalY || !haveShearXY)
    {
        printf("  Usage: mohrs sx=<val> sy=<val> txy=<val>\n");
        printf("    sx  = normal stress on x-face\n");
        printf("    sy  = normal stress on y-face\n");
        printf("    txy = shear stress on x-face (positive = CCW)\n");
        return;
    }

    averageNormalStress = (normalStressX + normalStressY) / 2.0;
    circleRadius        = sqrt(((normalStressX - normalStressY) / 2.0) *
                               ((normalStressX - normalStressY) / 2.0) +
                               shearStressXY * shearStressXY);
    maxPrincipalStress  = averageNormalStress + circleRadius;
    minPrincipalStress  = averageNormalStress - circleRadius;
    maxShearStress      = circleRadius;
    principalAngleDeg   = 0.5 * atan2(2.0 * shearStressXY,
                                      normalStressX - normalStressY)
                          * 180.0 / M_PI;

    printf("\n  Mohr's Circle\n");
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    printf("    sx  (x normal stress) = %g\n",   normalStressX);
    printf("    sy  (y normal stress) = %g\n",   normalStressY);
    printf("    txy (shear stress)    = %g\n",   shearStressXY);
    printf("  Results\n");
    printf("    s_avg  (circle centre)= %.4f\n", averageNormalStress);
    printf("    R      (radius)       = %.4f\n", circleRadius);
    printf("    s1     (max principal)= %.4f\n", maxPrincipalStress);
    printf("    s2     (min principal)= %.4f\n", minPrincipalStress);
    printf("    tmax   (max shear)    = %.4f\n", maxShearStress);
    printf("    theta  (principal angle) = %.4f deg  (from x-axis)\n",
           principalAngleDeg);

    /* ── store results ── */
    set_var("mohrs_s1",    maxPrincipalStress);
    set_var("mohrs_s2",    minPrincipalStress);
    set_var("mohrs_tmax",  maxShearStress);
    set_var("mohrs_theta", principalAngleDeg);

    /* ── store inputs so GUI can plot original stress points ── */
    set_var("mohrs_sx",    normalStressX);
    set_var("mohrs_sy",    normalStressY);
    set_var("mohrs_txy",   shearStressXY);

    printf("  (results stored in $mohrs_s1, $mohrs_s2, $mohrs_tmax,\n");
    printf("   $mohrs_theta, $mohrs_sx, $mohrs_sy, $mohrs_txy)\n\n");
}
