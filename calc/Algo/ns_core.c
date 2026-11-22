/* =============================================================================
 * File:         ns_core.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Shared numerical pieces for the Navier-Stokes commands
 *               (navier.c, channel.c, slittest.c).  See ns_core.h.
 *
 *               The Poisson solver
 *                 Scaled by h^2, each FLUID cell's equation reads
 *                     count * phi  -  (sum of FLUID neighbours)
 *                                  =  h^2 src + (sum of FIXED neighbours)
 *                 where count is how many neighbours are not SOLID.  That
 *                 is a symmetric positive-definite system, the textbook
 *                 home of conjugate gradients (CG).
 *
 *                 CG alone needs about as many iterations as the grid is
 *                 wide.  Each iteration here is therefore "preconditioned"
 *                 by one multigrid V-cycle: smooth the error on the fine
 *                 grid, hand what's left to a grid half the size, and so
 *                 on down, where long-range errors look short-range and
 *                 die quickly.  The result needs a handful of iterations
 *                 whatever the grid size.
 *
 *                 Coarse grids: each 2 x 2 block of cells becomes one cell,
 *                 and its couplings are the sums of the fine couplings that
 *                 cross between blocks ("Galerkin" coarsening with block
 *                 aggregation).  No coarse grid ever has to be told where
 *                 the cylinder is — it inherits it.
 *
 *                 The smoother is Gauss-Seidel forward on the way down and
 *                 backward on the way up, so the V-cycle is symmetric, as
 *                 CG requires of its preconditioner.
 * ============================================================================= */

#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "ns_core.h"

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

#define MG_LEVELS_MAX     16      /* 2^16 cells across — plenty               */
#define MG_COARSE_CELLS   64      /* stop coarsening below this many unknowns  */
#define MG_COARSE_DIM     6       /* ... or when a side gets this short        */
#define MG_PRE            2       /* forward Gauss-Seidel sweeps going down    */
#define MG_POST           2       /* backward sweeps coming back up            */
#define MG_COARSE_SWEEPS  30      /* symmetric sweep pairs on the coarsest grid */
#define MG_BOOST          2.0       /* coarse correction scaled up: 2 x 2 block
                                     coarse grids undershoot by about half.
                                     Measured: 2.0 needs a quarter of the
                                     iterations of 1.0; past 2.5 it worsens */

/*************************************************************
 * Struct:      MgLevel
 * Description: One grid of the hierarchy.  Arrays are nx x ny,
 *              index j * nx + i, with a ring of inactive cells
 *              round the edge so the stencil never runs off.
 *
 *   nx, ny     size, ghost ring included
 *   act        1 = an unknown on this level
 *   d          diagonal coefficient
 *   e, n       coupling to the east (k + 1) and north (k + nx)
 *              neighbours; west and south are read from the
 *              neighbour's own e and n, which is what keeps it
 *              symmetric
 *   x, b, r    solution, right-hand side, residual
 *   nact       unknowns on this level
 *************************************************************/
typedef struct
{
    int            nx;
    int            ny;
    unsigned char *act;
    double        *d;
    double        *e;
    double        *n;
    double        *x;
    double        *b;
    double        *r;
    int            nact;
} MgLevel;

/*************************************************************
 * Struct:      MgCache
 * Description: The hierarchy, kept between calls.  The cell types
 *              decide everything in it, so it is rebuilt only when
 *              they change — once per run, not once per time step.
 *
 *   rows, cols    size of the caller's grid
 *   type          copy of the cell types it was built for
 *   nlev, lev     the levels, finest first
 *   res, z, p, Ap CG work vectors on the finest level.  They are kept
 *                 apart from the levels' own x, b, r, which vcycle()
 *                 uses as scratch — sharing them cost an afternoon.
 *************************************************************/
typedef struct
{
    int            rows;
    int            cols;
    unsigned char *type;
    int            nlev;
    MgLevel        lev[MG_LEVELS_MAX];
    double        *res;
    double        *z;
    double        *p;
    double        *Ap;
} MgCache;

static MgCache cache;          /* one is enough: a run uses one grid at a time */

