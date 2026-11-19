/* =============================================================================
 * File:         channel.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible channel flow past a circular cylinder —
 *               the DFG "flow around a cylinder" benchmark (Schäfer &
 *               Turek, 1996) and anything else of that shape.
 *
 *               Method (velocity / pressure, projection method)
 *                 Staggered "MAC" grid of square cells, h = D / res:
 *                   u on the right face of each cell, v on the top face,
 *                   p at the cell centre.  A ring of ghost cells carries
 *                   the boundary conditions.  The cylinder is the set of
 *                   cells whose centres fall inside the circle (a
 *                   "staircase" body).
 *                 Each time step:
 *                   1. Tentative velocities F, G from the momentum
 *                      equation without pressure — central differences
 *                      blended with upwinding by the factor gamma, the
 *                      scheme of Griebel, Dornseifer & Neunhoeffer.
 *                   2. Pressure from  lap(p) = div(F, G) / dt, solved by
 *                      ns_sor_poisson() — the same solver navier.c uses —
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
 *               on the cylinder.
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
#include "matrix.h"
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
#define CH_SOR_MAX        400       /* pressure sweeps allowed per step          */
#define CH_SOR_TOL_REL    1e-6      /* pressure tolerance, x Umean^2             */
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

/*************************************************************
 * Struct:      ChGrid
 * Description: Everything one run needs, so the helpers take one
 *              pointer instead of fourteen arguments.
 *
 *   nx, ny     fluid-domain cells; arrays are (nx+2) x (ny+2)
 *   h          cell size, m
 *   solid      1 = cylinder cell (ghost ring is 0, handled by BCs)
 *   u, v       face velocities (u on right faces, v on top faces)
 *   F, G       tentative velocities
 *   p          kinematic pressure (p / rho), a Matrix for ns_core
 *   rhs        pressure source, a Matrix for ns_core
 *   ptype      NS_CELL_* for every pressure cell
 *   uin        inlet speed for each row (index j)
 *   nu, Umean, D, rho   physics
 *************************************************************/
typedef struct
{
    int            nx;
    int            ny;
    double         h;
    unsigned char *solid;
    double        *u;
    double        *v;
    double        *F;
    double        *G;
    Matrix        *p;
    Matrix        *rhs;
    unsigned char *ptype;
    double        *uin;
    double         nu;
    double         Umean;
    double         D;
    double         rho;
} ChGrid;

/*************************************************************
 * Function:    is_fluid
 * Input:       g    (const ChGrid*) — the grid
 *              i, j (int)           — cell indices, ghosts allowed
 * Output:      int — 1 for a fluid cell inside the channel, else 0
 * Description: Ghost cells count as not-fluid: they are boundary
 *              conditions, not flow.
 **************************************************************/
