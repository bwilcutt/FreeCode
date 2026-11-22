/* =============================================================================
 * File:         channel.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible channel flow past a circular cylinder —
 *               the DFG "flow around a cylinder" benchmark (Schäfer &
 *               Turek, 1996) and anything else of that shape.
 *
 *               The file is in two halves:
 *                 Solver core (ch_*)  — the channel itself and the time
 *                   marching.  It neither knows nor cares what is in the
 *                   way: the obstacle arrives as a mask of solid cells
 *                   from the caller's body() hook.  slittest.c uses it
 *                   for a wall with slits in it.
 *                 Cylinder front end (run_channel) — the "channel"
 *                   command: builds the circle, measures drag, lift,
 *                   shedding and pressure drop on it, and compares
 *                   against DFG.
 *
 *               Method (velocity / pressure, projection method)
 *                 Staggered "MAC" grid of square cells, h = D / res:
 *                   u on the right face of each cell, v on the top face,
 *                   p at the cell centre.  A ring of ghost cells carries
 *                   the boundary conditions.  The obstacle is the set of
 *                   cells marked solid (for the cylinder, those whose
 *                   centres fall inside the circle — a "staircase" body).
 *                 Each time step:
 *                   1. Tentative velocities F, G from the momentum
 *                      equation without pressure — central differences
 *                      blended with upwinding by the factor gamma, the
 *                      scheme of Griebel, Dornseifer & Neunhoeffer.
 *                   2. Pressure from  lap(p) = div(F, G) / dt, solved by
 *                      ns_poisson() — the same solver navier.c uses —
 *                      with zero-gradient walls and p = 0 at the outlet.
 *                   3. u = F - dt dp/dx, v = G - dt dp/dy: the pressure
 *                      kick that makes the flow incompressible again.
 *                 Forces on the cylinder: a momentum balance on a box
 *                 drawn a diameter clear of it — flow, pressure and
 *                 viscous stress through the box edges, plus the change
 *                 of momentum inside.
 *
 *               Boundaries: parabolic inflow on the left, zero-gradient
 *               outflow on the right, no-slip walls top and bottom and
 *               on every solid cell.
 *
 *               Benchmarks (all defaults are the DFG set-up):
 *                 2D-1, Re = 20, steady:   cD 5.5795, cL 0.0106,
 *                                          dp 0.1175
 *                 2D-2, Re = 100, periodic: max cD 3.22, max cL 0.986,
 *                                          St 0.302
 *
 *               Accuracy against DFG (checked when written):
 *                 2D-1, res 10: drag +3.0%, pressure drop -5.6%
 *                 2D-1, res 20: drag +1.1%, pressure drop -2.7%
 *                 2D-2, res 10: max drag +3.8%, Strouhal -4.2%
 *                 2D-2, res 20: max drag +4.1%, Strouhal -2.1%, max lift
 *                               0.985 (reference 0.986)
 *
 *               Limits:
 *                 - The staircase body is a slightly blocky circle, so
 *                   expect a few percent on the forces; more res helps.
 *                 - Explicit time stepping: fine grids take a while.
 * ============================================================================= */

#include "channel.h"
#include "ns_core.h"

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

/* defaults — the DFG benchmark geometry and fluid */
#define CH_L_DEFAULT      2.2       /* channel length, m                         */
#define CH_H_DEFAULT      0.41      /* channel height, m                         */
#define CH_CX_DEFAULT     0.2       /* cylinder centre x, m                      */
#define CH_CY_DEFAULT     0.2       /* cylinder centre y, m (0.005 off-centre —
                                       on purpose, it is what starts shedding)   */
#define CH_D_DEFAULT      0.1       /* cylinder diameter, m                      */
#define CH_U_DEFAULT      0.3       /* peak inlet speed, m/s (Re = 20)           */
#define CH_NU_DEFAULT     0.001     /* kinematic viscosity, m^2/s                */
#define CH_RHO_DEFAULT    1.0       /* density, kg/m^3                           */
#define CH_RES_DEFAULT    10        /* cells across the diameter: drag within
                                       3% in seconds; res=20 halves that but
                                       takes minutes                            */
#define CH_T_DEFAULT      30.0      /* longest simulated time, s                 */
#define CH_TOL_DEFAULT    1e-4      /* settled when acceleration (scaled by
                                       D / Umean^2) drops below this            */

/* limits */
#define CH_RES_MIN        4
#define CH_RES_MAX        80
#define CH_CELLS_MAX      600000    /* past this, go find a supercomputer        */

/* numerics */
#define CH_TAU            0.5       /* safety factor on the stable time step     */
#define CH_GAMMA_SAFETY   0.3       /* upwind blend: 0 = pure central (wiggles
                                       at Re 100), 1.2 = textbook-safe (drag
                                       3-8% high).  0.3 matched DFG best        */
#define CH_POISSON_MAX    400       /* pressure-solver iterations per step       */
#define CH_POISSON_TOL_REL 1e-6     /* pressure tolerance, x Umean^2             */
#define CH_REPORT_EVERY   1000      /* progress line spacing, in steps           */
#define CH_HIST_MAX       2000      /* drag/lift history points kept             */

/* benchmark reference values, Schäfer & Turek / FeatFlow */
#define DFG1_CD           5.57953523384
#define DFG1_CL           0.010618948146
#define DFG1_DP           0.11752016697
#define DFG2_CDMAX        3.2200
#define DFG2_CLMAX        0.9859
#define DFG2_ST           0.30188

/* index into the (nx+2) x (ny+2) arrays, ghost ring included */
#define IX(i, j)  ((j) * stride + (i))

/* ═══════════════════════════════════════════════════════════
   SOLVER CORE — body-agnostic channel flow
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    ch_is_fluid
 * Input:       g    (const ChGrid*) — the grid
 *              i, j (int)           — cell indices, ghosts allowed
 * Output:      int — 1 for a fluid cell inside the channel, else 0
 * Description: Ghost cells count as not-fluid: they are boundary
 *              conditions, not flow.
 **************************************************************/
int ch_is_fluid(const ChGrid *g, int i, int j)
{
    int stride = g->nx + 2;

    if (i < 1 || i > g->nx || j < 1 || j > g->ny) return 0;
    return !g->solid[IX(i, j)];
}

