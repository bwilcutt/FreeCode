/* =============================================================================
 * File:         schrodinger.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-20
 * Description:  1D time-independent Schrodinger equation — bound states of a
 *               particle in any potential V(x), inside a box from xmin to xmax.
 *
 *               Method (finite differences)
 *                 N interior grid points, h = (xmax - xmin) / (N + 1),
 *                 psi = 0 on both box walls.  With c = hbar^2 / 2m,
 *                     -c psi''  ~  -c (psi[i-1] - 2 psi[i] + psi[i+1]) / h^2
 *                 so the Hamiltonian is a symmetric tridiagonal matrix:
 *                     diagonal      2c/h^2 + V(x_i)
 *                     off-diagonal  -c/h^2
 *                 Its eigenvalues are the energy levels and its eigenvectors
 *                 the wavefunctions.
 *                   1. Energies: mat_eig_tridiag() without eigenvectors —
 *                      fast even for thousands of grid points.
 *                   2. Wavefunctions: inverse iteration, only for the n
 *                      states asked for.  Asking QL for all N eigenvectors
 *                      and throwing away N - n of them is the expensive way
 *                      to be thorough.
 *
 *               Re-uses from the rest of parse:
 *                 mat_eig_tridiag()      energies (matrix.c)
 *                 parse_comparison()     every number and the V formula
 *                 set_var / set_mat_var  result storage
 *                 vf_linspace()          the x grid
 *
 *               Parameters are separated by commas, not spaces, so a
 *               formula can be written naturally:
 *                   schrodinger V=0.5*$x^2 + 0.1*pow($x,4), n=8
 *               A comma inside parentheses belongs to the formula.
 *
 *               Limits:
 *                 - 1D, time-independent, one particle.
 *                 - Accuracy goes as h^2: halve the spacing (double N), and
 *                   the error in the energies drops by about four.
 *                 - Everything lives in a box.  States the potential cannot
 *                   hold by itself are reported, so they are not mistaken
 *                   for real bound states.
 * ============================================================================= */

#include "schrodinger.h"
#include "matrix.h"
#include "mathfuncs.h"

/* The scalar parser's cursor and entry point (defined in parse.c), and the
   scalar variable list — used to evaluate V(x) at each grid point and to put
   the user's $x back afterwards. */
extern const char *expr;
extern Variable   *vars;
double parse_comparison();

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

#define SCH_N_DEFAULT     1000      /* interior grid points                        */
#define SCH_N_MIN         50        /* fewer than this and the wiggles get jagged  */
#define SCH_N_MAX         5000      /* about half a second; past this, coffee time */
#define SCH_STATES_DEF    5         /* states to report                            */
#define SCH_STATES_MAX    50        /* more than this is a spectrum, not a table   */
#define SCH_XMIN_DEFAULT  -5.0
#define SCH_XMAX_DEFAULT   5.0
#define SCH_INV_ITERS     5         /* inverse-iteration passes per state; 3 is    */
                                    /* not enough for close pairs (double wells)  */
#define SCH_FIELD_LEN     256       /* longest single parameter text               */

/* hbar^2 / 2 m_e in eV nm^2 — the one constant needed for real electrons */
#define SCH_C_EV_NM2      0.0380998212

/* Potential presets */
enum
{
    SCH_FORMULA = 0,
    SCH_WELL,
    SCH_HARMONIC,
    SCH_FINITE,
    SCH_BARRIER,
    SCH_DOUBLE
};

/*************************************************************
 * Function:    sch_get_field
 * Input:       args   (const char*) — text after the "schrodinger" keyword
 *              key    (const char*) — parameter name to find, e.g. "xmin"
 *              out    (char*)       — receives the value text, trimmed
 *              outLen (int)         — size of out, including the '\0'
 * Output:      int — 1 if key was found, 0 if not
 * Description: Splits args into comma-separated fields and returns the text
 *              after "key=" in the field whose name matches exactly.
 *              Commas inside ( ) or [ ] are part of a value, not separators,
 *              so pow($x,2) survives intact.
 **************************************************************/
