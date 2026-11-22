#ifndef SLITTEST_H
#define SLITTEST_H

/*************************************************************
 * File:         slittest.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  Two slits against one slit: Navier-Stokes particles
 *               head-to-head with wave optics.
 *
 * Provides run_slittest(), dispatched from main() when the user
 * types:
 *
 *   slittest [Re_min=<>], [Re_max=<>], [Re_steps=<>],
 *            [a=<>], [d=<>], [w=<>], [H=<>], [Ls=<>], [res=<>]
 *   slittest ?          usage
 *
 * A channel of fluid is blocked by a wall with slits cut in it.
 * Massless tracer particles ride the flow (they follow it exactly,
 * the way a photon has no mass to carry it anywhere else), and a
 * screen downstream counts where they land.  Every Reynolds number
 * in the sweep is run twice — both slits open, then one closed —
 * and each landing pattern is scored against the wave-optics
 * (Huygens) pattern for the same geometry.  The wavelength is
 * fitted freely to give the fluid its best possible match, limited
 * only to wavelengths that put visible fringes on the screen.
 *
 * Inputs (SI units):
 *   Re_min, Re_max  Reynolds range, slit jet speed x a / nu (10, 1000)
 *   Re_steps        how many, log-spaced                        (8)
 *   a               slit width, m                               (0.02)
 *   d               slit separation, centre to centre, m        (0.08)
 *   w               wall thickness, m                           (0.02)
 *   H               channel height, m                           (0.40)
 *   Ls              wall to screen, m                           (0.45)
 *   res             grid cells across one slit                  (4)
 *
 * Stored scalar variables:
 *   $slit_best      best two-slit match found, 0..1
 *   $slit_bestRe    Reynolds number where it happened
 *
 * Stored vectors [Re_steps x 1]:
 *   $slit_re        Reynolds numbers run
 *   $slit_match2    two-slit match, 0..1 (-1 = run was unstable)
 *   $slit_match1    one-slit match, same wavelength, 0..1
 *   $slit_lambda    fitted wavelength, m
 *   $slit_bumps2    bumps in the fluid's two-slit landing pattern
 *   $slit_bumps1    bumps in the fluid's one-slit landing pattern
 *   $slit_bands2    bright bands in the two-slit wave pattern
 *   $slit_bands1    bright bands in the one-slit wave pattern
 *
 * Stored patterns [bins x Re_steps], one column per Reynolds number,
 * each column summing to 1:
 *   $slit_ns2 $slit_ns1      fluid landing patterns
 *   $slit_wave2 $slit_wave1  wave-optics patterns at the fitted wavelength
 *   $slit_y                  [bins x 1] screen height of each bin, m
 *************************************************************/

#include "parse.h"

/*************************************************************
 * Function:    run_slittest
 * Input:       args (const char*) — text following the "slittest" keyword
 * Output:      void — results printed and stored in $slit_* variables
 * Description: The "slittest" command: the Reynolds sweep, two slits
 *              against one, fluid against waves.
 **************************************************************/
void run_slittest(const char *args);

#endif /* SLITTEST_H */