/* ═══════════════════════════════════════════════════════════
   HIERARCHY
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    level_alloc
 * Input:       L      (MgLevel*) — level to fill
 *              nx, ny (int)      — size, ghost ring included
 * Output:      void
 * Description: Zeroed arrays for one level.
 **************************************************************/
static void level_alloc(MgLevel *L, int nx, int ny)
{
    size_t cells = (size_t)nx * ny;

    L->nx   = nx;
    L->ny   = ny;
    L->nact = 0;
    L->act  = calloc(cells, 1);
    L->d    = calloc(cells, sizeof(double));
    L->e    = calloc(cells, sizeof(double));
    L->n    = calloc(cells, sizeof(double));
    L->x    = calloc(cells, sizeof(double));
    L->b    = calloc(cells, sizeof(double));
    L->r    = calloc(cells, sizeof(double));
}

/*************************************************************
 * Function:    cache_free
 * Input:       void
 * Output:      void
 * Description: Releases the hierarchy so a new one can be built.
 **************************************************************/
static void cache_free(void)
{
    int l;

    for (l = 0; l < cache.nlev; l++)
    {
        free(cache.lev[l].act); free(cache.lev[l].d);
        free(cache.lev[l].e);   free(cache.lev[l].n);
        free(cache.lev[l].x);   free(cache.lev[l].b);
        free(cache.lev[l].r);
    }
    free(cache.type);
    free(cache.res); free(cache.z); free(cache.p); free(cache.Ap);
    memset(&cache, 0, sizeof cache);
}

/*************************************************************
 * Function:    build_fine
 * Input:       L    (MgLevel*)             — finest level, allocated
 *              type (const unsigned char*) — the caller's cell types
 * Output:      void
 * Description: The h^2-scaled 5-point operator.  A FLUID cell with
 *              at least one non-SOLID neighbour is an unknown; its
 *              diagonal counts every non-SOLID neighbour, and it is
 *              coupled (-1) to each neighbour that is also an
 *              unknown.  FIXED neighbours add to the diagonal and go
 *              to the right-hand side instead.
 **************************************************************/
static void build_fine(MgLevel *L, const unsigned char *type)
{
    int nx = L->nx;
    int ny = L->ny;
    int i, j, k, count;

    /* pass 1: who is an unknown, and the diagonal */
    for (j = 1; j < ny - 1; j++)
    {
        for (i = 1; i < nx - 1; i++)
        {
            k = j * nx + i;
            if (type[k] != NS_CELL_FLUID) continue;

            count = (type[k + 1]  != NS_CELL_SOLID) + (type[k - 1]  != NS_CELL_SOLID)
                  + (type[k + nx] != NS_CELL_SOLID) + (type[k - nx] != NS_CELL_SOLID);
            if (count == 0) continue;           /* sealed in: left alone */

            L->act[k] = 1;
            L->d[k]   = count;
            L->nact++;
        }
    }

    /* pass 2: couplings between two unknowns */
    for (j = 1; j < ny - 1; j++)
    {
        for (i = 1; i < nx - 1; i++)
        {
            k = j * nx + i;
            if (!L->act[k]) continue;
            if (L->act[k + 1])  L->e[k] = -1.0;
            if (L->act[k + nx]) L->n[k] = -1.0;
        }
    }
}

/*************************************************************
 * Function:    build_coarse
 * Input:       F (const MgLevel*) — fine level, complete
 *              C (MgLevel*)       — next level down, filled in
 * Output:      void
 * Description: Fine cell (i, j) belongs to coarse cell
 *              ((i+1)/2, (j+1)/2).  Fine index 0 (ring) is alone in
 *              coarse 0, and the coarse grid gets one spare column
 *              and row, so the coarse ring stays inactive too.  A
 *              coupling inside a block adds twice to the block's
 *              diagonal (it appears in both directions); one between
 *              blocks adds to the block coupling.
 **************************************************************/
