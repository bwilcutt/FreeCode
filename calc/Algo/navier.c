/* =============================================================================
 * File:         navier.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible Navier-Stokes solver — the lid-driven
 *               square cavity.  The top wall slides right at speed 1, the
 *               other three walls are fixed, and the fluid inside spins up
 *               into one large vortex plus small corner eddies.
 *
 *               Method (stream-function / vorticity form)
 *                 Unknowns on a uniform N x N grid, h = 1 / (N - 1):
 *                   psi  stream function     u =  d(psi)/dy
 *                   w    vorticity           v = -d(psi)/dx
 *                 Each time step:
 *                   1. Advance vorticity with an explicit Euler step of
 *                        dw/dt + u dw/dx + v dw/dy = (1/Re) lap(w)
 *                      using central differences.
 *                   2. Solve the Poisson equation  lap(psi) = -w  with the
 *                      shared multigrid-preconditioned conjugate-gradient
 *                      solver in ns_core.c (channel.c and slittest.c use
 *                      it too), warm-started from the previous step's psi.
 *                   3. Re-apply Thom's wall vorticity formula, which is
 *                      where the moving lid actually enters the problem.
 *                 Stop when the largest vorticity change per unit time
 *                 drops below tol (relative to the largest vorticity).
 *
 *               Re-uses from the rest of parse:
 *                 run_reynolds()      Re from V, D, nu  or  V, D, rho, mu
 *                 get_var("Re")       Re left behind by an earlier reynolds
 *                 mat_new / MAT /
 *                 set_mat_var         field and vector storage
 *                 vf_interp()         benchmark comparison
 *                 ns_poisson /
 *                 ns_vec_from_array   shared with channel.c (ns_core.c)
 *                 vf_min / vf_max     summary of the centreline profiles
 *
 *               Benchmark: U. Ghia, K. N. Ghia, C. T. Shin, "High-Re
 *               solutions for incompressible flow using the Navier-Stokes
 *               equations and a multigrid method", J. Comput. Phys. 48
 *               (1982) 387-411, Tables I and II.
 *
 *               Limits:
 *                 - Steady, laminar, 2D.  Above Re of a few thousand the
 *                   real cavity flow stops being steady, and this explicit
 *                   scheme needs a grid too fine to be pleasant anyway.
 *                 - The time step is set by stability, not by the user, so
 *                   high Re on a fine grid takes many steps.
 * ============================================================================= */

#include "navier.h"
#include "matrix.h"
#include "mathfuncs.h"
#include "reynolds.h"
#include "ns_core.h"

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

#define NS_N_DEFAULT      65        /* grid points per side                         */
#define NS_N_MIN          9         /* below this the "cavity" is a few pixels      */
#define NS_N_MAX          257       /* above this, go make coffee. Then a second one */
#define NS_TOL_DEFAULT    1e-5      /* steady-state tolerance (relative)            */
#define NS_MAXIT_DEFAULT  400000    /* time-step ceiling                            */
#define NS_POISSON_MAX    200       /* pressure-solver iterations per time step     */
#define NS_POISSON_TOL    1e-8      /* solver stops when psi changes less than this */
#define NS_REPORT_EVERY   5000      /* progress line spacing, in time steps         */
#define NS_GHIA_POINTS    17        /* rows in each Ghia table                      */
#define NS_GHIA_RE400     1         /* column index of Re = 400                     */
#define NS_GHIA_BAD_V400  11        /* row of the misprinted Re = 400 v value       */

/* ═══════════════════════════════════════════════════════════
   GHIA, GHIA & SHIN (1982) BENCHMARK DATA
   Stored ascending in position so vf_interp() can use them
   directly.  Columns: Re = 100, 400, 1000.
   ═══════════════════════════════════════════════════════════ */

/* Table I — u along the vertical centreline (x = 0.5) */
static const double ghia_y[NS_GHIA_POINTS] =
{
    0.0000, 0.0547, 0.0625, 0.0703, 0.1016, 0.1719, 0.2813, 0.4531, 0.5000,
    0.6172, 0.7344, 0.8516, 0.9531, 0.9609, 0.9688, 0.9766, 1.0000
};