static int sch_get_field(const char *args, const char *key, char *out, int outLen)
{
    const char *fieldStart = args;
    const char *scanPtr    = args;
    int         depth      = 0;

    while (1)
    {
        /* Find the end of this field: a top-level comma or the end of line. */
        if (*scanPtr == '(' || *scanPtr == '[') depth++;
        if ((*scanPtr == ')' || *scanPtr == ']') && depth > 0) depth--;

        if (*scanPtr == '\0' || *scanPtr == '\n' || (*scanPtr == ',' && depth == 0))
        {
            const char *nameStart = fieldStart;
            const char *nameEnd;
            const char *equalSign;
            size_t      keyLen = strlen(key);

            /* The field's name is everything before its first '=', trimmed. */
            while (nameStart < scanPtr && isspace(*nameStart)) nameStart++;
            equalSign = nameStart;
            while (equalSign < scanPtr && *equalSign != '=') equalSign++;
            nameEnd = equalSign;
            while (nameEnd > nameStart && isspace(nameEnd[-1])) nameEnd--;

            if (equalSign < scanPtr &&
                (size_t)(nameEnd - nameStart) == keyLen &&
                strncmp(nameStart, key, keyLen) == 0)
            {
                /* Copy the value, minus the spaces around it. */
                const char *valStart = equalSign + 1;
                const char *valEnd   = scanPtr;
                int         len;

                while (valStart < valEnd && isspace(*valStart))  valStart++;
                while (valEnd > valStart && isspace(valEnd[-1])) valEnd--;
                len = (int)(valEnd - valStart);
                if (len > outLen - 1) len = outLen - 1;
                memcpy(out, valStart, (size_t)len);
                out[len] = '\0';
                return 1;
            }

            if (*scanPtr == '\0' || *scanPtr == '\n') return 0;
            fieldStart = scanPtr + 1;
        }
        scanPtr++;
    }
}

/*************************************************************
 * Function:    sch_eval_text
 * Input:       text   (const char*) — a scalar expression
 *              outVal (double*)     — receives its value
 * Output:      int — 1 if the whole text was read as an expression, 0 if
 *              something was left over (a typo, usually)
 * Description: Runs text through parse's own scalar parser, so every
 *              number and the V formula accept full expressions and $vars.
 **************************************************************/
static int sch_eval_text(const char *text, double *outVal)
{
    expr    = text;
    *outVal = parse_comparison();

    /* Anything the parser did not use means it did not understand it. */
    while (isspace(*expr)) expr++;
    return (*expr == '\0');
}

/*************************************************************
 * Function:    sch_get_number
 * Input:       args   (const char*) — text after the "schrodinger" keyword
 *              key    (const char*) — parameter name
 *              outVal (double*)     — receives the value; untouched if absent
 * Output:      int — 1 found, 0 absent, -1 present but unreadable
 * Description: Comma-field lookup plus expression evaluation in one call.
 **************************************************************/
static int sch_get_number(const char *args, const char *key, double *outVal)
{
    char text[SCH_FIELD_LEN];

    if (!sch_get_field(args, key, text, sizeof(text))) return 0;
    if (!sch_eval_text(text, outVal))
    {
        printf("  schrodinger: could not understand %s=%s\n", key, text);
        return -1;
    }
    return 1;
}

/*************************************************************
 * Function:    sch_preset
 * Input:       name (const char*) — the text after V=
 * Output:      int — one of the SCH_* preset codes; SCH_FORMULA if the
 *              text is not a preset name
 **************************************************************/
static int sch_preset(const char *name)
{
    if (strcmp(name, "well")     == 0) return SCH_WELL;
    if (strcmp(name, "harmonic") == 0) return SCH_HARMONIC;
    if (strcmp(name, "finite")   == 0) return SCH_FINITE;
    if (strcmp(name, "barrier")  == 0) return SCH_BARRIER;
    if (strcmp(name, "double")   == 0) return SCH_DOUBLE;
    return SCH_FORMULA;
}

/*************************************************************
 * Function:    sch_preset_value
 * Input:       preset (int)    — SCH_* preset code (not SCH_FORMULA)
 *              x      (double) — position
 *              V0     (double) — depth / height
 *              a      (double) — width (finite, barrier) or minimum
 *                                position (double)
 *              k      (double) — spring constant (harmonic)
 * Output:      double — V(x)
 **************************************************************/
static double sch_preset_value(int preset, double x, double V0, double a, double k)
{
    double q;

    switch (preset)
    {
        case SCH_HARMONIC: return 0.5 * k * x * x;
        case SCH_FINITE:   return (fabs(x) < 0.5 * a) ? -V0 : 0.0;
        case SCH_BARRIER:  return (fabs(x) < 0.5 * a) ?  V0 : 0.0;
        case SCH_DOUBLE:   q = (x / a) * (x / a) - 1.0; return V0 * q * q;
        default:           return 0.0;   /* SCH_WELL: flat floor, the box does the rest */
    }
}