/*************************************************************
 * Function:    apply_boundaries
 * Input:       g (ChGrid*) — velocities updated in place
 * Output:      void
 * Description: Sets every velocity that is a boundary condition
 *              rather than an unknown:
 *                inlet   — parabolic u, zero v (ghost reflection)
 *                outlet  — zero gradient
 *                walls   — no slip (v = 0 on, u reflected through)
 *                obstacle — zero on faces touching fluid, reflected
 *                          on faces buried inside it, so the wall
 *                          speed lands at zero halfway between
 **************************************************************/
static void apply_boundaries(ChGrid *g)
{
    int stride = g->nx + 2;
    int nx     = g->nx;
    int ny     = g->ny;
    int i;
    int j;
    int fl;
    int fr;

    /* ── inlet and outlet ── */
    for (j = 1; j <= ny; j++)
    {
        g->u[IX(0, j)]      = g->uin[j];            /* parabolic profile      */
        g->v[IX(0, j)]      = -g->v[IX(1, j)];      /* v = 0 at the inlet     */
        g->u[IX(nx, j)]     = g->u[IX(nx - 1, j)];  /* let it leave as it is  */
        g->v[IX(nx + 1, j)] = g->v[IX(nx, j)];
    }

    /* ── top and bottom walls ── */
    for (i = 0; i <= nx + 1; i++)
    {
        g->v[IX(i, 0)]      = 0.0;
        g->v[IX(i, ny)]     = 0.0;
        g->u[IX(i, 0)]      = -g->u[IX(i, 1)];
        g->u[IX(i, ny + 1)] = -g->u[IX(i, ny)];
    }

    /* ── obstacle: u faces ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i < nx; i++)
        {
            fl = ch_is_fluid(g, i, j);
            fr = ch_is_fluid(g, i + 1, j);
            if (fl && fr) continue;                          /* a real unknown */

            if (fl || fr)
                g->u[IX(i, j)] = 0.0;                        /* face on the wall */
            else if (ch_is_fluid(g, i, j + 1) && ch_is_fluid(g, i + 1, j + 1))
                g->u[IX(i, j)] = -g->u[IX(i, j + 1)];        /* fluid above      */
            else if (ch_is_fluid(g, i, j - 1) && ch_is_fluid(g, i + 1, j - 1))
                g->u[IX(i, j)] = -g->u[IX(i, j - 1)];        /* fluid below      */
            else
                g->u[IX(i, j)] = 0.0;                        /* deep inside      */
        }
    }

    /* ── obstacle: v faces ── */
    for (j = 1; j < ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            fl = ch_is_fluid(g, i, j);
            fr = ch_is_fluid(g, i, j + 1);
            if (fl && fr) continue;

            if (fl || fr)
                g->v[IX(i, j)] = 0.0;
            else if (ch_is_fluid(g, i + 1, j) && ch_is_fluid(g, i + 1, j + 1))
                g->v[IX(i, j)] = -g->v[IX(i + 1, j)];        /* fluid to the right */
            else if (ch_is_fluid(g, i - 1, j) && ch_is_fluid(g, i - 1, j + 1))
                g->v[IX(i, j)] = -g->v[IX(i - 1, j)];        /* fluid to the left  */
            else
                g->v[IX(i, j)] = 0.0;
        }
    }
}

/*************************************************************
 * Function:    compute_FG
 * Input:       g     (ChGrid*) — grid; F and G written
 *              dt    (double)  — time step
 *              gamma (double)  — upwind blend, 0 = central, 1 = donor cell
 * Output:      void
 * Description: Tentative velocities: one explicit step of the
 *              momentum equations with the pressure term left out.
 *              On faces that are boundary conditions F = u, G = v,
 *              which keeps the pressure equation consistent there.
 **************************************************************/
static void compute_FG(ChGrid *g, double dt, double gamma)
{
    int     stride = g->nx + 2;
    int     nx     = g->nx;
    int     ny     = g->ny;
    double  h      = g->h;
    double  ih     = 1.0 / h;
    double  ih2    = 1.0 / (h * h);
    double *u      = g->u;
    double *v      = g->v;
    double  du2dx, duvdy, duvdx, dv2dy, lap;
    double  a, b, c, d;
    int     i;
    int     j;

    /* everything starts as "boundary"; real unknowns overwrite below */
    memcpy(g->F, u, (size_t)(nx + 2) * (ny + 2) * sizeof(double));
    memcpy(g->G, v, (size_t)(nx + 2) * (ny + 2) * sizeof(double));

    /* ── F on u faces between two fluid cells ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i < nx; i++)
        {
            if (!ch_is_fluid(g, i, j) || !ch_is_fluid(g, i + 1, j)) continue;

            /* d(u^2)/dx: averages to the cell centres either side */
            a = 0.5 * (u[IX(i, j)]     + u[IX(i + 1, j)]);
            b = 0.5 * (u[IX(i - 1, j)] + u[IX(i, j)]);
            du2dx = ih * (a * a - b * b)
                  + gamma * ih * (fabs(a) * 0.5 * (u[IX(i, j)] - u[IX(i + 1, j)])
                                - fabs(b) * 0.5 * (u[IX(i - 1, j)] - u[IX(i, j)]));

            /* d(uv)/dy: v carried to the face corners above and below */
            c = 0.5 * (v[IX(i, j)]     + v[IX(i + 1, j)]);
            d = 0.5 * (v[IX(i, j - 1)] + v[IX(i + 1, j - 1)]);
            duvdy = ih * (c * 0.5 * (u[IX(i, j)] + u[IX(i, j + 1)])
                        - d * 0.5 * (u[IX(i, j - 1)] + u[IX(i, j)]))
                  + gamma * ih * (fabs(c) * 0.5 * (u[IX(i, j)] - u[IX(i, j + 1)])
                                - fabs(d) * 0.5 * (u[IX(i, j - 1)] - u[IX(i, j)]));

            lap = ih2 * (u[IX(i + 1, j)] + u[IX(i - 1, j)] +
                         u[IX(i, j + 1)] + u[IX(i, j - 1)] - 4.0 * u[IX(i, j)]);

            g->F[IX(i, j)] = u[IX(i, j)] + dt * (g->nu * lap - du2dx - duvdy);
        }
    }

    /* ── G on v faces between two fluid cells ── */
    for (j = 1; j < ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            if (!ch_is_fluid(g, i, j) || !ch_is_fluid(g, i, j + 1)) continue;

            /* d(uv)/dx: u carried to the face corners right and left */
            a = 0.5 * (u[IX(i, j)]     + u[IX(i, j + 1)]);
            b = 0.5 * (u[IX(i - 1, j)] + u[IX(i - 1, j + 1)]);
            duvdx = ih * (a * 0.5 * (v[IX(i, j)] + v[IX(i + 1, j)])
                        - b * 0.5 * (v[IX(i - 1, j)] + v[IX(i, j)]))
                  + gamma * ih * (fabs(a) * 0.5 * (v[IX(i, j)] - v[IX(i + 1, j)])
                                - fabs(b) * 0.5 * (v[IX(i - 1, j)] - v[IX(i, j)]));

            /* d(v^2)/dy */
            c = 0.5 * (v[IX(i, j)]     + v[IX(i, j + 1)]);
            d = 0.5 * (v[IX(i, j - 1)] + v[IX(i, j)]);
            dv2dy = ih * (c * c - d * d)
                  + gamma * ih * (fabs(c) * 0.5 * (v[IX(i, j)] - v[IX(i, j + 1)])
                                - fabs(d) * 0.5 * (v[IX(i, j - 1)] - v[IX(i, j)]));

            lap = ih2 * (v[IX(i + 1, j)] + v[IX(i - 1, j)] +
                         v[IX(i, j + 1)] + v[IX(i, j - 1)] - 4.0 * v[IX(i, j)]);

            g->G[IX(i, j)] = v[IX(i, j)] + dt * (g->nu * lap - duvdx - dv2dy);
        }
    }
}

