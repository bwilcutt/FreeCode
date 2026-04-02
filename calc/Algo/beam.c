#include "beam.h"

/*************************************************************
 * Function:    run_beam
 * Input:       args (const char*) — the portion of the input line following
 *              the "beam" command keyword; contains named parameters
 *              type=ss|cant, load=point|udl, P=<val> or w=<val>,
 *              L=<val>, E=<val>, and I=<val>
 * Output:      void — results are printed to stdout and stored in scalar variables
 * Description: Computes maximum deflection, maximum bending moment, and total
 *              reaction force for four beam configurations: simply supported with
 *              a center point load or UDL, and cantilever with a tip point load
 *              or UDL.  Classic closed-form formulae are used for each case.
 *              Results are stored in $beam_delta, $beam_Mmax, and $beam_R.
 **************************************************************/
void run_beam(const char *args)
{
    double      pointLoad = 0;
    double      distribLoad = 0;
    double      spanLength = 0;
    double      youngsModulus = 0;
    double      secondMomentArea = 0;
    double      limit360 = 0;
    int         havePointLoad = 0;
    int         haveDistribLoad = 0;
    int         haveSpanLength = 0;
    int         haveYoungsModulus = 0;
    int         haveSecondMoment = 0;
    char        beamType[8] = {};
    char        loadType[8] = {};
    int         isCantilever = 0;
    int         isUdl = 0;
    double      maxDeflection = 0;
    double      maxMoment = 0;
    double      totalReaction = 0;
    const char *typeLabel = NULL;
    const char *loadLabel = NULL;
    const char *momentLocationLabel = NULL;

    /* Defaults: simply supported, center point load */
    strcpy(beamType, "ss");
    strcpy(loadType, "point");

    parse_named_string_param(args, "type", beamType, sizeof(beamType));
    parse_named_string_param(args, "load", loadType, sizeof(loadType));
    parse_named_param(args, "P", &pointLoad,        &havePointLoad);
    parse_named_param(args, "w", &distribLoad,      &haveDistribLoad);
    parse_named_param(args, "L", &spanLength,       &haveSpanLength);
    parse_named_param(args, "E", &youngsModulus,    &haveYoungsModulus);
    parse_named_param(args, "I", &secondMomentArea, &haveSecondMoment);

    if (!haveSpanLength || !haveYoungsModulus || !haveSecondMoment)
    {
        printf("  Usage: beam type=ss|cant load=point|udl P=<>|w=<> L=<> E=<> I=<>\n");
        printf("    type: ss (simply supported, default) | cant (cantilever)\n");
        printf("    load: point (default, center/tip)    | udl  (uniform distributed)\n");
        printf("    P  = point load force\n");
        printf("    w  = distributed load per unit length\n");
        printf("    E  = Young's modulus\n");
        printf("    I  = second moment of area\n");
        return;
    }
    if (spanLength       <= 0) { printf("  beam: L must be > 0\n"); return; }
    if (youngsModulus    <= 0) { printf("  beam: E must be > 0\n"); return; }
    if (secondMomentArea <= 0) { printf("  beam: I must be > 0\n"); return; }

    isCantilever = (strcmp(beamType, "cant") == 0);
    isUdl        = (strcmp(loadType, "udl")  == 0);

    if ( isUdl && !haveDistribLoad)
    {
        printf("  beam: UDL requires w=<load per unit length>\n");
        return;
    }
    if (!isUdl && !havePointLoad)
    {
        printf("  beam: point load requires P=<force>\n");
        return;
    }

    if (!isCantilever && !isUdl)
    {
        /* Simply supported — center point load */
        maxDeflection = pointLoad * spanLength * spanLength * spanLength /
                        (48.0 * youngsModulus * secondMomentArea);
        maxMoment     = pointLoad * spanLength / 4.0;
        totalReaction = pointLoad;
    }
    else if (!isCantilever && isUdl)
    {
        /* Simply supported — UDL */
        maxDeflection = 5.0 * distribLoad * spanLength * spanLength *
                        spanLength * spanLength /
                        (384.0 * youngsModulus * secondMomentArea);
        maxMoment     = distribLoad * spanLength * spanLength / 8.0;
        totalReaction = distribLoad * spanLength;
    }
    else if (isCantilever && !isUdl)
    {
        /* Cantilever — tip point load */
        maxDeflection = pointLoad * spanLength * spanLength * spanLength /
                        (3.0 * youngsModulus * secondMomentArea);
        maxMoment     = pointLoad * spanLength;    /* at fixed end */
        totalReaction = pointLoad;
    }
    else
    {
        /* Cantilever — UDL */
        maxDeflection = distribLoad * spanLength * spanLength *
                        spanLength * spanLength /
                        (8.0 * youngsModulus * secondMomentArea);
        maxMoment     = distribLoad * spanLength * spanLength / 2.0;  /* at fixed end */
        totalReaction = distribLoad * spanLength;
    }

    typeLabel           = isCantilever ? "Cantilever"        : "Simply Supported";
    loadLabel           = isUdl        ? "Uniform Dist Load" : "Point Load";
    momentLocationLabel = isCantilever ? "at fixed end"      : "at midspan";

    printf("\n  Beam Deflection  [%s — %s]\n", typeLabel, loadLabel);
    printf("  ─────────────────────────────────────\n");
    printf("  Inputs\n");
    if (isUdl)
        printf("    w  (load / length)    = %g\n", distribLoad);
    else
        printf("    P  (point load)        = %g\n", pointLoad);
    printf("    L  (span)             = %g\n", spanLength);
    printf("    E  (Young's modulus)  = %g\n", youngsModulus);
    printf("    I  (2nd moment area)  = %g\n", secondMomentArea);
    printf("  Results\n");
    printf("    delta (max deflection)   = %.6g  (at %s)\n",
           maxDeflection, isCantilever ? "free end" : "midspan");
    printf("    M  (max moment)       = %.6g  (%s)\n", maxMoment, momentLocationLabel);
    printf("    R  (total reaction)   = %.6g\n", totalReaction);

    set_var("beam_delta", maxDeflection);
    set_var("beam_Mmax",  maxMoment);
    set_var("beam_R",     totalReaction);

    /* ── store inputs so GUI can reconstruct the diagram ── */
    set_var("beam_L",      spanLength);
    set_var("beam_P",      isUdl ? 0.0 : pointLoad);
    set_var("beam_w",      isUdl ? distribLoad : 0.0);
    set_var("beam_cant",   isCantilever ? 1.0 : 0.0);
    set_var("beam_udl",    isUdl        ? 1.0 : 0.0);

    printf("  (results stored in $beam_delta, $beam_Mmax, $beam_R)\n\n");

    limit360 = spanLength / 360.0;
    if (maxDeflection > limit360)
    {
        printf("  [!] WARNING: Deflection exceeds L/360 (Limit: %g)\n\n",
               limit360);
    }
}
