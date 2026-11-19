#ifndef CHANNEL_H
#define CHANNEL_H

/*************************************************************
 * File:         channel.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible channel flow past a cylinder.
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
 *************************************************************/

#include "parse.h"

void run_channel(const char *args);

#endif /* CHANNEL_H */