/*************************************************************
 * Function:    project
 * Input:       g          (ChGrid*) — grid; p, u, v updated
 *              dt         (double)  — time step
 *              tol        (double)  — pressure-solver tolerance
 * Output:      double — largest velocity change this step, m/s
 * Description: Pressure solve and the correction that removes the
 *              divergence F and G picked up.  Returns how much the
 *              velocity field moved, for the "settled" test.
 **************************************************************/
static double project(ChGrid *g, double dt, double tol)
{
    int     stride = g->nx + 2;
    int     nx     = g->nx;
    int     ny     = g->ny;
    double  h      = g->h;
    double  unew;
    double  change = 0.0;
    int     i;
    int     j;

    /* ── source: lap(p) = div(F,G) / dt, written as -src for ns_core ── */
    for (j = 1; j <= ny; j++)
        for (i = 1; i <= nx; i++)
            MAT(g->rhs, j, i) = ch_is_fluid(g, i, j)
                ? -((g->F[IX(i, j)] - g->F[IX(i - 1, j)]) +
                    (g->G[IX(i, j)] - g->G[IX(i, j - 1)])) / (h * dt)
                : 0.0;

    ns_poisson(g->p, g->rhs, g->ptype, h, CH_POISSON_MAX, tol);

    /* ── pressure kick on every unknown face ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i < nx; i++)
        {
            if (!ch_is_fluid(g, i, j) || !ch_is_fluid(g, i + 1, j)) continue;
            unew = g->F[IX(i, j)] -
                   dt / h * (MAT(g->p, j, i + 1) - MAT(g->p, j, i));
            if (fabs(unew - g->u[IX(i, j)]) > change)
                change = fabs(unew - g->u[IX(i, j)]);
            g->u[IX(i, j)] = unew;
        }
    }
    for (j = 1; j < ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            if (!ch_is_fluid(g, i, j) || !ch_is_fluid(g, i, j + 1)) continue;
            unew = g->G[IX(i, j)] -
                   dt / h * (MAT(g->p, j + 1, i) - MAT(g->p, j, i));
            if (fabs(unew - g->v[IX(i, j)]) > change)
                change = fabs(unew - g->v[IX(i, j)]);
            g->v[IX(i, j)] = unew;
        }
    }

    return change;
}

/*************************************************************
 * Function:    ch_grid_dims
 * Input:       s       (const ChSetup*) — the set-up
 *              nx, ny  (int*)           — receive the cell counts
 *              h       (double*)        — receives the cell size, m
 * Output:      void
 * Description: Grid the solver would build for this set-up, so a
 *              caller can check sizes and fit before allocating.
 **************************************************************/
void ch_grid_dims(const ChSetup *s, int *nx, int *ny, double *h)
{
    *h  = s->D / s->res;
    *nx = (int)(s->L / *h + 0.5);
    *ny = (int)(s->H / *h + 0.5);
}

/*************************************************************
 * Function:    ch_grid_init
 * Input:       g      (ChGrid*)         — filled in
 *              s      (const ChSetup*)  — the set-up
 *              hooks  (const ChHooks*)  — body() marks the solid cells
 * Output:      int — 0 = ready, -1 = too many cells (nothing allocated)
 * Description: Allocates the grid, lets body() mark the obstacle,
 *              sets the pressure cell types and the parabolic inlet,
 *              and starts the whole channel already flowing with it.
 **************************************************************/
int ch_grid_init(ChGrid *g, const ChSetup *s, const ChHooks *hooks)
{
    int    stride;
    int    nx, ny;
    int    i, j;
    double h, y;

    ch_grid_dims(s, &nx, &ny, &h);
    if ((double)nx * ny > CH_CELLS_MAX) return -1;

    /* ── allocate ── */
    stride   = nx + 2;
    g->nx    = nx;
    g->ny    = ny;
    g->h     = h;
    g->nu    = s->nu;
    g->D     = s->D;
    g->rho   = s->rho;
    g->Umean = 2.0 * s->U / 3.0;
    g->solid = calloc((size_t)stride * (ny + 2), 1);
    g->ptype = calloc((size_t)stride * (ny + 2), 1);
    g->u     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g->v     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g->F     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g->G     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g->uin   = calloc((size_t)ny + 2, sizeof(double));
    g->p     = mat_new(ny + 2, stride);
    g->rhs   = mat_new(ny + 2, stride);

    /* ── the caller says what's in the way ── */
    hooks->body(g, hooks->ctx);

    /* ── pressure cell types: fluid solved, obstacle and closed
          boundaries are walls, the outlet ghost column holds p = 0 ── */
    for (j = 0; j <= ny + 1; j++)
    {
        for (i = 0; i <= nx + 1; i++)
        {
            if (i == nx + 1 && j >= 1 && j <= ny)
                g->ptype[IX(i, j)] = NS_CELL_FIXED;
            else if (ch_is_fluid(g, i, j))
                g->ptype[IX(i, j)] = NS_CELL_FLUID;
            else
                g->ptype[IX(i, j)] = NS_CELL_SOLID;
        }
    }

    /* ── parabolic inlet, and the whole channel starts already flowing
          with it — reaches steady state far sooner than from rest ── */
    for (j = 1; j <= ny; j++)
    {
        y         = (j - 0.5) * h;
        g->uin[j] = 4.0 * s->U * y * (s->H - y) / (s->H * s->H);
        for (i = 0; i <= nx; i++)
            g->u[IX(i, j)] = g->uin[j];
    }
    apply_boundaries(g);

    return 0;
}

/*************************************************************
 * Function:    ch_solve
 * Input:       g      (ChGrid*)         — from ch_grid_init(), updated
 *              s      (const ChSetup*)  — same set-up as the init
 *              hooks  (const ChHooks*)  — step()/report() may be NULL
 *              info   (ChRunInfo*)      — receives how it ended
 * Output:      int — 0 = ran, 1 = became unstable (see info->t)
 * Description: Marches the projection method in time until the flow
 *              settles below s->tol, the time runs out, or it blows up.
 **************************************************************/
int ch_solve(ChGrid *g, const ChSetup *s, const ChHooks *hooks, ChRunInfo *info)
{
    int    stride = g->nx + 2;
    int    ny     = g->ny;
    double h      = g->h;
    double nu     = g->nu;
    double U      = s->U;
    double dt, gamma, umax, vmax;
    double poissonTol;
    double t      = 0.0;
    int    step   = 0;
    double change;
    double accel;
    double gsafe  = (s->gamma_safety > 0.0) ? s->gamma_safety : CH_GAMMA_SAFETY;
    double uref;
    int    k;

    info->t        = 0.0;
    info->steps    = 0;
    info->steady   = 0;
    info->unstable = 0;

    /* pressure tolerance, scaled on the flow's own speed */
    uref       = (s->Uref > 0.0) ? s->Uref : g->Umean;
    poissonTol = CH_POISSON_TOL_REL * uref * uref;

    /* ── march in time ── */
    while (t < s->t_end)
    {
        /* largest speeds on the grid, for the stability limits */
        umax = U;
        vmax = 0.0;
        for (k = 0; k < stride * (ny + 2); k++)
        {
            if (fabs(g->u[k]) > umax) umax = fabs(g->u[k]);
            if (fabs(g->v[k]) > vmax) vmax = fabs(g->v[k]);
        }

        /* time step: diffusion, then convection in x and y */
        dt = 0.25 * h * h / nu;
        if (h / umax < dt)                dt = h / umax;
        if (vmax > 0.0 && h / vmax < dt)  dt = h / vmax;
        dt *= CH_TAU;

        /* the last step is NOT trimmed to land on t_end exactly: a sliver
           of a step makes the momentum change per second in the force
           balance jump, and drag would end on a fake dip */

        /* a pinch of upwinding to keep the wake smooth — more than this
           and numerical viscosity starts doing the fluid's job for it.
           A caller running at high Re may ask for more (gamma_safety). */
        gamma = gsafe * fmax(umax, vmax) * dt / h;
        if (gamma > 1.0) gamma = 1.0;

        compute_FG(g, dt, gamma);
        change = project(g, dt, poissonTol);
        apply_boundaries(g);

        t += dt;
        step++;

        /* blow-up check: NaN spreads faster than gossip */
        if (isnan(change) || isinf(change))
        {
            info->t        = t;
            info->steps    = step;
            info->unstable = 1;
            return 1;
        }

        /* the caller's per-step work: forces, tracers, whatever */
        if (hooks->step) hooks->step(g, t, dt, hooks->ctx);

        /* settled?  acceleration, scaled by D / Umean^2 */
        accel = change / dt * g->D / (g->Umean * g->Umean);
        if (accel < s->tol) { info->steady = 1; break; }

        if (hooks->report && step % CH_REPORT_EVERY == 0)
            hooks->report(g, t, accel, hooks->ctx);
    }

    info->t     = t;
    info->steps = step;
    return 0;
}

/*************************************************************
 * Function:    ch_grid_free
 * Input:       g (ChGrid*) — grid from ch_grid_init()
 * Output:      void
 * Description: Releases every array the grid owns.
 **************************************************************/
void ch_grid_free(ChGrid *g)
{
    free(g->solid); free(g->ptype);
    free(g->u); free(g->v); free(g->F); free(g->G); free(g->uin);
    mat_free(g->p); mat_free(g->rhs);
}

/* ═══════════════════════════════════════════════════════════
   CYLINDER FRONT END — the "channel" command
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      CylCtx
 * Description: What the cylinder's hooks need between time steps.
 *
 *   cx, cy, D     cylinder centre and diameter, m (for body())
 *   box           force-balance box edges, il ir jb jt (face indices)
 *   mx_old,my_old box momentum at the previous step, per unit rho
 *   cd, cl        latest drag and lift coefficients
 *   hist_*        drag / lift history, grown as needed
 *************************************************************/
typedef struct
{
    double  cx;
    double  cy;
    double  D;
    int     box[4];
    double  mx_old;
    double  my_old;
    double  cd;
    double  cl;
    double *hist_t;
    double *hist_cd;
    double *hist_cl;
    int     hist_n;
    int     hist_cap;
} CylCtx;

/*************************************************************
 * Function:    box_momentum
 * Input:       g      (const ChGrid*) — grid
 *              box    (const int*)    — il, ir, jb, jt: the box edges
 *                                       as face indices
 *              mx, my (double*)       — receive the x and y momentum of
 *                                       the fluid inside, per unit rho
 * Output:      void
 * Description: Sum of cell-centre velocity x cell area over the fluid
 *              cells in the box.  Its rate of change is the unsteady
 *              part of the force balance in cylinder_forces().
 **************************************************************/
static void box_momentum(const ChGrid *g, const int *box,
                         double *mx, double *my)
{
    int    stride = g->nx + 2;
    double h2     = g->h * g->h;
    int    i;
    int    j;

    *mx = 0.0;
    *my = 0.0;
    for (j = box[2] + 1; j <= box[3]; j++)
    {
        for (i = box[0] + 1; i <= box[1]; i++)
        {
            if (!ch_is_fluid(g, i, j)) continue;
            *mx += 0.5 * (g->u[IX(i - 1, j)] + g->u[IX(i, j)]) * h2;
            *my += 0.5 * (g->v[IX(i, j - 1)] + g->v[IX(i, j)]) * h2;
        }
    }
}

/*************************************************************
 * Function:    cylinder_forces
 * Input:       g       (const ChGrid*) — grid
 *              box     (const int*)    — il, ir, jb, jt (box_momentum)
 *              dmx_dt, dmy_dt (double) — rate of change of the box's
 *                                        momentum, per unit rho
 *              fx, fy  (double*)       — receive drag and lift, N per m
 *                                        of cylinder length
 * Output:      void
 * Description: Momentum balance on a box drawn round the cylinder,
 *              a diameter clear of it on every side.  What flows in
 *              and out through the box edges — momentum carried by the
 *              flow, pressure, viscous stress — plus the change of
 *              momentum inside, must be the push the cylinder gives
 *              the fluid.  Reading the box edges, out in smooth flow,
 *              beats reading the blocky staircase surface, where the
 *              nearest pressure sits half a cell off the wall.
 **************************************************************/
static void cylinder_forces(const ChGrid *g, const int *box,
                            double dmx_dt, double dmy_dt,
                            double *fx, double *fy)
{
    int           stride = g->nx + 2;
    double        h      = g->h;
    double        nu     = g->nu;
    const double *u      = g->u;
    const double *v      = g->v;
    int           il = box[0], ir = box[1], jb = box[2], jt = box[3];
    double        ox = 0.0, oy = 0.0;   /* net outflow of momentum + stress */
    double        uu, vv, pp, txx, tyy, txy;
    int           i;
    int           j;
    int           e;
    int           ie;
    int           je;
    double        sgn;

    /* ── left and right edges: normal -x and +x ── */
    for (e = 0; e < 2; e++)
    {
        ie  = e ? ir : il;
        sgn = e ? 1.0 : -1.0;
        for (j = jb + 1; j <= jt; j++)
        {
            uu  = u[IX(ie, j)];
            vv  = 0.25 * (v[IX(ie, j)] + v[IX(ie + 1, j)] +
                          v[IX(ie, j - 1)] + v[IX(ie + 1, j - 1)]);
            pp  = 0.5 * (MAT(g->p, j, ie) + MAT(g->p, j, ie + 1));
            txx = 2.0 * nu * (u[IX(ie + 1, j)] - u[IX(ie - 1, j)]) / (2.0 * h);
            txy = nu * ((u[IX(ie, j + 1)] - u[IX(ie, j - 1)]) / (2.0 * h) +
                        (0.5 * (v[IX(ie + 1, j)] + v[IX(ie + 1, j - 1)]) -
                         0.5 * (v[IX(ie, j)]     + v[IX(ie, j - 1)])) / h);

            ox += sgn * (uu * uu + pp - txx) * h;
            oy += sgn * (vv * uu - txy) * h;
        }
    }

    /* ── bottom and top edges: normal -y and +y ── */
    for (e = 0; e < 2; e++)
    {
        je  = e ? jt : jb;
        sgn = e ? 1.0 : -1.0;
        for (i = il + 1; i <= ir; i++)
        {
            vv  = v[IX(i, je)];
            uu  = 0.25 * (u[IX(i, je)] + u[IX(i - 1, je)] +
                          u[IX(i, je + 1)] + u[IX(i - 1, je + 1)]);
            pp  = 0.5 * (MAT(g->p, je, i) + MAT(g->p, je + 1, i));
            tyy = 2.0 * nu * (v[IX(i, je + 1)] - v[IX(i, je - 1)]) / (2.0 * h);
            txy = nu * ((v[IX(i + 1, je)] - v[IX(i - 1, je)]) / (2.0 * h) +
                        (0.5 * (u[IX(i, je + 1)] + u[IX(i - 1, je + 1)]) -
                         0.5 * (u[IX(i, je)]     + u[IX(i - 1, je)])) / h);

            ox += sgn * (uu * vv - txy) * h;
            oy += sgn * (vv * vv + pp - tyy) * h;
        }
    }

    /* force ON the cylinder = what the box loses, kinematic -> real */
    *fx = -g->rho * (ox + dmx_dt);
    *fy = -g->rho * (oy + dmy_dt);
}

/*************************************************************
 * Function:    pressure_drop
 * Input:       g      (const ChGrid*) — grid
 *              cy     (double)        — cylinder centre height, m
 * Output:      double — p(front) - p(back), Pa
 * Description: Along the row through the cylinder centre, takes the
 *              last fluid cell before the cylinder and the first one
 *              after it — the DFG points sit on the surface, which
 *              on a staircase is half a cell from these centres.
 **************************************************************/
static double pressure_drop(const ChGrid *g, double cy)
{
    int stride = g->nx + 2;
    int j      = (int)(cy / g->h) + 1;
    int i      = 1;
    int front;

    if (j < 1)     j = 1;
    if (j > g->ny) j = g->ny;

    /* walk downstream to the cylinder ... */
    while (i < g->nx && !g->solid[IX(i + 1, j)]) i++;
    front = i;

    /* ... and through it */
    i++;
    while (i <= g->nx && g->solid[IX(i, j)]) i++;
    if (i > g->nx) return 0.0;      /* row missed the cylinder entirely */

    return g->rho * (MAT(g->p, j, front) - MAT(g->p, j, i));
}

/*************************************************************
 * Function:    shedding_strouhal
 * Input:       t, cl (const double*) — lift history
 *              n     (int)           — samples
 *              first (int)           — first sample to look at
 *              D, Umean (double)     — for the dimensionless form
 * Output:      double — St = f D / Umean, or 0 if not oscillating
 * Description: Lift swings up and down once per shedding cycle.
 *              Counts upward crossings of the mean over the window
 *              (interpolated in time) and divides cycles by time.
 **************************************************************/
static double shedding_strouhal(const double *t, const double *cl, int n,
                                int first, double D, double Umean)
{
    double mean = 0.0;
    double lo   =  1e300;
    double hi   = -1e300;
    double tc;
    double t_first = 0.0;
    double t_last  = 0.0;
    int    ups     = 0;
    int    k;

    if (n - first < 8) return 0.0;

    for (k = first; k < n; k++)
    {
        mean += cl[k];
        lo    = fmin(lo, cl[k]);
        hi    = fmax(hi, cl[k]);
    }
    mean /= (n - first);

    /* a flat line has no frequency, however hard you count */
    if (hi - lo < 1e-3) return 0.0;

    for (k = first + 1; k < n; k++)
    {
        if (cl[k - 1] < mean && cl[k] >= mean)
        {
            tc = t[k - 1] + (mean - cl[k - 1]) / (cl[k] - cl[k - 1]) * (t[k] - t[k - 1]);
            if (ups == 0) t_first = tc;
            t_last = tc;
            ups++;
        }
    }

    if (ups < 3 || t_last <= t_first) return 0.0;
    return (ups - 1) / (t_last - t_first) * D / Umean;
}

/*************************************************************
 * Function:    cyl_body
 * Input:       g   (ChGrid*) — grid; solid cells marked
 *              ctx (void*)   — CylCtx with the centre and diameter
 * Output:      void
 * Description: Staircase cylinder: every cell whose centre is inside
 *              the circle.
 **************************************************************/
static void cyl_body(ChGrid *g, void *ctx)
{
    CylCtx *c      = ctx;
    int     stride = g->nx + 2;
    double  x, y, r2;
    int     i, j;

    for (j = 1; j <= g->ny; j++)
    {
        for (i = 1; i <= g->nx; i++)
        {
            x  = (i - 0.5) * g->h - c->cx;
            y  = (j - 0.5) * g->h - c->cy;
            r2 = x * x + y * y;
            g->solid[IX(i, j)] = (r2 < 0.25 * c->D * c->D);
        }
    }
}

/*************************************************************
 * Function:    cyl_step
 * Input:       g   (ChGrid*) — grid after a good time step
 *              t   (double)  — time reached, s
 *              dt  (double)  — the step just taken, s
 *              ctx (void*)   — CylCtx; forces and history updated
 * Output:      void
 * Description: Drag and lift this step from the box balance, into
 *              the history.
 **************************************************************/
static void cyl_step(ChGrid *g, double t, double dt, void *ctx)
{
    CylCtx *c = ctx;
    double  mx, my, fx, fy;

    box_momentum(g, c->box, &mx, &my);
    cylinder_forces(g, c->box, (mx - c->mx_old) / dt, (my - c->my_old) / dt,
                    &fx, &fy);
    c->mx_old = mx;
    c->my_old = my;
    c->cd = 2.0 * fx / (g->rho * g->Umean * g->Umean * g->D);
    c->cl = 2.0 * fy / (g->rho * g->Umean * g->Umean * g->D);

    /* grow the history by doubling — realloc's favourite exercise */
    if (c->hist_n == c->hist_cap)
    {
        c->hist_cap = c->hist_cap ? c->hist_cap * 2 : 4096;
        c->hist_t   = realloc(c->hist_t,  c->hist_cap * sizeof(double));
        c->hist_cd  = realloc(c->hist_cd, c->hist_cap * sizeof(double));
        c->hist_cl  = realloc(c->hist_cl, c->hist_cap * sizeof(double));
    }
    c->hist_t[c->hist_n]  = t;
    c->hist_cd[c->hist_n] = c->cd;
    c->hist_cl[c->hist_n] = c->cl;
    c->hist_n++;
}

/*************************************************************
 * Function:    cyl_report
 * Input:       g     (ChGrid*) — grid (unused)
 *              t     (double)  — time reached, s
 *              accel (double)  — scaled acceleration
 *              ctx   (void*)   — CylCtx with the latest forces
 * Output:      void
 * Description: The periodic progress line.
 **************************************************************/
static void cyl_report(ChGrid *g, double t, double accel, void *ctx)
{
    CylCtx *c = ctx;

    (void)g;
    printf("    t = %-8.4g  drag %-9.5g lift %-9.5g  change %.3g\n",
           t, c->cd, c->cl, accel);
    fflush(stdout);
}

/*************************************************************
 * Function:    channel_usage
 * Input:       void
 * Output:      void — usage text printed to stdout
 * Description: Shown for "channel ?" and on bad input.
 **************************************************************/
static void channel_usage(void)
{
    printf("\n  Channel flow past a cylinder\n");
    printf("  ──────────────────────────────────────────────────────────\n");
    printf("  channel [Re=<>] [U=<>] [nu=<>] [rho=<>]\n");
    printf("          [L=<>] [H=<>] [cx=<>] [cy=<>] [D=<>]\n");
    printf("          [res=<>] [t=<>] [tol=<>]\n");
    printf("\n");
    printf("  Defaults are the DFG benchmark: a 2.2 x 0.41 m channel, a\n");
    printf("  0.1 m cylinder at (0.2, 0.2), nu = 0.001 (a thick oil), peak inlet\n");
    printf("  speed U = 0.3 m/s (Re = 20).  Re=<> sets the inlet speed for you.\n");
    printf("  res = grid cells across the cylinder (default %d).\n", CH_RES_DEFAULT);
    printf("  \"channel\" alone runs DFG case 2D-1; \"channel Re=100 t=8\" runs 2D-2.\n");
    printf("\n");
    printf("    -> $channel_cd $channel_cl $channel_dp $channel_st\n");
    printf("    -> $channel_cdmax $channel_clmax $channel_steady\n");
    printf("    -> $channel_tv $channel_cdv $channel_clv  (force history)\n");
    printf("    -> $channel_ufield $channel_vfield $channel_pfield\n");
    printf("       $channel_wfield $channel_solid           (full fields)\n");
    printf("  ──────────────────────────────────────────────────────────\n\n");
}

/*************************************************************
 * Function:    run_channel
 * Input:       args (const char*) — text following the "channel" keyword
 * Output:      void — results printed and stored in $channel_* variables
 * Description: Reads the set-up, has the core build the grid with a
 *              staircase cylinder in it, time-steps until the flow
 *              settles or the time runs out, then reports forces,
 *              pressure drop, shedding frequency and the benchmark
 *              comparison.
 **************************************************************/
void run_channel(const char *args)
{
    double    L = CH_L_DEFAULT, H = CH_H_DEFAULT;
    double    cx = CH_CX_DEFAULT, cy = CH_CY_DEFAULT, D = CH_D_DEFAULT;
    double    U = CH_U_DEFAULT, nu = CH_NU_DEFAULT, rho = CH_RHO_DEFAULT;
    double    res_d = CH_RES_DEFAULT, t_end = CH_T_DEFAULT, tol = CH_TOL_DEFAULT;
    double    Re = 0.0;
    int       haveRe = 0;
    int       found  = 0;
    ChGrid    g;
    ChSetup   s;
    ChHooks   hooks;
    ChRunInfo info;
    CylCtx    c;
    int       stride;
    int       nx, ny, res;
    int       i, j, k;
    double    h;
    double    t;
    int       step;
    int       steady;
    double    cd, cl;
    double    cdmax, clmax, cdmean, clmean, dp, st;
    int       first, nkeep, ref;
    double   *tv, *cdv, *clv;
    Matrix   *uf, *vf, *pf, *wf, *sf;
    double    uc_l, uc_r, vc_b, vc_t;

    /* ── "channel ?" ── */
    while (isspace(*args)) args++;
    if (*args == '?') { channel_usage(); return; }

    /* ── inputs ── */
    parse_named_param(args, "L",   &L,     &found);
    parse_named_param(args, "H",   &H,     &found);
    parse_named_param(args, "cx",  &cx,    &found);
    parse_named_param(args, "cy",  &cy,    &found);
    parse_named_param(args, "D",   &D,     &found);
    parse_named_param(args, "U",   &U,     &found);
    parse_named_param(args, "nu",  &nu,    &found);
    parse_named_param(args, "rho", &rho,   &found);
    parse_named_param(args, "res", &res_d, &found);
    parse_named_param(args, "t",   &t_end, &found);
    parse_named_param(args, "tol", &tol,   &found);
    parse_named_param(args, "Re",  &Re,    &haveRe);

    /* ── sanity, in plain words ── */
    if (nu <= 0.0 || rho <= 0.0 || D <= 0.0 || L <= 0.0 || H <= 0.0)
    {
        printf("  channel: viscosity, density and all sizes must be above zero.\n\n");
        return;
    }

    /* Re given?  Then it sets the inlet: peak = 1.5 x mean for a parabola */
    if (haveRe && Re > 0.0) U = 1.5 * Re * nu / D;
    if (U <= 0.0)
    {
        printf("  channel: the inlet speed U must be above zero.\n\n");
        return;
    }
    Re = (2.0 * U / 3.0) * D / nu;

    res = (int)(res_d + 0.5);
    if (res < CH_RES_MIN) res = CH_RES_MIN;
    if (res > CH_RES_MAX) res = CH_RES_MAX;
    if (t_end <= 0.0) t_end = CH_T_DEFAULT;
    if (tol   <= 0.0) tol   = CH_TOL_DEFAULT;

    /* ── the set-up the core will build ── */
    s.L     = L;
    s.H     = H;
    s.U     = U;
    s.nu    = nu;
    s.rho   = rho;
    s.D     = D;
    s.res   = res;
    s.t_end = t_end;
    s.tol   = tol;
    s.gamma_safety = 0.0;           /* DFG-tuned default */
    s.Uref         = 0.0;           /* tolerance on the mean inlet speed */

    /* ── size and fit checks before anything is allocated ── */
    ch_grid_dims(&s, &nx, &ny, &h);
    if ((double)nx * ny > CH_CELLS_MAX)
    {
        printf("  channel: %d x %d is too many grid cells.  Lower res.\n\n", nx, ny);
        return;
    }
    if (cx - D / 2 < 2 * h || cx + D / 2 > L - 2 * h ||
        cy - D / 2 < 2 * h || cy + D / 2 > H - 2 * h)
    {
        printf("  channel: the cylinder must sit fully inside the channel,\n");
        printf("           clear of the walls and both ends.\n\n");
        return;
    }

    /* ── hooks: the circle, the forces, the progress line ── */
    memset(&c, 0, sizeof c);
    c.cx = cx;
    c.cy = cy;
    c.D  = D;
    hooks.body   = cyl_body;
    hooks.step   = cyl_step;
    hooks.report = cyl_report;
    hooks.ctx    = &c;

    if (ch_grid_init(&g, &s, &hooks) != 0) return;   /* checked above */
    stride = nx + 2;

    /* ── force-balance box: one diameter clear of the cylinder each
          side, snapped to cell faces, kept inside the channel ── */
    c.box[0] = (int)floor((cx - D) / h);
    c.box[1] = (int)ceil ((cx + D) / h);
    c.box[2] = (int)floor((cy - D) / h);
    c.box[3] = (int)ceil ((cy + D) / h);
    if (c.box[0] < 2)      c.box[0] = 2;
    if (c.box[1] > nx - 2) c.box[1] = nx - 2;
    if (c.box[2] < 2)      c.box[2] = 2;
    if (c.box[3] > ny - 2) c.box[3] = ny - 2;
    box_momentum(&g, c.box, &c.mx_old, &c.my_old);

    printf("\n  Channel Flow Past a Cylinder\n");
    printf("  ──────────────────────────────────────────────\n");
    printf("  Re = %-8.4g  grid = %d x %d  (%d cells across the cylinder)\n",
           Re, nx, ny, res);
    printf("  Peak inlet speed %g m/s, mean %g m/s\n", U, g.Umean);
    printf("  solving ...\n");
    fflush(stdout);

    /* ── march in time ── */
    if (ch_solve(&g, &s, &hooks, &info) != 0)
    {
        printf("  channel: the solution became unstable at t = %.4g s.\n", info.t);
        printf("           Try a finer grid (larger res).\n\n");
        goto cleanup;
    }
    t      = info.t;
    step   = info.steps;
    steady = info.steady;
    cd     = c.cd;
    cl     = c.cl;

    /* ── results ── */
    first  = steady ? c.hist_n - 1 : (2 * c.hist_n) / 3;   /* last third if moving */
    cdmax  = -1e300; clmax = -1e300; cdmean = 0.0; clmean = 0.0;
    for (k = first; k < c.hist_n; k++)
    {
        cdmax   = fmax(cdmax, c.hist_cd[k]);
        clmax   = fmax(clmax, c.hist_cl[k]);
        cdmean += c.hist_cd[k];
        clmean += c.hist_cl[k];
    }
    cdmean /= (c.hist_n - first);
    clmean /= (c.hist_n - first);

    st = steady ? 0.0
                : shedding_strouhal(c.hist_t, c.hist_cl, c.hist_n, first, D, g.Umean);
    dp = pressure_drop(&g, cy);

    /* report the mean when shedding, the final value when steady */
    if (st > 0.0) { cd = cdmean; cl = clmean; }

    /* ── is this one of the DFG benchmark cases? ── */
    ref = 0;
    if (fabs(L - 2.2) < 1e-9 && fabs(H - 0.41) < 1e-9 &&
        fabs(cx - 0.2) < 1e-9 && fabs(cy - 0.2) < 1e-9 && fabs(D - 0.1) < 1e-9)
    {
        if      (fabs(Re - 20.0)  < 0.5) ref = 1;
        else if (fabs(Re - 100.0) < 0.5) ref = 2;
    }

    printf("  ──────────────────────────────────────────────\n");
    if (steady)
        printf("  Settled to a steady flow at t = %.4g s (%d steps)\n", t, step);
    else if (st > 0.0)
        printf("  Vortex shedding — the flow never settles (t = %.4g s, %d steps)\n",
               t, step);
    else
        printf("  Stopped at t = %.4g s, still changing (%d steps)\n", t, step);

    if (st > 0.0)
    {
        printf("  Drag coefficient   mean %-9.5g  max %.5g\n", cdmean, cdmax);
        printf("  Lift coefficient   mean %-9.5g  max %.5g\n", clmean, clmax);
        printf("  Strouhal number    %.4g  (shedding every %.4g s)\n",
               st, D / (st * g.Umean));
    }
    else
    {
        printf("  Drag coefficient   %.5g\n", cd);
        printf("  Lift coefficient   %.5g\n", cl);
    }
    printf("  Pressure drop across the cylinder  %.5g Pa\n", dp);

    if (ref == 1)
    {
        printf("  DFG 2D-1 benchmark: drag %.4f, lift %.4f, pressure drop %.4f\n",
               DFG1_CD, DFG1_CL, DFG1_DP);
        printf("  This run is off by %.1f%% on drag, %.1f%% on pressure drop\n",
               100.0 * fabs(cd - DFG1_CD) / DFG1_CD,
               100.0 * fabs(dp - DFG1_DP) / DFG1_DP);
    }
    else if (ref == 2)
    {
        printf("  DFG 2D-2 benchmark: max drag %.4f, max lift %.4f, Strouhal %.4f\n",
               DFG2_CDMAX, DFG2_CLMAX, DFG2_ST);
        if (st > 0.0)
            printf("  This run is off by %.1f%% on max drag, %.1f%% on Strouhal\n",
                   100.0 * fabs(cdmax - DFG2_CDMAX) / DFG2_CDMAX,
                   100.0 * fabs(st - DFG2_ST) / DFG2_ST);
        else
            printf("  Shedding had not started yet — run longer (t=8 or more)\n");
    }
    printf("  ──────────────────────────────────────────────\n");

    /* ── store inputs as used (the GUI form reads these back) ── */
    set_var("channel_U",      U);
    set_var("channel_Re",     Re);
    set_var("channel_nu",     nu);
    set_var("channel_rho",    rho);
    set_var("channel_L",      L);
    set_var("channel_H",      H);
    set_var("channel_cx",     cx);
    set_var("channel_cy",     cy);
    set_var("channel_D",      D);
    set_var("channel_res",    (double)res);
    set_var("channel_t",      t_end);
    set_var("channel_tol",    tol);

    /* ── store results ── */
    set_var("channel_cd",     cd);
    set_var("channel_cl",     cl);
    set_var("channel_cdmax",  cdmax);
    set_var("channel_clmax",  clmax);
    set_var("channel_dp",     dp);
    set_var("channel_st",     st);
    set_var("channel_steady", (double)steady);
    set_var("channel_time",   t);
    set_var("channel_steps",  (double)step);
    set_var("channel_ref",    (double)ref);

    /* ── force history, thinned to at most CH_HIST_MAX points ── */
    nkeep = c.hist_n < CH_HIST_MAX ? c.hist_n : CH_HIST_MAX;
    tv  = malloc(nkeep * sizeof(double));
    cdv = malloc(nkeep * sizeof(double));
    clv = malloc(nkeep * sizeof(double));
    for (k = 0; k < nkeep; k++)
    {
        int src = (nkeep > 1) ? (int)((double)k * (c.hist_n - 1) / (nkeep - 1)) : 0;
        tv[k]  = c.hist_t[src];
        cdv[k] = c.hist_cd[src];
        clv[k] = c.hist_cl[src];
    }
    set_mat_var("channel_tv",  ns_vec_from_array(tv,  nkeep));
    set_mat_var("channel_cdv", ns_vec_from_array(cdv, nkeep));
    set_mat_var("channel_clv", ns_vec_from_array(clv, nkeep));
    free(tv); free(cdv); free(clv);

    /* ── fields at cell centres, row = y from the bottom ── */
    uf = mat_new(ny, nx);
    vf = mat_new(ny, nx);
    pf = mat_new(ny, nx);
    wf = mat_new(ny, nx);
    sf = mat_new(ny, nx);
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            if (g.solid[IX(i, j)]) { MAT(sf, j - 1, i - 1) = 1.0; continue; }
            MAT(uf, j - 1, i - 1) = 0.5 * (g.u[IX(i - 1, j)] + g.u[IX(i, j)]);
            MAT(vf, j - 1, i - 1) = 0.5 * (g.v[IX(i, j - 1)] + g.v[IX(i, j)]);
            MAT(pf, j - 1, i - 1) = rho * MAT(g.p, j, i);

            /* vorticity dv/dx - du/dy from the face values around the
               cell — the staggered grid hands these over for free */
            vc_t = 0.5 * (g.v[IX(i + 1, j)] - g.v[IX(i - 1, j)]);
            vc_b = 0.5 * (g.v[IX(i + 1, j - 1)] - g.v[IX(i - 1, j - 1)]);
            uc_r = 0.5 * (g.u[IX(i, j + 1)] - g.u[IX(i, j - 1)]);
            uc_l = 0.5 * (g.u[IX(i - 1, j + 1)] - g.u[IX(i - 1, j - 1)]);
            MAT(wf, j - 1, i - 1) = (0.5 * (vc_t + vc_b) - 0.5 * (uc_r + uc_l)) / h;
        }
    }
    set_mat_var("channel_ufield", uf);
    set_mat_var("channel_vfield", vf);
    set_mat_var("channel_pfield", pf);
    set_mat_var("channel_wfield", wf);
    set_mat_var("channel_solid",  sf);

    printf("  $channel_cd $channel_cl $channel_dp $channel_st $channel_steady\n");
    printf("  $channel_tv/$channel_cdv/$channel_clv  [%d x 1] force history\n", nkeep);
    printf("  $channel_ufield $channel_vfield $channel_pfield $channel_wfield\n");
    printf("  $channel_solid  [%d x %d] fields\n\n", ny, nx);

cleanup:
    ch_grid_free(&g);
    free(c.hist_t); free(c.hist_cd); free(c.hist_cl);
}
