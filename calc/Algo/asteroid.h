/* =============================================================================
 * File:        asteroid.h
 * Author:      Bryan Wilcutt
 * Date Started: 2026-11-06
 * Description: Asteroid / Earth close-approach and impact screening for the
 *              math shell.  Provides run_asteroid(), dispatched from main()
 *              when the user types an "asteroid ..." command.
 *
 *   asteroid a=<AU> e=<> i=<deg> om=<deg> w=<deg> M=<deg> epoch=<JD>
 *            [start=<JD>] [span=<days>] [step=<days>]
 *            [sa=<> se=<> si=<> som=<> sw=<> sM=<>]   1-sigma uncertainties
 *
 *   Inputs are the asteroid's heliocentric osculating orbital elements,
 *   ecliptic J2000 frame — exactly the set JPL's Small-Body Database
 *   (ssd.jpl.nasa.gov) publishes for every catalogued object.
 *
 *   Stored scalars:
 *     $asteroid_dmin      closest Earth-centre distance        (km)
 *     $asteroid_dmin_er   the same in Earth radii
 *     $asteroid_dmin_ld   the same in lunar distances
 *     $asteroid_tca       time of closest approach             (JD, TDB)
 *     $asteroid_tca_d     days after the search start
 *     $asteroid_vrel      speed relative to Earth at approach  (km/s)
 *     $asteroid_bcap      Earth's capture radius at that speed (km)
 *     $asteroid_hit       1 = trajectory strikes Earth, 0 = miss
 *     $asteroid_prob      impact probability, 0..1 (1 or 0 with no sigmas)
 *     $asteroid_prob_sigma  statistical error of that probability
 *   Stored vectors:
 *     $asteroid_t         sample times, days after start
 *     $asteroid_d         Earth distance at each sample        (lunar distances)
 *     $asteroid_info      full-precision summary for the graph window
 * ============================================================================= */

#ifndef ASTEROID_H
#define ASTEROID_H

#include "parse.h"

/*************************************************************
 * Function:    run_asteroid
 * Input:       args (const char*) — the portion of the input line following
 *              the "asteroid" command keyword
 * Output:      void — results are printed to stdout and stored in variables
 * Description: Propagates the asteroid and Earth over the requested window,
 *              finds the closest approach, and decides whether the asteroid's
 *              path passes inside Earth's gravitational capture radius.
 *************************************************************/
void run_asteroid(const char *args);

#endif /* ASTEROID_H */
