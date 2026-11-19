#ifndef NAVIER_H
#define NAVIER_H

/*************************************************************
 * File:         navier.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  2D incompressible Navier-Stokes command for Mathrix.
 *
 * Provides run_navier(), dispatched from main() when the user
 * types:
 *
 *   navier Re=<> [N=<grid>] [tol=<>] [maxit=<>]
 *   navier V=<> D=<> nu=<>          [N=] [tol=] [maxit=]
 *   navier V=<> D=<> rho=<> mu=<>   [N=] [tol=] [maxit=]
 *   navier                          (re-uses $Re from a prior
 *                                    "reynolds" run)
 *   navier ?                        usage
 *
 * Solves the lid-driven square cavity: a box of fluid whose top
 * wall slides to the right at constant speed while the other
 * three walls are fixed.  Uses the stream-function / vorticity
 * form of the equations on a uniform grid, stepped in time
 * until the flow stops changing (steady state).
 *
 * When V and D are given the Reynolds number is computed by the
 * existing "reynolds" command (same parameter names), so $Re
 * and $reynolds_* are set exactly as if the user had run it.
 * D is the side length of the cavity, V is the lid speed.
 *
 * Results are dimensionless (lengths / D, velocities / V).
 *
 * Stored scalar variables:
 *   $navier_Re     Reynolds number used
 *   $navier_N      grid points per side
 *   $navier_steps  time steps taken
 *   $navier_conv   1 = reached steady state, 0 = hit maxit
 *   $navier_psimin strength of the main vortex (stream function minimum)
 *   $navier_xc     main vortex centre, x
 *   $navier_yc     main vortex centre, y
 *   $navier_err    largest difference from the Ghia (1982) benchmark
 *                  (-1 when Re is not 100, 400 or 1000)
 *
 * Stored vectors  [N x 1]:
 *   $navier_y  $navier_u    horizontal velocity up the vertical centreline
 *   $navier_x  $navier_v    vertical velocity across the horizontal centreline
 *
 * Stored benchmark vectors [17 x 1] (Re = 100, 400, 1000 only):
 *   $navier_gy $navier_gu   Ghia u-velocity points
 *   $navier_gx $navier_gv   Ghia v-velocity points
 *
 * Stored fields [N x N]  (row = y index from the bottom, col = x index):
 *   $navier_psi  stream function
 *   $navier_w    vorticity
 *   $navier_ufield  horizontal velocity
 *   $navier_vfield  vertical velocity
 *************************************************************/

#include "parse.h"

void run_navier(const char *args);

#endif /* NAVIER_H */