static const double ghia_u[3][NS_GHIA_POINTS] =
{
    /* Re = 100 */
    {  0.00000, -0.03717, -0.04192, -0.04775, -0.06434, -0.10150, -0.15662,
      -0.21090, -0.20581, -0.13641,  0.00332,  0.23151,  0.68717,  0.73722,
       0.78871,  0.84123,  1.00000 },
    /* Re = 400 */
    {  0.00000, -0.08186, -0.09266, -0.10338, -0.14612, -0.24299, -0.32726,
      -0.17119, -0.11477,  0.02135,  0.16256,  0.29093,  0.55892,  0.61756,
       0.68439,  0.75837,  1.00000 },
    /* Re = 1000 */
    {  0.00000, -0.18109, -0.20196, -0.22220, -0.29730, -0.38289, -0.27805,
      -0.10648, -0.06080,  0.05702,  0.18719,  0.33304,  0.46604,  0.51117,
       0.57492,  0.65928,  1.00000 }
};

/* Table II — v along the horizontal centreline (y = 0.5) */
static const double ghia_x[NS_GHIA_POINTS] =
{
    0.0000, 0.0625, 0.0703, 0.0781, 0.0938, 0.1563, 0.2266, 0.2344, 0.5000,
    0.8047, 0.8594, 0.9063, 0.9453, 0.9531, 0.9609, 0.9688, 1.0000
};

static const double ghia_v[3][NS_GHIA_POINTS] =
{
    /* Re = 100 */
    {  0.00000,  0.09233,  0.10091,  0.10890,  0.12317,  0.16077,  0.17507,
       0.17527,  0.05454, -0.24533, -0.22445, -0.16914, -0.10313, -0.08864,
      -0.07391, -0.05906,  0.00000 },
    /* Re = 400 */
    {  0.00000,  0.18360,  0.19713,  0.20920,  0.22965,  0.28124,  0.30203,
       0.30174,  0.05186, -0.38598, -0.44993, -0.23827, -0.22847, -0.19254,
      -0.15663, -0.12146,  0.00000 },
    /* Re = 1000 */
    {  0.00000,  0.27485,  0.29012,  0.30353,  0.32627,  0.37095,  0.33075,
       0.32235,  0.02526, -0.31966, -0.42665, -0.51550, -0.39188, -0.33714,
      -0.27669, -0.21388,  0.00000 }
};

/* Ghia's reported main-vortex strength, for the printed comparison */
static const double ghia_psimin[3] = { -0.103423, -0.113909, -0.117929 };

/*************************************************************
 * Function:    ghia_index
 * Input:       Re (double) — Reynolds number being solved
 * Output:      int — 0, 1 or 2 for Re = 100, 400, 1000; -1 otherwise
 * Description: Picks the benchmark column that matches Re.  A small
 *              tolerance lets Re computed from V, D and nu (which is
 *              rarely an exact integer) still find its table.
 **************************************************************/
static int ghia_index(double Re)
{
    if (fabs(Re - 100.0)  < 0.5) return 0;
    if (fabs(Re - 400.0)  < 0.5) return 1;
    if (fabs(Re - 1000.0) < 0.5) return 2;
    return -1;
}

/*************************************************************
 * Function:    apply_wall_vorticity
 * Input:       psi (const Matrix*) — current stream function, N x N
 *              w   (Matrix*)       — vorticity, wall values overwritten
 *              N   (int)           — grid points per side
 *              h   (double)        — grid spacing
 * Output:      void
 * Description: Thom's formula.  psi is zero on every wall, so a Taylor
 *              expansion one cell in from the wall gives
 *                  w_wall = -2 * psi_adjacent / h^2  -  2 * U_wall / h
 *              where U_wall is the tangential wall speed (1 on the lid,
 *              0 elsewhere).  Corners are left at whatever the neighbouring
 *              walls say; they are singular in the real flow too, and no
 *              interior stencil ever reads them.
 **************************************************************/