static void build_coarse(const MgLevel *F, MgLevel *C)
{
    int fnx = F->nx;
    int cnx;
    int i, j, k, I, J, K, Ke, Kn;

    level_alloc(C, fnx / 2 + 2, F->ny / 2 + 2);
    cnx = C->nx;

    for (j = 1; j < F->ny - 1; j++)
    {
        for (i = 1; i < fnx - 1; i++)
        {
            k = j * fnx + i;
            if (!F->act[k]) continue;

            I = (i + 1) / 2;
            J = (j + 1) / 2;
            K = J * cnx + I;
            if (!C->act[K]) { C->act[K] = 1; C->nact++; }
            C->d[K] += F->d[k];

            /* east coupling: same block or the block to the east */
            if (F->e[k] != 0.0)
            {
                Ke = J * cnx + (i + 2) / 2;
                if (Ke == K) C->d[K] += 2.0 * F->e[k];
                else         C->e[K] += F->e[k];
            }

            /* north coupling: same block or the block to the north */
            if (F->n[k] != 0.0)
            {
                Kn = ((j + 2) / 2) * cnx + I;
                if (Kn == K) C->d[K] += 2.0 * F->n[k];
                else         C->n[K] += F->n[k];
            }
        }
    }
}

/*************************************************************
 * Function:    cache_build
 * Input:       type       (const unsigned char*) — cell types
 *              rows, cols (int)                  — grid size
 * Output:      void
 * Description: Builds the whole hierarchy for these cell types,
 *              finest first, until it's small enough to just
 *              grind out.
 **************************************************************/
static void cache_build(const unsigned char *type, int rows, int cols)
{
    size_t cells = (size_t)rows * cols;

    cache_free();
    cache.rows = rows;
    cache.cols = cols;
    cache.type = malloc(cells);
    memcpy(cache.type, type, cells);
    cache.res  = calloc(cells, sizeof(double));
    cache.z    = calloc(cells, sizeof(double));
    cache.p    = calloc(cells, sizeof(double));
    cache.Ap   = calloc(cells, sizeof(double));

    level_alloc(&cache.lev[0], cols, rows);
    build_fine(&cache.lev[0], type);
    cache.nlev = 1;

    while (cache.nlev < MG_LEVELS_MAX)
    {
        const MgLevel *F = &cache.lev[cache.nlev - 1];

        if (F->nact <= MG_COARSE_CELLS)                       break;
        if (F->nx <= MG_COARSE_DIM || F->ny <= MG_COARSE_DIM) break;

        build_coarse(F, &cache.lev[cache.nlev]);
        cache.nlev++;
    }
}

/* ═══════════════════════════════════════════════════════════
   THE V-CYCLE
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    gs_sweep
 * Input:       L       (MgLevel*) — level; x updated in place
 *              forward (int)      — 1 = bottom-left to top-right,
 *                                   0 = the reverse
 * Output:      void
 * Description: One Gauss-Seidel sweep of  A x = b  on this level.
 *              Inactive neighbours have zero couplings, so no
 *              checks are needed — the ring takes care of itself.
 **************************************************************/
static void gs_sweep(MgLevel *L, int forward)
{
    int     nx = L->nx;
    int     k, kBeg, kEnd, step;
    double  off;
    double *x  = L->x;

    kBeg = forward ? nx + 1 : (L->ny - 1) * nx - 2;
    kEnd = forward ? (L->ny - 1) * nx - 1 : nx;
    step = forward ? 1 : -1;

    for (k = kBeg; k != kEnd; k += step)
    {
        if (!L->act[k]) continue;
        off = L->e[k]      * x[k + 1]  + L->e[k - 1]  * x[k - 1]
            + L->n[k]      * x[k + nx] + L->n[k - nx] * x[k - nx];
        x[k] = (L->b[k] - off) / L->d[k];
    }
}

/*************************************************************
 * Function:    apply_A
 * Input:       L   (const MgLevel*) — level (its operator)
 *              v   (const double*)  — vector in
 *              out (double*)        — A v, zero on inactive cells
 * Output:      void
 **************************************************************/