/*************************************************************
 * Function:    sch_inverse_iteration
 * Input:       diag   (const double*) — N diagonal entries of H
 *              off    (double)        — the (constant) off-diagonal entry
 *              N      (int)           — grid points
 *              energy (double)        — the eigenvalue whose vector is wanted
 *              psiAll (Matrix*)       — N x nStates; columns 0..col-1 already
 *                                       hold earlier states
 *              col    (int)           — column to fill
 *              work   (double*)       — scratch, 3*N doubles
 * Output:      void — column col of psiAll gets a unit eigenvector
 * Description: Solves (H - sigma I) y = b a few times with sigma just off
 *              the eigenvalue; each solve multiplies the wanted component
 *              by about 1/(E - sigma) and everything else by far less, so
 *              a handful of passes leave only the wanted state.  The
 *              tridiagonal solve is the Thomas algorithm, with near-zero
 *              pivots nudged off zero (EISPACK's trick) because sigma sits
 *              on the eigenvalue on purpose.  Each pass is also made
 *              orthogonal to the earlier states, which keeps nearly
 *              degenerate pairs (deep double wells) from collapsing into
 *              the same vector.
 **************************************************************/
static void sch_inverse_iteration(const double *diag, double off, int N,
                                  double energy, Matrix *psiAll, int col,
                                  double *work)
{
    double *pivot = work;           /* eliminated diagonal         */
    double *vec   = work + N;       /* current vector              */
    double *rhs   = work + 2 * N;   /* right-hand side being solved */
    double  scale = 0.0;
    double  sigma;
    double  tiny;
    double  norm;
    double  dot;
    int     i;
    int     pass;
    int     prev;

    /* Size of the matrix, for "small" tests and the shift. */
    for (i = 0; i < N; i++)
        if (fabs(diag[i]) + 2.0 * fabs(off) > scale)
            scale = fabs(diag[i]) + 2.0 * fabs(off);
    sigma = energy - 1e-10 * (fabs(energy) + scale);
    tiny  = 1e-14 * scale;

    /* Forward elimination of (H - sigma I) — done once, reused each pass. */
    pivot[0] = diag[0] - sigma;
    if (fabs(pivot[0]) < tiny) pivot[0] = tiny;
    for (i = 1; i < N; i++)
    {
        pivot[i] = (diag[i] - sigma) - off * off / pivot[i - 1];
        if (fabs(pivot[i]) < tiny) pivot[i] = tiny;
    }

    /* Starting guess: deliberately lopsided, so it is not exactly orthogonal
       to the odd states of a symmetric potential. */
    for (i = 0; i < N; i++)
        vec[i] = 1.0 + 0.5 * sin(0.7 * i + 0.3);

    for (pass = 0; pass < SCH_INV_ITERS; pass++)
    {
        /* Forward substitution, then back substitution. */
        rhs[0] = vec[0];
        for (i = 1; i < N; i++)
            rhs[i] = vec[i] - off * rhs[i - 1] / pivot[i - 1];
        vec[N - 1] = rhs[N - 1] / pivot[N - 1];
        for (i = N - 2; i >= 0; i--)
            vec[i] = (rhs[i] - off * vec[i + 1]) / pivot[i];

        /* Remove any trace of the states already found. */
        for (prev = 0; prev < col; prev++)
        {
            dot = 0.0;
            for (i = 0; i < N; i++) dot += vec[i] * MAT(psiAll, i, prev);
            for (i = 0; i < N; i++) vec[i] -= dot * MAT(psiAll, i, prev);
        }

        /* Back to unit length before the numbers wander off to infinity. */
        norm = 0.0;
        for (i = 0; i < N; i++) norm += vec[i] * vec[i];
        norm = sqrt(norm);
        for (i = 0; i < N; i++) vec[i] /= norm;
    }

    /* Same sign rule as mat_eig_sym: biggest component positive, so plots
       do not flip upside down from one run to the next. */
    {
        int bigIdx = 0;
        for (i = 1; i < N; i++)
            if (fabs(vec[i]) > fabs(vec[bigIdx])) bigIdx = i;
        if (vec[bigIdx] < 0)
            for (i = 0; i < N; i++) vec[i] = -vec[i];
    }

    for (i = 0; i < N; i++) MAT(psiAll, i, col) = vec[i];
}