static void apply_wall_vorticity(const Matrix *psi, Matrix *w, int N, double h)
{
    int    k;
    double invH2 = 1.0 / (h * h);

    for (k = 1; k < N - 1; k++)
    {
        /* bottom wall (row 0) and top lid (row N-1, moving right) */
        MAT(w, 0,     k) = -2.0 * MAT(psi, 1,     k) * invH2;
        MAT(w, N - 1, k) = -2.0 * MAT(psi, N - 2, k) * invH2 - 2.0 / h;

        /* left wall (col 0) and right wall (col N-1) */
        MAT(w, k, 0)     = -2.0 * MAT(psi, k, 1)     * invH2;
        MAT(w, k, N - 1) = -2.0 * MAT(psi, k, N - 2) * invH2;
    }
}

/*************************************************************
 * Function:    step_vorticity
 * Input:       psi  (const Matrix*) — stream function, N x N
 *              w    (const Matrix*) — vorticity at time level n
 *              wNew (Matrix*)       — receives interior vorticity at n+1
 *              N    (int)           — grid points per side
 *              h    (double)        — grid spacing
 *              dt   (double)        — time step
 *              Re   (double)        — Reynolds number
 * Output:      double — largest |dw/dt| on the interior this step
 * Description: One explicit Euler step of the vorticity transport
 *              equation with second-order central differences for both
 *              the convection and the diffusion terms.
 **************************************************************/
static double step_vorticity(const Matrix *psi, const Matrix *w, Matrix *wNew,
                             int N, double h, double dt, double Re)
{
    int    i;
    int    j;
    double inv2h  = 1.0 / (2.0 * h);
    double invH2  = 1.0 / (h * h);
    double invRe  = 1.0 / Re;
    double u;
    double v;
    double dwdx;
    double dwdy;
    double lapW;
    double rate;
    double maxRate = 0.0;

    for (j = 1; j < N - 1; j++)
    {
        for (i = 1; i < N - 1; i++)
        {
            /* velocity from the stream function */
            u =  (MAT(psi, j + 1, i) - MAT(psi, j - 1, i)) * inv2h;
            v = -(MAT(psi, j, i + 1) - MAT(psi, j, i - 1)) * inv2h;

            /* vorticity gradients and Laplacian */
            dwdx = (MAT(w, j, i + 1) - MAT(w, j, i - 1)) * inv2h;
            dwdy = (MAT(w, j + 1, i) - MAT(w, j - 1, i)) * inv2h;
            lapW = (MAT(w, j, i + 1) + MAT(w, j, i - 1) +
                    MAT(w, j + 1, i) + MAT(w, j - 1, i) -
                    4.0 * MAT(w, j, i)) * invH2;

            /* dw/dt = diffusion - convection */
            rate = invRe * lapW - (u * dwdx + v * dwdy);

            MAT(wNew, j, i) = MAT(w, j, i) + dt * rate;

            if (fabs(rate) > maxRate) maxRate = fabs(rate);
        }
    }

    return maxRate;
}

/*************************************************************
 * Function:    navier_usage
 * Input:       void
 * Output:      void — usage text printed to stdout
 * Description: Shown for "navier ?" and whenever no Reynolds number
 *              can be found.
 **************************************************************/
static void navier_usage(void)
{
    printf("\n  Navier-Stokes — lid-driven cavity\n");
    printf("  ──────────────────────────────────────────────────────────\n");
    printf("  navier Re=<>                    [N=<grid>] [tol=<>] [maxit=<>]\n");
    printf("  navier V=<> D=<> nu=<>          (Re worked out by reynolds)\n");
    printf("  navier V=<> D=<> rho=<> mu=<>   (Re worked out by reynolds)\n");
    printf("  navier                          (uses $Re from a previous reynolds)\n");
    printf("\n");
    printf("  D is the cavity side, V is the lid speed.  N is the number of\n");
    printf("  grid points per side (default %d, odd, %d..%d).  Re of 100, 400\n",
           NS_N_DEFAULT, NS_N_MIN, NS_N_MAX);
    printf("  and 1000 are checked against the published Ghia benchmark;\n");
    printf("  use N=129 or more for Re=1000.\n");
    printf("\n");
    printf("    -> $navier_psimin $navier_xc $navier_yc $navier_err\n");
    printf("    -> $navier_y $navier_u   $navier_x $navier_v   (centrelines)\n");
    printf("    -> $navier_gy $navier_gu $navier_gx $navier_gv (benchmark)\n");
    printf("    -> $navier_psi $navier_w $navier_ufield $navier_vfield   (full fields)\n");
    printf("  ──────────────────────────────────────────────────────────\n\n");
}