static void apply_A(const MgLevel *L, const double *v, double *out)
{
    int nx = L->nx;
    int k, kEnd = (L->ny - 1) * nx - 1;

    for (k = 0; k < L->nx * L->ny; k++) out[k] = 0.0;
    for (k = nx + 1; k < kEnd; k++)
    {
        if (!L->act[k]) continue;
        out[k] = L->d[k] * v[k]
               + L->e[k] * v[k + 1]  + L->e[k - 1]  * v[k - 1]
               + L->n[k] * v[k + nx] + L->n[k - nx] * v[k - nx];
    }
}

/*************************************************************
 * Function:    vcycle
 * Input:       l (int) — level to start on; its b is the input
 * Output:      void — its x holds the approximate solution
 * Description: Starting from zero: smooth, pass the residual down,
 *              recurse, add the coarse correction back, smooth
 *              again in the opposite direction.  The coarsest level
 *              just gets a lot of symmetric sweeps.
 **************************************************************/
static void vcycle(int l)
{
    MgLevel *L = &cache.lev[l];
    MgLevel *C;
    int      cells = L->nx * L->ny;
    int      i, j, k, s, I, J;

    memset(L->x, 0, cells * sizeof(double));

    /* ── bottom of the V: grind it out ── */
    if (l == cache.nlev - 1)
    {
        for (s = 0; s < MG_COARSE_SWEEPS; s++)
        {
            gs_sweep(L, 1);
            gs_sweep(L, 0);
        }
        return;
    }

    /* ── going down ── */
    for (s = 0; s < MG_PRE; s++) gs_sweep(L, 1);

    apply_A(L, L->x, L->r);
    for (k = 0; k < cells; k++) L->r[k] = L->act[k] ? L->b[k] - L->r[k] : 0.0;

    /* restrict: a block's right-hand side is the sum of its cells' residuals */
    C = &cache.lev[l + 1];
    memset(C->b, 0, (size_t)C->nx * C->ny * sizeof(double));
    for (j = 1; j < L->ny - 1; j++)
    {
        for (i = 1; i < L->nx - 1; i++)
        {
            k = j * L->nx + i;
            if (!L->act[k]) continue;
            I = (i + 1) / 2;
            J = (j + 1) / 2;
            C->b[J * C->nx + I] += L->r[k];
        }
    }

    vcycle(l + 1);

    /* prolong: every cell gets its block's correction */
    for (j = 1; j < L->ny - 1; j++)
    {
        for (i = 1; i < L->nx - 1; i++)
        {
            k = j * L->nx + i;
            if (!L->act[k]) continue;
            L->x[k] += MG_BOOST * C->x[((j + 1) / 2) * C->nx + (i + 1) / 2];
        }
    }

    /* ── coming back up, sweeping the other way ── */
    for (s = 0; s < MG_POST; s++) gs_sweep(L, 0);
}

/*************************************************************
 * Function:    worst_move
 * Input:       F (const MgLevel*) — finest level (its diagonal)
 *              r (const double*)  — current residual
 * Output:      double — the most any cell would move if it were
 *              updated on its own right now
 * Description: A cell's own update would shift it by r / d.  The
 *              old SOR solver stopped when its sweep moved no cell
 *              more than tol, which is this same quantity — so the
 *              tolerance means the same thing it always did.
 **************************************************************/
static double worst_move(const MgLevel *F, const double *r)
{
    int    k, cells = F->nx * F->ny;
    double m = 0.0, v;

    for (k = 0; k < cells; k++)
    {
        if (!F->act[k]) continue;
        v = fabs(r[k]) / F->d[k];
        if (v > m) m = v;
    }
    return m;
}

/* ═══════════════════════════════════════════════════════════
   PUBLIC
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    ns_poisson
 * Input:       see ns_core.h
 * Output:      int — iterations used
 * Description: Preconditioned conjugate gradients from the caller's
 *              phi.  Stops when no cell would move more than tol if it
 *              were updated by itself (the old SOR test, measured on
 *              what is left rather than on the last step), or at
 *              max_iter.  A warm start that is already good enough
 *              costs no iterations at all.
 **************************************************************/