/*************************************************************
 * Function:    schrodinger_usage
 * Input:       void
 * Output:      void — usage text printed to stdout
 * Description: Shown for "schrodinger ?" and when V= is missing.
 **************************************************************/
static void schrodinger_usage(void)
{
    printf("\n  Schrodinger equation — 1D bound states\n");
    printf("  ──────────────────────────────────────────────────────────\n");
    printf("  schrodinger V=<preset or formula>, [xmin=<>], [xmax=<>], [n=<>],\n");
    printf("              [N=<grid>], [m=<mass>], [units=au|ev], [V0=<>], [a=<>], [k=<>]\n");
    printf("\n");
    printf("  Separate the settings with commas.  A formula uses $x for position:\n");
    printf("    schrodinger V=0.5*$x^2 + 0.1*pow($x,4), xmin=-6, xmax=6, n=8\n");
    printf("\n");
    printf("  Presets:\n");
    printf("    well      infinite square well (the box from xmin to xmax)\n");
    printf("    harmonic  0.5*k*x^2                      (k, default 1)\n");
    printf("    finite    finite square well             (depth V0, width a)\n");
    printf("    barrier   square barrier inside the box  (height V0, width a)\n");
    printf("    double    double well V0*((x/a)^2-1)^2   (V0, minima at +-a)\n");
    printf("\n");
    printf("  n is the number of states (default %d, up to %d).  N is the number\n",
           SCH_STATES_DEF, SCH_STATES_MAX);
    printf("  of grid points (default %d).  The box runs from xmin to xmax\n",
           SCH_N_DEFAULT);
    printf("  (default %g to %g); the wavefunction is zero at both ends.\n",
           SCH_XMIN_DEFAULT, SCH_XMAX_DEFAULT);
    printf("  units=au (default): hbar = 1 and m = 1.  units=ev: x in nm, energies\n");
    printf("  in eV, m in electron masses.  Your own $x is put back afterwards.\n");
    printf("\n");
    printf("    -> $schrod_E0 $schrod_n $schrod_nbound $schrod_err\n");
    printf("    -> $schrod_E  [n x 1]   energies, lowest first\n");
    printf("    -> $schrod_x  $schrod_V  [N x 1]   grid and potential\n");
    printf("    -> $schrod_psi  $schrod_prob  [N x n]   wavefunctions, psi^2\n");
    printf("  ──────────────────────────────────────────────────────────\n\n");
}

/*************************************************************
 * Function:    run_schrodinger
 * Input:       args (const char*) — text following the "schrodinger" keyword
 * Output:      void — results printed and stored in $schrod_* variables
 * Description: Reads the settings, builds the potential on the grid, finds
 *              the lowest energies and their wavefunctions, compares with the
 *              exact answer where one exists, and stores everything.
 **************************************************************/