/*************************************************************
 * Function:    run_navier
 * Input:       args (const char*) — text following the "navier" keyword
 * Output:      void — results printed and stored in $navier_* variables
 * Description: Works out Re, sets up the grid, time-steps the cavity to
 *              steady state, then extracts the centreline profiles, the
 *              main vortex, the benchmark comparison and the full fields.
 **************************************************************/
void run_navier(const char *args)
{
    double  Re       = 0.0;
    double  N_d      = NS_N_DEFAULT;
    double  tol      = NS_TOL_DEFAULT;
    double  maxit_d  = NS_MAXIT_DEFAULT;
    double  scratch  = 0.0;
    int     haveRe   = 0;
    int     haveV    = 0;
    int     haveD    = 0;
    int     found    = 0;
    int     N;
    int     maxit;
    int     mid;
    int     i;
    int     j;
    int     step;
    int     converged = 0;
    int     gIdx;
    double  h;
    double  dt;
    double  rate     = 0.0;
    double  wScale;
    double  psiMin;
    double  xc       = 0.0;
    double  yc       = 0.0;
    double  err      = -1.0;
    double  diff;
    Matrix *psi;
    Matrix *w;
    Matrix *wNew;
    Matrix *swap;
    Matrix *Ufield;
    Matrix *Vfield;
    Matrix *yVec;
    Matrix *uVec;
    Matrix *xVec;
    Matrix *vVec;
    Matrix *refPos;
    Matrix *refVal;
    unsigned char *cellType;

    /* ── "navier ?" ── */
    while (isspace(*args)) args++;
    if (*args == '?') { navier_usage(); return; }

    /* ── grab the solver options first ── */
    parse_named_param(args, "Re",    &Re,      &haveRe);
    parse_named_param(args, "N",     &N_d,     &found);
    parse_named_param(args, "tol",   &tol,     &found);
    parse_named_param(args, "maxit", &maxit_d, &found);

    /* ── Reynolds number: Re= wins, then V/D through reynolds, then $Re ── */
    if (!haveRe)
    {
        parse_named_param(args, "V", &scratch, &haveV);
        parse_named_param(args, "D", &scratch, &haveD);

        if (haveV && haveD)
        {
            /* let the reynolds command do its job — no second copy of it here */
            run_reynolds(args);
        }

        /* either reynolds just set it, or it is left over from earlier */
        Re = get_var("Re");
    }

    if (Re <= 0.0)
    {
        printf("  navier: no Reynolds number.  Give Re=<>, or V= D= nu=,\n");
        printf("          or run \"reynolds\" first.\n");
        navier_usage();
        return;
    }

    /* ── grid: odd so x = 0.5 and y = 0.5 land exactly on a grid line ── */
    N = (int)N_d;
    if (N < NS_N_MIN) N = NS_N_MIN;
    if (N > NS_N_MAX) N = NS_N_MAX;
    if (N % 2 == 0)   N++;
    mid   = (N - 1) / 2;
    maxit = (int)maxit_d;
    if (maxit < 1) maxit = 1;
    if (tol <= 0.0) tol = NS_TOL_DEFAULT;

    h = 1.0 / (N - 1);

    /* ── time step: the tightest of the three explicit stability limits
          (diffusion, convection at lid speed, and the cell-Re limit for
          central differencing), with a 20% margin for luck ── */
    dt = 0.25 * h * h * Re;
    if (h       < dt) dt = h;
    if (2.0/Re  < dt) dt = 2.0 / Re;
    dt *= 0.8;

    /* ── fields: row j is y = j*h from the bottom, column i is x = i*h ── */
    psi  = mat_new(N, N);
    w    = mat_new(N, N);
    wNew = mat_new(N, N);

    /* for the psi solve: interior unknown, walls held at psi = 0 */
    cellType = malloc((size_t)N * N);
    for (j = 0; j < N; j++)
        for (i = 0; i < N; i++)
            cellType[j * N + i] = (i == 0 || j == 0 || i == N - 1 || j == N - 1)
                                  ? NS_CELL_FIXED : NS_CELL_FLUID;

    printf("\n  Navier-Stokes — Lid-Driven Cavity\n");
    printf("  ──────────────────────────────────────────────\n");
    printf("  Re = %-10g  grid = %d x %d   dt = %.4g\n", Re, N, N, dt);
    printf("  solving ...\n");
    fflush(stdout);

    /* the fluid starts at rest; only the lid is moving */
    apply_wall_vorticity(psi, w, N, h);

    /* ── march to steady state ── */
    for (step = 1; step <= maxit; step++)
    {
        /* 1. vorticity transport on the interior */
        rate = step_vorticity(psi, w, wNew, N, h, dt, Re);

        /* walls of wNew are refreshed below; swap time levels */
        swap = w; w = wNew; wNew = swap;

        /* 2. stream function from the new vorticity: lap(psi) = -w */
        ns_poisson(psi, w, cellType, h, NS_POISSON_MAX, NS_POISSON_TOL);

        /* 3. wall vorticity from the new stream function */
        apply_wall_vorticity(psi, w, N, h);

        /* steady when the flow has quit changing, relative to its own size */
        wScale = 1.0;
        for (i = 1; i < N - 1; i++)
            if (fabs(MAT(w, mid, i)) > wScale) wScale = fabs(MAT(w, mid, i));

        if (rate / wScale < tol) { converged = 1; break; }

        /* a blow-up shows as NaN long before anyone reads the output */
        if (isnan(rate) || isinf(rate))
        {
            printf("  navier: solution became unstable at step %d.\n", step);
            printf("          Try a finer grid (larger N).\n\n");
            mat_free(psi); mat_free(w); mat_free(wNew);
            free(cellType);
            return;
        }

        if (step % NS_REPORT_EVERY == 0)
        {
            printf("    step %-8d  change %.3g  (stop below %.3g)\n",
                   step, rate / wScale, tol);
            fflush(stdout);
        }
    }
    if (step > maxit) step = maxit;

    mat_free(wNew);
    free(cellType);

    /* ── velocity fields from the stream function (one-sided at walls) ── */
    Ufield = mat_new(N, N);
    Vfield = mat_new(N, N);
    for (j = 1; j < N - 1; j++)
    {
        for (i = 1; i < N - 1; i++)
        {
            MAT(Ufield, j, i) =  (MAT(psi, j + 1, i) - MAT(psi, j - 1, i)) / (2.0*h);
            MAT(Vfield, j, i) = -(MAT(psi, j, i + 1) - MAT(psi, j, i - 1)) / (2.0*h);
        }
    }
    for (i = 0; i < N; i++) MAT(Ufield, N - 1, i) = 1.0;   /* the lid itself */
    MAT(Ufield, N - 1, 0)     = 0.0;                       /* corners belong to   */
    MAT(Ufield, N - 1, N - 1) = 0.0;                       /* the fixed side walls */

    /* ── centreline profiles ── */
    yVec = vf_linspace(0.0, 1.0, N);
    xVec = vf_linspace(0.0, 1.0, N);
    uVec = mat_new(N, 1);
    vVec = mat_new(N, 1);
    for (j = 0; j < N; j++) uVec->data[j] = MAT(Ufield, j, mid);
    for (i = 0; i < N; i++) vVec->data[i] = MAT(Vfield, mid, i);
    uVec->data[N - 1] = 1.0;   /* top of the vertical centreline is on the lid */

    /* ── main vortex: the deepest stream-function minimum ── */
    psiMin = 0.0;
    for (j = 1; j < N - 1; j++)
    {
        for (i = 1; i < N - 1; i++)
        {
            if (MAT(psi, j, i) < psiMin)
            {
                psiMin = MAT(psi, j, i);
                xc     = i * h;
                yc     = j * h;
            }
        }
    }

    /* ── benchmark comparison, through the shared interpolator ── */
    gIdx = ghia_index(Re);
    if (gIdx >= 0)
    {
        err = 0.0;
        for (i = 0; i < NS_GHIA_POINTS; i++)
        {
            diff = fabs(vf_interp(yVec, uVec, ghia_y[i]) - ghia_u[gIdx][i]);
            if (diff > err) err = diff;
            /* Ghia's Re=400 v at x=0.9063 (-0.23827) is a known misprint in
               the paper — it sits nowhere near its own neighbours.  It stays
               in the table as published but is not held against the solver. */
            if (gIdx == NS_GHIA_RE400 && i == NS_GHIA_BAD_V400) continue;

            diff = fabs(vf_interp(xVec, vVec, ghia_x[i]) - ghia_v[gIdx][i]);
            if (diff > err) err = diff;
        }
    }

    /* ── report ── */
    printf("  ──────────────────────────────────────────────\n");
    printf("  %s after %d steps\n",
           converged ? "Steady state reached" : "Stopped at maxit (not steady yet)",
           step);
    printf("  Main vortex   psi = %-10.6f at x = %.4f, y = %.4f\n",
           psiMin, xc, yc);
    if (gIdx >= 0)
    {
        printf("  Ghia (1982)   psi = %-10.6f\n", ghia_psimin[gIdx]);
        printf("  Largest centreline difference from Ghia = %.4f\n", err);
        printf("  (as a fraction of lid speed; under 0.02 is a good match)\n");
    }
    printf("  Centreline u range  %.4f .. %.4f\n", vf_min(uVec), vf_max(uVec));
    printf("  Centreline v range  %.4f .. %.4f\n", vf_min(vVec), vf_max(vVec));
    printf("  ──────────────────────────────────────────────\n");

    /* ── store scalars ── */
    set_var("navier_Re",     Re);
    set_var("navier_N",      (double)N);
    set_var("navier_steps",  (double)step);
    set_var("navier_conv",   (double)converged);
    set_var("navier_psimin", psiMin);
    set_var("navier_xc",     xc);
    set_var("navier_yc",     yc);
    set_var("navier_err",    err);

    /* ── store vectors and fields (set_mat_var takes ownership) ── */
    set_mat_var("navier_y",   yVec);
    set_mat_var("navier_u",   uVec);
    set_mat_var("navier_x",   xVec);
    set_mat_var("navier_v",   vVec);
    set_mat_var("navier_psi", psi);
    set_mat_var("navier_w",   w);
    set_mat_var("navier_ufield", Ufield);
    set_mat_var("navier_vfield", Vfield);

    if (gIdx >= 0)
    {
        refPos = ns_vec_from_array(ghia_y, NS_GHIA_POINTS);
        refVal = ns_vec_from_array(ghia_u[gIdx], NS_GHIA_POINTS);
        set_mat_var("navier_gy", refPos);
        set_mat_var("navier_gu", refVal);
        refPos = ns_vec_from_array(ghia_x, NS_GHIA_POINTS);
        refVal = ns_vec_from_array(ghia_v[gIdx], NS_GHIA_POINTS);
        set_mat_var("navier_gx", refPos);
        set_mat_var("navier_gv", refVal);
    }

    printf("  $navier_psimin $navier_xc $navier_yc $navier_err\n");
    printf("  $navier_y/$navier_u  $navier_x/$navier_v  [%d x 1] centrelines\n", N);
    if (gIdx >= 0)
        printf("  $navier_gy/$navier_gu  $navier_gx/$navier_gv  [%d x 1] Ghia points\n",
               NS_GHIA_POINTS);
    printf("  $navier_psi $navier_w $navier_ufield $navier_vfield  [%d x %d] fields\n\n", N, N);
}