int ns_poisson(Matrix *phi, const Matrix *src,
               const unsigned char *type, double h,
               int max_iter, double tol)
{
    int      rows = phi->rows;
    int      cols = phi->cols;
    int      cells = rows * cols;
    MgLevel *F;
    double  *r, *z, *p, *Ap;
    double   h2 = h * h;
    double   rz, rzNew, pAp, alpha, beta;
    int      it, k;

    /* ── same cell types as last call?  then the hierarchy still fits ── */
    if (cache.nlev == 0 || cache.rows != rows || cache.cols != cols ||
        memcmp(cache.type, type, (size_t)cells) != 0)
        cache_build(type, rows, cols);

    F  = &cache.lev[0];
    r  = cache.res;
    z  = cache.z;
    p  = cache.p;
    Ap = cache.Ap;
    if (F->nact == 0) return 0;               /* nothing to solve for */

    /* ── right-hand side: h^2 src plus every FIXED neighbour's value ── */
    for (k = 0; k < cells; k++)
    {
        if (!F->act[k]) { F->b[k] = 0.0; continue; }
        F->b[k] = h2 * src->data[k];
        if (type[k + 1]    == NS_CELL_FIXED) F->b[k] += phi->data[k + 1];
        if (type[k - 1]    == NS_CELL_FIXED) F->b[k] += phi->data[k - 1];
        if (type[k + cols] == NS_CELL_FIXED) F->b[k] += phi->data[k + cols];
        if (type[k - cols] == NS_CELL_FIXED) F->b[k] += phi->data[k - cols];
    }

    /* ── warm start from the caller's phi.  vcycle() uses the level
          arrays as scratch, so CG keeps its own: r is the residual,
          and each step is added straight into phi ── */
    for (k = 0; k < cells; k++) z[k] = F->act[k] ? phi->data[k] : 0.0;
    apply_A(F, z, Ap);
    for (k = 0; k < cells; k++) r[k] = F->act[k] ? F->b[k] - Ap[k] : 0.0;

    /* already there?  (warm starts often are, once a flow settles) */
    if (worst_move(F, r) < tol) return 0;

    /* z = M r: one V-cycle, which reads F->b and writes F->x */
    memcpy(F->b, r, cells * sizeof(double));
    vcycle(0);
    memcpy(z, F->x, cells * sizeof(double));
    memcpy(p, z, cells * sizeof(double));

    rz = 0.0;
    for (k = 0; k < cells; k++) rz += r[k] * z[k];

    for (it = 1; it <= max_iter; it++)
    {
        if (rz == 0.0) break;                 /* already exact — rare, but polite */

        apply_A(F, p, Ap);
        pAp = 0.0;
        for (k = 0; k < cells; k++) pAp += p[k] * Ap[k];
        if (pAp <= 0.0) break;                /* would only happen to a broken grid */
        alpha = rz / pAp;

        /* step phi and the residual */
        for (k = 0; k < cells; k++)
        {
            if (!F->act[k]) continue;
            phi->data[k] += alpha * p[k];
            r[k]         -= alpha * Ap[k];
        }
        if (worst_move(F, r) < tol) break;

        /* next search direction, kept conjugate to the last */
        memcpy(F->b, r, cells * sizeof(double));
        vcycle(0);
        memcpy(z, F->x, cells * sizeof(double));

        rzNew = 0.0;
        for (k = 0; k < cells; k++) rzNew += r[k] * z[k];
        beta = rzNew / rz;
        rz   = rzNew;
        for (k = 0; k < cells; k++) p[k] = z[k] + beta * p[k];
    }

    return it;
}

/*************************************************************
 * Function:    ns_vec_from_array
 * Input:       src (const double*) — values to copy
 *              n   (int)           — element count
 * Output:      Matrix* — new n x 1 column vector (caller owns it)
 * Description: Allocates through mat_new() so the result is freed
 *              like any other parse matrix.
 **************************************************************/
Matrix *ns_vec_from_array(const double *src, int n)
{
    Matrix *vec = mat_new(n, 1);

    memcpy(vec->data, src, n * sizeof(double));
    return vec;
}