static int is_fluid(const ChGrid *g, int i, int j)
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
 *                cylinder — zero on faces touching fluid, reflected
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

    /* ── cylinder: u faces ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i < nx; i++)
        {
            fl = is_fluid(g, i, j);
            fr = is_fluid(g, i + 1, j);
            if (fl && fr) continue;                          /* a real unknown */

            if (fl || fr)
                g->u[IX(i, j)] = 0.0;                        /* face on the wall */
            else if (is_fluid(g, i, j + 1) && is_fluid(g, i + 1, j + 1))
                g->u[IX(i, j)] = -g->u[IX(i, j + 1)];        /* fluid above      */
            else if (is_fluid(g, i, j - 1) && is_fluid(g, i + 1, j - 1))
                g->u[IX(i, j)] = -g->u[IX(i, j - 1)];        /* fluid below      */
            else
                g->u[IX(i, j)] = 0.0;                        /* deep inside      */
        }
    }

    /* ── cylinder: v faces ── */
    for (j = 1; j < ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            fl = is_fluid(g, i, j);
            fr = is_fluid(g, i, j + 1);
            if (fl && fr) continue;

            if (fl || fr)
                g->v[IX(i, j)] = 0.0;
            else if (is_fluid(g, i + 1, j) && is_fluid(g, i + 1, j + 1))
                g->v[IX(i, j)] = -g->v[IX(i + 1, j)];        /* fluid to the right */
            else if (is_fluid(g, i - 1, j) && is_fluid(g, i - 1, j + 1))
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
            if (!is_fluid(g, i, j) || !is_fluid(g, i + 1, j)) continue;

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
            if (!is_fluid(g, i, j) || !is_fluid(g, i, j + 1)) continue;

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
 *              omega      (double)  — SOR factor
 *              tol        (double)  — SOR tolerance
 * Output:      double — largest velocity change this step, m/s
 * Description: Pressure solve and the correction that removes the
 *              divergence F and G picked up.  Returns how much the
 *              velocity field moved, for the "settled" test.
 **************************************************************/
static double project(ChGrid *g, double dt, double omega, double tol)
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
            MAT(g->rhs, j, i) = is_fluid(g, i, j)
                ? -((g->F[IX(i, j)] - g->F[IX(i - 1, j)]) +
                    (g->G[IX(i, j)] - g->G[IX(i, j - 1)])) / (h * dt)
                : 0.0;

    ns_sor_poisson(g->p, g->rhs, g->ptype, h, omega, CH_SOR_MAX, tol);

    /* ── pressure kick on every unknown face ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i < nx; i++)
        {
            if (!is_fluid(g, i, j) || !is_fluid(g, i + 1, j)) continue;
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
            if (!is_fluid(g, i, j) || !is_fluid(g, i, j + 1)) continue;
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
            if (!is_fluid(g, i, j)) continue;
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
 * Description: Reads the set-up, builds the grid and the staircase
 *              cylinder, time-steps until the flow settles or the
 *              time runs out, then reports forces, pressure drop,
 *              shedding frequency and the benchmark comparison.
 **************************************************************/
void run_channel(const char *args)
{
    double  L = CH_L_DEFAULT, H = CH_H_DEFAULT;
    double  cx = CH_CX_DEFAULT, cy = CH_CY_DEFAULT, D = CH_D_DEFAULT;
    double  U = CH_U_DEFAULT, nu = CH_NU_DEFAULT, rho = CH_RHO_DEFAULT;
    double  res_d = CH_RES_DEFAULT, t_end = CH_T_DEFAULT, tol = CH_TOL_DEFAULT;
    double  Re = 0.0;
    int     haveRe = 0;
    int     found  = 0;
    ChGrid  g;
    int     stride;
    int     nx, ny, res;
    int     i, j, k;
    double  h, x, y, r2;
    double  dt, gamma, umax, vmax;
    double  omegaSor, sorTol;
    double  t = 0.0;
    int     step = 0;
    int     steady = 0;
    double  change = 0.0;
    double  accel;
    double  fx, fy, cd = 0.0, cl = 0.0;
    double  cdmax, clmax, cdmean, clmean, dp, st;
    double *hist_t = NULL, *hist_cd = NULL, *hist_cl = NULL;
    int     hist_n = 0, hist_cap = 0;
    int     first, nkeep, ref;
    int     box[4];
    double  mx, my, mx_old, my_old;
    double  *tv, *cdv, *clv;
    Matrix  *uf, *vf, *pf, *wf, *sf;
    double   uc_l, uc_r, vc_b, vc_t;

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
    g.Umean = 2.0 * U / 3.0;
    Re      = g.Umean * D / nu;

    res = (int)(res_d + 0.5);
    if (res < CH_RES_MIN) res = CH_RES_MIN;
    if (res > CH_RES_MAX) res = CH_RES_MAX;

    h  = D / res;
    nx = (int)(L / h + 0.5);
    ny = (int)(H / h + 0.5);
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
    if (t_end <= 0.0) t_end = CH_T_DEFAULT;
    if (tol   <= 0.0) tol   = CH_TOL_DEFAULT;

    /* ── allocate ── */
    stride  = nx + 2;
    g.nx    = nx;
    g.ny    = ny;
    g.h     = h;
    g.nu    = nu;
    g.D     = D;
    g.rho   = rho;
    g.solid = calloc((size_t)stride * (ny + 2), 1);
    g.ptype = calloc((size_t)stride * (ny + 2), 1);
    g.u     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g.v     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g.F     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g.G     = calloc((size_t)stride * (ny + 2), sizeof(double));
    g.uin   = calloc((size_t)ny + 2, sizeof(double));
    g.p     = mat_new(ny + 2, stride);
    g.rhs   = mat_new(ny + 2, stride);

    /* ── staircase cylinder: every cell whose centre is inside ── */
    for (j = 1; j <= ny; j++)
    {
        for (i = 1; i <= nx; i++)
        {
            x  = (i - 0.5) * h - cx;
            y  = (j - 0.5) * h - cy;
            r2 = x * x + y * y;
            g.solid[IX(i, j)] = (r2 < 0.25 * D * D);
        }
    }

    /* ── pressure cell types: fluid solved, cylinder and closed
          boundaries are walls, the outlet ghost column holds p = 0 ── */
    for (j = 0; j <= ny + 1; j++)
    {
        for (i = 0; i <= nx + 1; i++)
        {
            if (i == nx + 1 && j >= 1 && j <= ny)
                g.ptype[IX(i, j)] = NS_CELL_FIXED;
            else if (is_fluid(&g, i, j))
                g.ptype[IX(i, j)] = NS_CELL_FLUID;
            else
                g.ptype[IX(i, j)] = NS_CELL_SOLID;
        }
    }

    /* ── parabolic inlet, and the whole channel starts already flowing
          with it — reaches steady state far sooner than from rest ── */
    for (j = 1; j <= ny; j++)
    {
        y        = (j - 0.5) * h;
        g.uin[j] = 4.0 * U * y * (H - y) / (H * H);
        for (i = 0; i <= nx; i++)
            g.u[IX(i, j)] = g.uin[j];
    }
    apply_boundaries(&g);

    /* ── force-balance box: one diameter clear of the cylinder each
          side, snapped to cell faces, kept inside the channel ── */
    box[0] = (int)floor((cx - D) / h);
    box[1] = (int)ceil ((cx + D) / h);
    box[2] = (int)floor((cy - D) / h);
    box[3] = (int)ceil ((cy + D) / h);
    if (box[0] < 2)      box[0] = 2;
    if (box[1] > nx - 2) box[1] = nx - 2;
    if (box[2] < 2)      box[2] = 2;
    if (box[3] > ny - 2) box[3] = ny - 2;
    box_momentum(&g, box, &mx_old, &my_old);

    /* SOR factor for a long thin box — the short side sets the pace */
    omegaSor = 2.0 / (1.0 + sin(M_PI * h / H));
    if (omegaSor > 1.9) omegaSor = 1.9;
    sorTol   = CH_SOR_TOL_REL * g.Umean * g.Umean;

    printf("\n  Channel Flow Past a Cylinder\n");
    printf("  ──────────────────────────────────────────────\n");
    printf("  Re = %-8.4g  grid = %d x %d  (%d cells across the cylinder)\n",
           Re, nx, ny, res);
    printf("  Peak inlet speed %g m/s, mean %g m/s\n", U, g.Umean);
    printf("  solving ...\n");
    fflush(stdout);

    /* ── march in time ── */
    while (t < t_end)
    {
        /* largest speeds on the grid, for the stability limits */
        umax = U;
        vmax = 0.0;
        for (k = 0; k < stride * (ny + 2); k++)
        {
            if (fabs(g.u[k]) > umax) umax = fabs(g.u[k]);
            if (fabs(g.v[k]) > vmax) vmax = fabs(g.v[k]);
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
           and numerical viscosity starts doing the fluid's job for it */
        gamma = CH_GAMMA_SAFETY * fmax(umax, vmax) * dt / h;
        if (gamma > 1.0) gamma = 1.0;

        compute_FG(&g, dt, gamma);
        change = project(&g, dt, omegaSor, sorTol);
        apply_boundaries(&g);

        t += dt;
        step++;

        /* blow-up check: NaN spreads faster than gossip */
        if (isnan(change) || isinf(change))
        {
            printf("  channel: the solution became unstable at t = %.4g s.\n", t);
            printf("           Try a finer grid (larger res).\n\n");
            goto cleanup;
        }

        /* ── forces this step, into the history ── */
        box_momentum(&g, box, &mx, &my);
        cylinder_forces(&g, box, (mx - mx_old) / dt, (my - my_old) / dt,
                        &fx, &fy);
        mx_old = mx;
        my_old = my;
        cd = 2.0 * fx / (rho * g.Umean * g.Umean * D);
        cl = 2.0 * fy / (rho * g.Umean * g.Umean * D);

        if (hist_n == hist_cap)
        {
            hist_cap = hist_cap ? hist_cap * 2 : 4096;
            hist_t   = realloc(hist_t,  hist_cap * sizeof(double));
            hist_cd  = realloc(hist_cd, hist_cap * sizeof(double));
            hist_cl  = realloc(hist_cl, hist_cap * sizeof(double));
        }
        hist_t[hist_n]  = t;
        hist_cd[hist_n] = cd;
        hist_cl[hist_n] = cl;
        hist_n++;

        /* settled?  acceleration, scaled by D / Umean^2 */
        accel = change / dt * D / (g.Umean * g.Umean);
        if (accel < tol) { steady = 1; break; }

        if (step % CH_REPORT_EVERY == 0)
        {
            printf("    t = %-8.4g  drag %-9.5g lift %-9.5g  change %.3g\n",
                   t, cd, cl, accel);
            fflush(stdout);
        }
    }

    /* ── results ── */
    first  = steady ? hist_n - 1 : (2 * hist_n) / 3;   /* last third if moving */
    cdmax  = -1e300; clmax = -1e300; cdmean = 0.0; clmean = 0.0;
    for (k = first; k < hist_n; k++)
    {
        cdmax   = fmax(cdmax, hist_cd[k]);
        clmax   = fmax(clmax, hist_cl[k]);
        cdmean += hist_cd[k];
        clmean += hist_cl[k];
    }
    cdmean /= (hist_n - first);
    clmean /= (hist_n - first);

    st = steady ? 0.0
                : shedding_strouhal(hist_t, hist_cl, hist_n, first, D, g.Umean);
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
    nkeep = hist_n < CH_HIST_MAX ? hist_n : CH_HIST_MAX;
    tv  = malloc(nkeep * sizeof(double));
    cdv = malloc(nkeep * sizeof(double));
    clv = malloc(nkeep * sizeof(double));
    for (k = 0; k < nkeep; k++)
    {
        int src = (nkeep > 1) ? (int)((double)k * (hist_n - 1) / (nkeep - 1)) : 0;
        tv[k]  = hist_t[src];
        cdv[k] = hist_cd[src];
        clv[k] = hist_cl[src];
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
    free(g.solid); free(g.ptype);
    free(g.u); free(g.v); free(g.F); free(g.G); free(g.uin);
    mat_free(g.p); mat_free(g.rhs);
    free(hist_t); free(hist_cd); free(hist_cl);
}
