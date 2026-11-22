#ifndef CHANNEL_H
#define CHANNEL_H

/*************************************************************
 * File:         channel.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible channel flow past a cylinder, and the
 *               shared channel-flow solver core other algorithms build on.
 *
 * Provides run_channel(), dispatched from main() when the user
 * types:
 *
 *   channel [Re=<>] [U=<>] [nu=<>] [rho=<>]
 *           [L=<>] [H=<>] [cx=<>] [cy=<>] [D=<>]
 *           [res=<>] [t=<>] [tol=<>]
 *   channel ?          usage
 *
 * Fluid enters the left end of a rectangular channel with a
 * parabolic (fully developed) speed profile, flows past a circular
 * cylinder, and leaves at the right end.  Top and bottom are walls.
 * Every default is the DFG "flow around a cylinder" benchmark of
 * Schäfer & Turek (1996), so a bare "channel" runs case 2D-1 and
 * "channel Re=100" runs case 2D-2.
 *
 * Inputs (SI units; defaults = DFG benchmark):
 *   U    peak inlet speed, m/s            (0.3)
 *   Re   Reynolds number, mean inlet speed x D / nu.  When given,
 *        it sets U and overrides U=.
 *   nu   kinematic viscosity, m^2/s       (0.001)
 *   rho  density, kg/m^3                  (1)
 *   L, H channel length and height, m     (2.2, 0.41)
 *   cx, cy  cylinder centre, m            (0.2, 0.2)
 *   D    cylinder diameter, m             (0.1)
 *   res  grid cells across the diameter   (10)
 *   t    longest simulated time, s        (30)
 *   tol  "settled" threshold              (1e-4)
 *
 * Stored scalar variables:
 *   inputs, as used:  $channel_U $channel_Re $channel_nu $channel_rho
 *                     $channel_L $channel_H $channel_cx $channel_cy
 *                     $channel_D $channel_res $channel_t $channel_tol
 *   $channel_cd     drag coefficient (final, or mean when shedding)
 *   $channel_cl     lift coefficient (final, or mean when shedding)
 *   $channel_cdmax  largest drag coefficient over the last third
 *   $channel_clmax  largest lift coefficient over the last third
 *   $channel_dp     pressure drop front-to-back of the cylinder, Pa
 *   $channel_st     Strouhal number of the vortex shedding (0 = none)
 *   $channel_steady 1 = settled to a steady flow, 0 = still moving
 *   $channel_time   simulated time reached, s
 *   $channel_steps  time steps taken
 *   $channel_ref    0 = no benchmark, 1 = DFG 2D-1, 2 = DFG 2D-2
 *
 * Stored vectors (drag / lift history):
 *   $channel_tv  $channel_cdv  $channel_clv
 *
 * Stored fields [ny x nx], row = y from the bottom, col = x:
 *   $channel_ufield  $channel_vfield  $channel_pfield  $channel_wfield
 *   $channel_solid   1 = inside the cylinder, 0 = fluid
 *
 * Shared solver core (for other algorithms, e.g. slittest)
 *   The channel, its parabolic inlet, walls and outlet, and the
 *   time-marching projection solver are body-agnostic: whatever
 *   blocks the flow is just a mask of solid cells.  A caller fills
 *   in a ChSetup, supplies a ChHooks with a body() that marks the
 *   solid cells, and optionally step()/report() hooks that run each
 *   time step, then:
 *
 *     ch_grid_dims()  — grid size and cell size for a set-up
 *     ch_grid_init()  — allocate, mark the body, start the flow
 *     ch_solve()      — march until settled, out of time or unstable
 *     ch_grid_free()  — release it all
 *
 *   The grid arrays are (nx+2) x (ny+2) with a ghost ring; cell
 *   (i, j) lives at index j * (nx + 2) + i.  Cells i = 1..nx,
 *   j = 1..ny are the channel.
 *************************************************************/

#include "parse.h"
#include "matrix.h"