void run_schrodinger(const char *args)
{
    char      vText[SCH_FIELD_LEN];
    char      unitText[16]  = "au";
    double    xmin          = SCH_XMIN_DEFAULT;
    double    xmax          = SCH_XMAX_DEFAULT;
    double    nStates_d     = SCH_STATES_DEF;
    double    N_d           = SCH_N_DEFAULT;
    double    mass          = 1.0;
    double    V0            = 10.0;
    double    a             = 0.0;          /* 0 = "use this preset's default" */
    double    k             = 1.0;
    int       preset;
    int       evUnits;
    int       N;
    int       nStates;
    int       nBound        = 0;
    int       i;
    double    c;
    double    h;
    double    off;
    double    vEdge;
    double    err           = -1.0;
    double    exact;
    double    savedX        = 0.0;
    int       hadX          = 0;
    double   *diag;
    double   *offArr;
    double   *work;
    Variable *varNode;
    Matrix   *xVec;
    Matrix   *vVec;
    Matrix   *eAll          = NULL;
    Matrix   *eVec;
    Matrix   *psi;
    Matrix   *prob;

    /* ── "schrodinger ?" ── */
    while (isspace(*args)) args++;
    if (*args == '?') { schrodinger_usage(); return; }

    /* ── the potential is the one thing that has to be there ── */
    if (!sch_get_field(args, "V", vText, sizeof(vText)) || vText[0] == '\0')
    {
        printf("  schrodinger: no potential.  Give V= a preset name or a formula in $x.\n");
        schrodinger_usage();
        return;
    }
    preset = sch_preset(vText);

    /* ── everything else is optional; a typo stops the run rather than
          quietly solving the wrong problem ── */
    if (sch_get_number(args, "xmin", &xmin)      < 0) return;
    if (sch_get_number(args, "xmax", &xmax)      < 0) return;
    if (sch_get_number(args, "n",    &nStates_d) < 0) return;
    if (sch_get_number(args, "N",    &N_d)       < 0) return;
    if (sch_get_number(args, "m",    &mass)      < 0) return;
    if (sch_get_number(args, "V0",   &V0)        < 0) return;
    if (sch_get_number(args, "a",    &a)         < 0) return;
    if (sch_get_number(args, "k",    &k)         < 0) return;
    sch_get_field(args, "units", unitText, sizeof(unitText));
    evUnits = (strcmp(unitText, "ev") == 0 || strcmp(unitText, "eV") == 0);

    /* Preset widths: a square well of width 2, a barrier of width 1, and
       double-well minima at +-1.5 unless told otherwise. */
    if (a <= 0.0)
        a = (preset == SCH_BARRIER) ? 1.0 : (preset == SCH_DOUBLE) ? 1.5 : 2.0;

    if (xmax <= xmin)
    {
        printf("  schrodinger: xmax must be larger than xmin.\n");
        return;
    }
    if (mass <= 0.0)
    {
        printf("  schrodinger: the mass m must be greater than zero.\n");
        return;
    }

    N = (int)N_d;
    if (N < SCH_N_MIN) N = SCH_N_MIN;
    if (N > SCH_N_MAX) N = SCH_N_MAX;
    nStates = (int)nStates_d;
    if (nStates < 1)              nStates = 1;
    if (nStates > SCH_STATES_MAX) nStates = SCH_STATES_MAX;

    /* ── kinetic coefficient c = hbar^2/2m, and the grid ── */
    c   = (evUnits ? SCH_C_EV_NM2 : 0.5) / mass;
    h   = (xmax - xmin) / (N + 1);
    off = -c / (h * h);

    xVec   = vf_linspace(xmin + h, xmax - h, N);
    vVec   = mat_new(N, 1);
    diag   = malloc((size_t)N * sizeof(double));
    offArr = malloc((size_t)N * sizeof(double));

    /* ── the potential at every grid point ── */
    if (preset == SCH_FORMULA)
    {
        /* The formula reads $x, so park the user's own $x (if any) first.
           Walking the list directly avoids get_var's "unknown" message. */
        for (varNode = vars; varNode; varNode = varNode->next)
            if (strcmp(varNode->name, "x") == 0) { savedX = varNode->value; hadX = 1; break; }

        for (i = 0; i < N; i++)
        {
            set_var("x", xVec->data[i]);
            if (!sch_eval_text(vText, &vVec->data[i]) && i == 0)
            {
                /* Checked on the first point only: one complaint is plenty. */
                printf("  schrodinger: could not understand the formula V=%s\n", vText);
                if (hadX) set_var("x", savedX);
                mat_free(xVec); mat_free(vVec); free(diag); free(offArr);
                return;
            }
            if (isnan(vVec->data[i]) || isinf(vVec->data[i]))
            {
                printf("  schrodinger: the formula gives no number at x = %g\n",
                       xVec->data[i]);
                printf("               (dividing by zero, or a log of zero?)\n");
                if (hadX) set_var("x", savedX);
                mat_free(xVec); mat_free(vVec); free(diag); free(offArr);
                return;
            }
        }
        if (hadX) set_var("x", savedX);
    }
    else
    {
        for (i = 0; i < N; i++)
            vVec->data[i] = sch_preset_value(preset, xVec->data[i], V0, a, k);
    }

    /* ── Hamiltonian: tridiagonal, constant off-diagonal ── */
    for (i = 0; i < N; i++)
    {
        diag[i]   = 2.0 * c / (h * h) + vVec->data[i];
        offArr[i] = off;
    }
    if (nStates > N) nStates = N;

    printf("\n  Schrodinger Equation — 1D Bound States\n");
    printf("  ──────────────────────────────────────────────\n");
    printf("  V = %s", vText);
    if (preset == SCH_HARMONIC)                         printf("  (k = %g)", k);
    if (preset == SCH_FINITE || preset == SCH_BARRIER)  printf("  (V0 = %g, a = %g)", V0, a);
    if (preset == SCH_DOUBLE)                           printf("  (V0 = %g, a = %g)", V0, a);
    printf("\n");
    printf("  box %g to %g %s   grid = %d   mass = %g\n",
           xmin, xmax, evUnits ? "nm" : "", N, mass);
    printf("  solving ...\n");
    fflush(stdout);

    /* ── 1. energies (all N come back; only the lowest few are kept) ── */
    if (mat_eig_tridiag(diag, offArr, N, &eAll, NULL) != 0)
    {
        mat_free(xVec); mat_free(vVec); free(diag); free(offArr);
        return;
    }
    eVec = mat_new(nStates, 1);
    for (i = 0; i < nStates; i++) eVec->data[i] = eAll->data[i];
    mat_free(eAll);

    /* ── 2. wavefunctions, one inverse iteration per state ── */
    psi  = mat_new(N, nStates);
    work = malloc((size_t)3 * N * sizeof(double));
    for (i = 0; i < nStates; i++)
        sch_inverse_iteration(diag, off, N, eVec->data[i], psi, i, work);
    free(work);
    free(diag);
    free(offArr);

    /* Unit vectors -> wavefunctions with integral psi^2 dx = 1, plus psi^2. */
    prob = mat_new(N, nStates);
    {
        int    col;
        double rescale = 1.0 / sqrt(h);
        for (i = 0; i < N; i++)
            for (col = 0; col < nStates; col++)
            {
                MAT(psi,  i, col) *= rescale;
                MAT(prob, i, col)  = MAT(psi, i, col) * MAT(psi, i, col);
            }
    }

    /* ── is it the potential holding a state, or just the box walls?
          If even the ground state is above the potential at the edges,
          the box is doing all the holding (well, barrier) and the
          question does not apply. ── */
    vEdge = (vVec->data[0] < vVec->data[N - 1]) ? vVec->data[0] : vVec->data[N - 1];
    if (eVec->data[0] < vEdge)
    {
        for (i = 0; i < nStates; i++)
            if (eVec->data[i] < vEdge) nBound++;
    }
    else
        nBound = -1;

    /* ── report, with the exact answer alongside where there is one ── */
    printf("  ──────────────────────────────────────────────\n");
    printf("  state   energy (%s)       %s\n",
           evUnits ? "eV" : "au",
           (preset == SCH_WELL || preset == SCH_HARMONIC) ? "exact" : "");
    for (i = 0; i < nStates; i++)
    {
        printf("  %4d    %-16.8g", i, eVec->data[i]);

        exact = 0.0;
        if (preset == SCH_WELL)
            exact = c * pow(M_PI * (i + 1) / (xmax - xmin), 2.0);
        if (preset == SCH_HARMONIC)
            exact = (i + 0.5) * sqrt(2.0 * c * k);   /* (n + 1/2) hbar omega */
        if (exact != 0.0)
        {
            double rel = fabs(eVec->data[i] - exact) / fabs(exact);
            if (rel > err) err = rel;
            printf("  %-16.8g", exact);
        }

        if (nBound >= 0 && eVec->data[i] >= vEdge)
            printf("  above the potential's edges — held only by the box");
        printf("\n");
    }
    printf("  ──────────────────────────────────────────────\n");
    if (err >= 0.0)
        printf("  Energies match the exact answer to within %.4g%%\n", 100.0 * err);
    if (nBound >= 0 && nBound < nStates)
        printf("  The potential holds %d of these %d states; widen the box\n"
               "  (xmin, xmax) to see whether the others are real.\n",
               nBound, nStates);

    /* ── store scalars ── */
    set_var("schrod_n",      (double)nStates);
    set_var("schrod_N",      (double)N);
    set_var("schrod_E0",     eVec->data[0]);
    set_var("schrod_nbound", (double)nBound);
    set_var("schrod_err",    err);
    set_var("schrod_ev",     (double)evUnits);   /* so a plot can label its axes */

    /* ── store vectors and fields (set_mat_var takes ownership) ── */
    set_mat_var("schrod_E",    eVec);
    set_mat_var("schrod_x",    xVec);
    set_mat_var("schrod_V",    vVec);
    set_mat_var("schrod_psi",  psi);
    set_mat_var("schrod_prob", prob);

    printf("  $schrod_E0 $schrod_n $schrod_nbound $schrod_err\n");
    printf("  $schrod_E  [%d x 1] energies\n", nStates);
    printf("  $schrod_x $schrod_V  [%d x 1] grid and potential\n", N);
    printf("  $schrod_psi $schrod_prob  [%d x %d] wavefunctions\n\n", N, nStates);
}