/*************************************************************
 * Struct:      ChGrid
 * Description: Everything one run needs, so the helpers take one
 *              pointer instead of fourteen arguments.
 *
 *   nx, ny     fluid-domain cells; arrays are (nx+2) x (ny+2)
 *   h          cell size, m
 *   solid      1 = blocked cell (ghost ring is 0, handled by BCs)
 *   u, v       face velocities (u on right faces, v on top faces)
 *   F, G       tentative velocities
 *   p          kinematic pressure (p / rho), a Matrix for ns_core
 *   rhs        pressure source, a Matrix for ns_core
 *   ptype      NS_CELL_* for every pressure cell
 *   uin        inlet speed for each row (index j)
 *   nu, Umean, D, rho   physics (D = the length Re is measured on)
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
 * Struct:      ChSetup
 * Description: The physical set-up of one run, already checked
 *              and defaulted by the caller.
 *
 *   L, H     channel length and height, m
 *   U        peak inlet speed, m/s (mean is 2/3 of it)
 *   nu, rho  kinematic viscosity m^2/s, density kg/m^3
 *   D        reference length, m: cell size h = D / res
 *   res      grid cells across D
 *   t_end    longest simulated time, s
 *   tol      "settled" threshold on the scaled acceleration;
 *            0 = never settle, always run to t_end
 *   gamma_safety  upwind blend multiplier; 0 = the DFG-tuned default
 *            (0.3).  1.2 is the textbook-stable value for high Re,
 *            at the cost of some numerical viscosity.
 *   Uref     speed the pressure-solve tolerance is scaled on, m/s;
 *            0 = the mean inlet speed.  Set it when the flow runs much
 *            faster than the inlet somewhere (jets through a slit), or
 *            the pressure solver chases decimals nobody needs.
 *************************************************************/
typedef struct
{
    double L;
    double H;
    double U;
    double nu;
    double rho;
    double D;
    int    res;
    double t_end;
    double tol;
    double gamma_safety;
    double Uref;
} ChSetup;

/*************************************************************
 * Struct:      ChHooks
 * Description: The caller's say in a run.
 *
 *   body    REQUIRED — mark g->solid[j*(nx+2)+i] = 1 for every
 *           blocked cell, i = 1..nx, j = 1..ny.  g->h, nx, ny are
 *           set; the array arrives all zero.
 *   step    optional — after every good time step (forces, tracers)
 *   report  optional — every CH_REPORT_EVERY steps, for a progress line;
 *           accel is the scaled acceleration the settled test uses
 *   ctx     handed to every hook untouched
 *************************************************************/
typedef struct
{
    void  (*body)  (ChGrid *g, void *ctx);
    void  (*step)  (ChGrid *g, double t, double dt, void *ctx);
    void  (*report)(ChGrid *g, double t, double accel, void *ctx);
    void   *ctx;
} ChHooks;

/*************************************************************
 * Struct:      ChRunInfo
 * Description: How a ch_solve() run ended.
 *
 *   t         simulated time reached, s
 *   steps     time steps taken
 *   steady    1 = settled below tol
 *   unstable  1 = the solution blew up at time t
 *************************************************************/
typedef struct
{
    double t;
    int    steps;
    int    steady;
    int    unstable;
} ChRunInfo;

/*************************************************************
 * Function:    ch_grid_dims
 * Input:       s       (const ChSetup*) — the set-up
 *              nx, ny  (int*)           — receive the cell counts
 *              h       (double*)        — receives the cell size, m
 * Output:      void
 * Description: Grid the solver would build for this set-up, so a
 *              caller can check sizes and fit before allocating.
 **************************************************************/
void ch_grid_dims(const ChSetup *s, int *nx, int *ny, double *h);

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
int  ch_grid_init(ChGrid *g, const ChSetup *s, const ChHooks *hooks);

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
int  ch_solve(ChGrid *g, const ChSetup *s, const ChHooks *hooks, ChRunInfo *info);

/*************************************************************
 * Function:    ch_grid_free
 * Input:       g (ChGrid*) — grid from ch_grid_init()
 * Output:      void
 * Description: Releases every array the grid owns.
 **************************************************************/
void ch_grid_free(ChGrid *g);

/*************************************************************
 * Function:    ch_is_fluid
 * Input:       g    (const ChGrid*) — the grid
 *              i, j (int)           — cell indices, ghosts allowed
 * Output:      int — 1 for a fluid cell inside the channel, else 0
 * Description: Ghost cells count as not-fluid: they are boundary
 *              conditions, not flow.
 **************************************************************/
int  ch_is_fluid(const ChGrid *g, int i, int j);

/*************************************************************
 * Function:    run_channel
 * Input:       args (const char*) — text following the "channel" keyword
 * Output:      void — results printed and stored in $channel_* variables
 * Description: The "channel" command: flow past a cylinder.
 **************************************************************/
void run_channel(const char *args);

#endif /* CHANNEL_H */
