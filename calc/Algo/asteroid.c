/* =============================================================================
 * File:        asteroid.c
 * Author:      Bryan Wilcutt
 * Date Started: 2026-11-06
 * Description: Asteroid impact screening.  Given an asteroid's orbital
 *              elements, steps the asteroid and the Earth around the Sun over
 *              a time window, finds the moment they come closest, and decides
 *              whether that pass actually strikes the Earth.
 *
 *              Method
 *                1. Both bodies move on two-body (Keplerian) heliocentric
 *                   orbits.  The asteroid uses the elements the user gives;
 *                   the Earth-Moon barycentre uses JPL's published mean
 *                   elements (Standish, valid 1800-2050).
 *                2. The Earth itself is shifted off the barycentre using a
 *                   low-precision lunar position.  That shift is ~4,700 km —
 *                   most of an Earth radius — so leaving it out would be the
 *                   difference between "hit" and "near miss" for a grazer.
 *                3. The Earth-asteroid distance is sampled every <step> days,
 *                   and every local minimum is refined with a golden-section
 *                   search to well under a second of time.
 *                4. At the deepest minimum, the relative speed v gives Earth's
 *                   capture radius, which is larger than Earth's physical
 *                   radius because Earth's gravity bends an approaching body
 *                   inward ("gravitational focusing"):
 *
 *                       b_cap = R_earth * sqrt(1 + v_esc^2 / v^2)
 *
 *                   An unperturbed closest-approach distance inside b_cap
 *                   means the real, gravity-bent path reaches the surface.
 *                5. Impact probability (Monte Carlo).  If the user supplies
 *                   1-sigma uncertainties for the elements (JPL lists one
 *                   beside each element), AST_MC_SAMPLES "clone" orbits are
 *                   drawn from those error bars, each is checked for a hit
 *                   near the nominal encounter, and the fraction that hit is
 *                   the probability.  With no uncertainties the answer is
 *                   simply 1 or 0.
 *
 *              Limits — this is a SCREENING tool, not JPL Sentry:
 *                - No planetary perturbations (Jupiter, Venus, the Moon's
 *                  pull on the asteroid).  Fine for weeks to a few years,
 *                  increasingly wrong over decades.
 *                - The clones are drawn from each element's error bar
 *                  INDEPENDENTLY.  Real orbit errors are strongly correlated
 *                  (JPL publishes a full covariance matrix), so treat the
 *                  probability as an approximation, not a citation.
 * ============================================================================= */

#include "asteroid.h"
#include "matrix.h"

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

#define AST_K_GAUSS     0.01720209895     /* Gaussian gravitational constant, rad/day   */
#define AST_AU_KM       149597870.7       /* astronomical unit, km                      */
#define AST_DAY_S       86400.0           /* seconds per day                            */
#define AST_J2000       2451545.0         /* JD of the J2000.0 epoch                    */
#define AST_MJD_OFFSET  2400000.5         /* JD = MJD + this                            */
#define AST_R_EARTH_KM  6371.0            /* mean Earth radius, km                      */
#define AST_R_EQ_KM     6378.14           /* equatorial radius, used by the lunar model */
#define AST_GM_EARTH    398600.4418       /* Earth GM, km^3/s^2                         */
#define AST_LD_KM       384400.0          /* mean lunar distance, km                    */
#define AST_EMRAT       81.30056          /* Earth mass / Moon mass                     */

#define AST_MAX_SAMPLES 4000000           /* cap on scan samples, keeps a typo'd span   */
                                          /* from turning into a space heater           */
#define AST_PLOT_POINTS 1000              /* evenly spaced plot samples                 */
#define AST_PLOT_DENSE  201               /* extra plot samples packed round the        */
                                          /* encounter, so the dip is drawn to its true */
                                          /* depth instead of the nearest even sample   */
#define AST_DENSE_DAYS  3.0               /* +/- days covered by the dense samples      */
#define AST_GOLDEN_TOL  1e-7              /* refine tolerance, days (~9 ms)             */

#define AST_MC_SAMPLES  1000              /* clone orbits for the impact probability    */
#define AST_MC_WINDOW   10.0              /* +/- days around the nominal encounter that */
                                          /* each clone is searched                     */
#define AST_MC_STEP     0.1               /* clone scan step, days                      */
#define AST_MC_SEED     0x6A09E667F3BCC909ULL  /* fixed seed (sqrt 2's fraction bits):  */
                                          /* same inputs, same probability, every time  */

#define AST_INFO_LEN    11                /* entries in $asteroid_info, see run_asteroid */

#define AST_D2R         (M_PI / 180.0)

/* ═══════════════════════════════════════════════════════════
   TYPES
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Struct:      Elements
 * Description: Heliocentric osculating orbital elements.
 *              Angles are stored in RADIANS; a in AU.
 *************************************************************/
typedef struct
{
    double a;       /* semi-major axis, AU                     */
    double e;       /* eccentricity                            */
    double i;       /* inclination                             */
    double om;      /* longitude of ascending node (Omega)     */
    double w;       /* argument of perihelion (omega)          */
    double M0;      /* mean anomaly at epoch                   */
    double epoch;   /* JD at which M0 applies                  */
} Elements;

/* ═══════════════════════════════════════════════════════════
   KEPLER / ORBIT GEOMETRY
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    solve_kepler
 * Input:       M (double) — mean anomaly, radians (any range)
 *              e (double) — eccentricity, 0 <= e < 1
 * Output:      double — eccentric anomaly E, radians
 * Description: Solves Kepler's equation  M = E - e*sin(E)  by Newton
 *              iteration.  M is first wrapped into [-pi, pi]; starting from
 *              E = pi for high eccentricity keeps Newton from overshooting
 *              near perihelion, which is where it likes to misbehave.
 *************************************************************/
static double solve_kepler(double M, double e)
{
    double E;
    double dE;
    int    iter;

    /* wrap M into [-pi, pi] so the starting guess is sensible */
    M = fmod(M, 2.0 * M_PI);
    if (M >  M_PI) M -= 2.0 * M_PI;
    if (M < -M_PI) M += 2.0 * M_PI;

    E = (e < 0.8) ? M : (M >= 0 ? M_PI : -M_PI);

    /* Newton: E_{n+1} = E_n - f/f',  f = E - e sinE - M */
    for (iter = 0; iter < 50; iter++)
    {
        dE = (E - e * sin(E) - M) / (1.0 - e * cos(E));
        E -= dE;
        if (fabs(dE) < 1e-14) break;
    }

    return E;
}

/*************************************************************
 * Function:    elements_to_position
 * Input:       el  (const Elements*) — orbital elements
 *              jd  (double)          — time, Julian Date (TDB)
 *              r   (double[3])       — receives position, AU
 * Output:      void
 * Description: Two-body heliocentric position in the ecliptic J2000 frame.
 *              Advances the mean anomaly from the epoch, solves Kepler, forms
 *              the in-plane position, then rotates by omega, i and Omega.
 *************************************************************/
static void elements_to_position(const Elements *el, double jd, double r[3])
{
    double n;           /* mean motion, rad/day */
    double M;
    double E;
    double xp, yp;      /* position in the orbit plane, perihelion along +x */
    double cO, sO, cw, sw, ci, si;

    /* mean motion from Kepler's third law (mass of the asteroid ignored) */
    n = AST_K_GAUSS / pow(el->a, 1.5);
    M = el->M0 + n * (jd - el->epoch);
    E = solve_kepler(M, el->e);

    /* position within the orbital plane */
    xp = el->a * (cos(E) - el->e);
    yp = el->a * sqrt(1.0 - el->e * el->e) * sin(E);

    /* rotate orbit plane -> ecliptic:  R3(-Omega) R1(-i) R3(-omega) */
    cO = cos(el->om); sO = sin(el->om);
    cw = cos(el->w);  sw = sin(el->w);
    ci = cos(el->i);  si = sin(el->i);

    r[0] = (cO * cw - sO * sw * ci) * xp + (-cO * sw - sO * cw * ci) * yp;
    r[1] = (sO * cw + cO * sw * ci) * xp + (-sO * sw + cO * cw * ci) * yp;
    r[2] = (sw * si)                * xp + (cw * si)                 * yp;
}

/* ═══════════════════════════════════════════════════════════
   EARTH AND MOON
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    emb_elements
 * Input:       jd (double)    — time, Julian Date
 *              el (Elements*) — receives the Earth-Moon barycentre elements
 * Output:      void
 * Description: Mean elements of the Earth-Moon barycentre from JPL's
 *              "Keplerian Elements for Approximate Positions of the Major
 *              Planets" (E. M. Standish), Table 1, valid 1800-2050.  Each
 *              element is a value at J2000 plus a rate per Julian century.
 *              The table quotes mean longitude L and longitude of
 *              perihelion varpi; omega = varpi - Omega and M = L - varpi.
 *************************************************************/
static void emb_elements(double jd, Elements *el)
{
    double T     = (jd - AST_J2000) / 36525.0;   /* Julian centuries from J2000 */
    double a     =   1.00000261 + 0.00000562    * T;
    double e     =   0.01671123 - 0.00004392    * T;
    double incl  =  -0.00001531 - 0.01294668    * T;
    double L     = 100.46457166 + 35999.37244981 * T;
    double varpi = 102.93768193 + 0.32327364    * T;
    double Om    =   0.0;

    el->a     = a;
    el->e     = e;
    el->i     = incl * AST_D2R;
    el->om    = Om * AST_D2R;
    el->w     = (varpi - Om) * AST_D2R;
    el->M0    = (L - varpi) * AST_D2R;
    el->epoch = jd;    /* elements are evaluated AT jd, so no further advance */
}

/*************************************************************
 * Function:    moon_geocentric
 * Input:       jd (double)    — time, Julian Date
 *              r  (double[3]) — receives the Moon's geocentric position, AU
 * Output:      void
 * Description: Low-precision lunar position (Astronomical Almanac series,
 *              ~0.3 deg in longitude).  Only used to shift the Earth off the
 *              barycentre, where it is divided by 82.3 — so a 2,000 km error
 *              in the Moon becomes a 25 km error in the Earth.  Plenty.
 *              Longitude is pulled back from the equinox of date to J2000 by
 *              subtracting general precession (1.3972 deg per century).
 *************************************************************/
static void moon_geocentric(double jd, double r[3])
{
    double T = (jd - AST_J2000) / 36525.0;
    double lam, beta, par, dist_km;

    /* ecliptic longitude, degrees */
    lam = 218.32 + 481267.881 * T
        + 6.29 * sin((135.0 + 477198.87 * T) * AST_D2R)
        - 1.27 * sin((259.3 - 413335.36 * T) * AST_D2R)
        + 0.66 * sin((235.7 + 890534.22 * T) * AST_D2R)
        + 0.21 * sin((269.9 + 954397.74 * T) * AST_D2R)
        - 0.19 * sin((357.5 +  35999.05 * T) * AST_D2R)
        - 0.11 * sin((186.5 + 966404.03 * T) * AST_D2R);

    /* ecliptic latitude, degrees */
    beta = 5.13 * sin(( 93.3 + 483202.02 * T) * AST_D2R)
         + 0.28 * sin((228.2 + 960400.89 * T) * AST_D2R)
         - 0.28 * sin((318.3 +   6003.15 * T) * AST_D2R)
         - 0.17 * sin((217.6 - 407332.21 * T) * AST_D2R);

    /* horizontal parallax, degrees -> distance */
    par = 0.9508
        + 0.0518 * cos((135.0 + 477198.87 * T) * AST_D2R)
        + 0.0095 * cos((259.3 - 413335.36 * T) * AST_D2R)
        + 0.0078 * cos((235.7 + 890534.22 * T) * AST_D2R)
        + 0.0028 * cos((269.9 + 954397.74 * T) * AST_D2R);

    dist_km = AST_R_EQ_KM / sin(par * AST_D2R);

    /* equinox of date -> J2000 */
    lam -= 1.3972 * T;

    lam  *= AST_D2R;
    beta *= AST_D2R;

    r[0] = dist_km * cos(beta) * cos(lam) / AST_AU_KM;
    r[1] = dist_km * cos(beta) * sin(lam) / AST_AU_KM;
    r[2] = dist_km * sin(beta)            / AST_AU_KM;
}

/*************************************************************
 * Function:    earth_position
 * Input:       jd (double)    — time, Julian Date
 *              r  (double[3]) — receives Earth's heliocentric position, AU
 * Output:      void
 * Description: Barycentre position minus the Earth's share of the
 *              Earth-Moon offset.  The barycentre sits Moon-ward of the
 *              Earth's centre by r_moon / (1 + Earth/Moon mass ratio).
 *************************************************************/
static void earth_position(double jd, double r[3])
{
    Elements emb;
    double   moon[3];
    int      k;

    emb_elements(jd, &emb);
    elements_to_position(&emb, jd, r);
    moon_geocentric(jd, moon);

    for (k = 0; k < 3; k++)
        r[k] -= moon[k] / (1.0 + AST_EMRAT);
}

/* ═══════════════════════════════════════════════════════════
   ENCOUNTER GEOMETRY
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    relative_position
 * Input:       ast (const Elements*) — asteroid elements
 *              jd  (double)          — time, Julian Date
 *              d   (double[3])       — receives asteroid minus Earth, AU
 * Output:      void
 * Description: Geocentric position of the asteroid.
 *************************************************************/
static void relative_position(const Elements *ast, double jd, double d[3])
{
    double ra[3];
    double re[3];
    int    k;

    elements_to_position(ast, jd, ra);
    earth_position(jd, re);

    for (k = 0; k < 3; k++)
        d[k] = ra[k] - re[k];
}

/*************************************************************
 * Function:    earth_distance
 * Input:       ast (const Elements*) — asteroid elements
 *              jd  (double)          — time, Julian Date
 * Output:      double — Earth-centre to asteroid distance, AU
 * Description: Length of relative_position().
 *************************************************************/
static double earth_distance(const Elements *ast, double jd)
{
    double d[3];

    relative_position(ast, jd, d);
    return sqrt(d[0] * d[0] + d[1] * d[1] + d[2] * d[2]);
}

/*************************************************************
 * Function:    relative_speed_kms
 * Input:       ast (const Elements*) — asteroid elements
 *              jd  (double)          — time, Julian Date
 * Output:      double — asteroid speed relative to Earth, km/s
 * Description: Central difference of the geocentric position over +/- 60 s.
 *              Over two minutes both orbits are straight lines to far better
 *              than the accuracy of everything else here, so there is no
 *              point deriving the analytic velocity just to feel clever.
 *************************************************************/
static double relative_speed_kms(const Elements *ast, double jd)
{
    const double h = 60.0 / AST_DAY_S;   /* 60 seconds, in days */
    double dp[3], dm[3], v[3];
    int    k;

    relative_position(ast, jd + h, dp);
    relative_position(ast, jd - h, dm);

    for (k = 0; k < 3; k++)
        v[k] = (dp[k] - dm[k]) / (2.0 * h);              /* AU/day */

    return sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2])
           * AST_AU_KM / AST_DAY_S;                       /* -> km/s */
}

/*************************************************************
 * Function:    refine_minimum
 * Input:       ast  (const Elements*) — asteroid elements
 *              lo   (double)          — left bracket, JD
 *              hi   (double)          — right bracket, JD
 *              tmin (double*)         — receives the time of the minimum
 * Output:      double — the minimum distance, AU
 * Description: Golden-section search for the distance minimum inside
 *              [lo, hi].  Near an encounter the distance behaves like
 *              sqrt(b^2 + v^2 (t-t0)^2), which has exactly one minimum in a
 *              two-step bracket — the condition golden section needs.
 *************************************************************/
static double refine_minimum(const Elements *ast, double lo, double hi,
                             double *tmin)
{
    const double gr = 0.6180339887498949;   /* (sqrt(5) - 1) / 2 */
    double x1 = hi - gr * (hi - lo);
    double x2 = lo + gr * (hi - lo);
    double f1 = earth_distance(ast, x1);
    double f2 = earth_distance(ast, x2);

    /* shrink the bracket by the golden ratio until it is tiny */
    while (hi - lo > AST_GOLDEN_TOL)
    {
        if (f1 < f2)
        {
            hi = x2;  x2 = x1;  f2 = f1;
            x1 = hi - gr * (hi - lo);
            f1 = earth_distance(ast, x1);
        }
        else
        {
            lo = x1;  x1 = x2;  f1 = f2;
            x2 = lo + gr * (hi - lo);
            f2 = earth_distance(ast, x2);
        }
    }

    *tmin = 0.5 * (lo + hi);
    return earth_distance(ast, *tmin);
}

/*************************************************************
 * Function:    find_closest
 * Input:       ast      (const Elements*) — asteroid elements
 *              t0       (double)          — window start, JD
 *              t1       (double)          — window end, JD
 *              step     (double)          — scan step, days
 *              tca      (double*)         — receives the time of closest approach
 *              n_minima (int*)            — receives how many dips were refined
 *                                           (may be NULL)
 * Output:      double — closest Earth distance in the window, AU
 * Description: Samples the distance every <step> days and refines EVERY
 *              local minimum, not just the smallest sample: a fast flyby can
 *              be sampled far from its true bottom and look shallower than a
 *              slow one that happened to be sampled near its own.  The window
 *              edges are candidates too, in case an approach is still
 *              underway when the window closes.
 *************************************************************/
static double find_closest(const Elements *ast, double t0, double t1,
                           double step, double *tca, int *n_minima)
{
    long   n_samples = (long)ceil((t1 - t0) / step) + 1;
    long   s;
    double d_prev2 = 1e30;
    double d_prev1 = 1e30;
    double d_cur;
    double t_cur;
    double best_d  = 1e30;
    double best_t  = t0;
    double cand_d;
    double cand_t;
    int    minima  = 0;

    for (s = 0; s < n_samples; s++)
    {
        t_cur = fmin(t0 + s * step, t1);
        d_cur = earth_distance(ast, t_cur);

        /* sample s-1 below both neighbours: a minimum lies within one step
           either side of it */
        if (s >= 2 && d_prev1 <= d_prev2 && d_prev1 < d_cur)
        {
            cand_d = refine_minimum(ast, t_cur - 2.0 * step, t_cur, &cand_t);
            minima++;
            if (cand_d < best_d) { best_d = cand_d; best_t = cand_t; }
        }

        /* the window edges */
        if ((s == 0 || s == n_samples - 1) && d_cur < best_d)
        {
            best_d = d_cur;
            best_t = t_cur;
        }

        d_prev2 = d_prev1;
        d_prev1 = d_cur;
    }

    *tca = best_t;
    if (n_minima) *n_minima = minima;
    return best_d;
}

/*************************************************************
 * Function:    capture_radius_km
 * Input:       vrel (double) — speed relative to Earth, km/s
 * Output:      double — Earth's gravity-focused capture radius, km
 * Description: b_cap = R * sqrt(1 + v_esc^2 / v^2).  Slow asteroids are
 *              pulled in from further out, so the target grows as the
 *              approach speed falls.
 *************************************************************/
static double capture_radius_km(double vrel)
{
    double vesc2 = 2.0 * AST_GM_EARTH / AST_R_EARTH_KM;   /* (11.19 km/s)^2 */

    return AST_R_EARTH_KM * sqrt(1.0 + vesc2 / (vrel * vrel));
}

/* ═══════════════════════════════════════════════════════════
   RANDOM NUMBERS  (for the Monte Carlo clones)
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    rng_next
 * Input:       state (unsigned long long*) — generator state, updated
 * Output:      double — uniform deviate in (0, 1)
 * Description: SplitMix64.  Small, fast, and — unlike rand() — the same
 *              on every machine, so a probability reported today can be
 *              reproduced tomorrow.
 *************************************************************/
static double rng_next(unsigned long long *state)
{
    unsigned long long z = (*state += 0x9E3779B97F4A7C15ULL);

    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ULL;
    z = (z ^ (z >> 27)) * 0x94D049BB133111EBULL;
    z =  z ^ (z >> 31);

    /* top 53 bits -> (0,1); the +0.5 keeps log() in rng_gauss away from 0 */
    return ((double)(z >> 11) + 0.5) / 9007199254740992.0;
}

/*************************************************************
 * Function:    rng_gauss
 * Input:       state (unsigned long long*) — generator state, updated
 * Output:      double — standard normal deviate (mean 0, sigma 1)
 * Description: Box-Muller transform.  Throws away the second deviate it
 *              could have kept; at a thousand clones nobody will notice.
 *************************************************************/
static double rng_gauss(unsigned long long *state)
{
    double u1 = rng_next(state);
    double u2 = rng_next(state);

    return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
}

/*************************************************************
 * Function:    impact_probability
 * Input:       nom      (const Elements*) — nominal elements (radians)
 *              sig      (const double[6]) — 1-sigma of a, e, i, om, w, M
 *                                           (AU, -, rad, rad, rad, rad)
 *              tca      (double)          — nominal time of closest approach
 *              n_valid  (int*)            — receives how many clones were usable
 * Output:      double — fraction of clones that strike the Earth, 0..1
 * Description: Draws AST_MC_SAMPLES clone orbits, each element offset by a
 *              Gaussian of its own sigma, finds each clone's closest approach
 *              within AST_MC_WINDOW days of the nominal encounter, and counts
 *              the ones inside the capture radius.  Clones that come out
 *              unphysical (a <= 0, e outside [0,1)) are discarded rather than
 *              counted as misses, so they don't quietly water down the odds.
 *************************************************************/
static double impact_probability(const Elements *nom, const double sig[6],
                                 double tca, int *n_valid)
{
    unsigned long long seed = AST_MC_SEED;
    Elements           cl;
    int                k;
    int                hits  = 0;
    int                valid = 0;
    double             t_cl;
    double             d_km;

    for (k = 0; k < AST_MC_SAMPLES; k++)
    {
        /* clone = nominal + sigma * N(0,1), element by element */
        cl       = *nom;
        cl.a    += sig[0] * rng_gauss(&seed);
        cl.e    += sig[1] * rng_gauss(&seed);
        cl.i    += sig[2] * rng_gauss(&seed);
        cl.om   += sig[3] * rng_gauss(&seed);
        cl.w    += sig[4] * rng_gauss(&seed);
        cl.M0   += sig[5] * rng_gauss(&seed);

        if (cl.a <= 0 || cl.e < 0 || cl.e >= 1) continue;
        valid++;

        /* this clone's own closest approach near the nominal encounter */
        d_km = find_closest(&cl, tca - AST_MC_WINDOW, tca + AST_MC_WINDOW,
                            AST_MC_STEP, &t_cl, NULL) * AST_AU_KM;

        if (d_km <= capture_radius_km(relative_speed_kms(&cl, t_cl)))
            hits++;
    }

    *n_valid = valid;
    return (valid > 0) ? (double)hits / valid : 0.0;
}

/*************************************************************
 * Function:    cmp_double
 * Input:       a, b (const void*) — pointers to doubles
 * Output:      int — qsort ordering
 * Description: Ascending comparison, for sorting the plot time samples.
 *************************************************************/
static int cmp_double(const void *a, const void *b)
{
    double x = *(const double *)a;
    double y = *(const double *)b;

    return (x > y) - (x < y);
}

/* ═══════════════════════════════════════════════════════════
   DATE HELPERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    normalise_jd
 * Input:       t (double) — a date entered as JD or MJD
 * Output:      double — the same date as JD
 * Description: JPL quotes epochs both ways.  Any value below 1,000,000 is
 *              taken as a Modified Julian Date; no real JD this side of the
 *              Bronze Age is that small.
 *************************************************************/
static double normalise_jd(double t)
{
    return (t < 1.0e6) ? t + AST_MJD_OFFSET : t;
}

/*************************************************************
 * Function:    jd_to_text
 * Input:       jd  (double) — Julian Date
 *              buf (char*)  — receives "YYYY-MM-DD HH:MM"
 *              len (size_t) — capacity of buf
 * Output:      void
 * Description: Gregorian calendar conversion (Meeus, Astronomical
 *              Algorithms, ch. 7).  The time scale is whatever the input was
 *              — TDB for JPL elements, about a minute ahead of UTC.
 *************************************************************/
static void jd_to_text(double jd, char *buf, size_t len)
{
    double Z, F, A, alpha, B, C, D, E;
    double day;
    int    month, year, hour, minute;

    /* round to the nearest minute FIRST, so 23:59:45 becomes the next
       day's 00:00 rather than the impossible "24:00" */
    jd = floor(jd * 1440.0 + 0.5) / 1440.0;

    /* split into whole days (shifted to start at midnight) and fraction */
    jd += 0.5;
    Z = floor(jd);
    F = jd - Z;

    /* Gregorian correction */
    if (Z < 2299161.0)
        A = Z;
    else
    {
        alpha = floor((Z - 1867216.25) / 36524.25);
        A     = Z + 1.0 + alpha - floor(alpha / 4.0);
    }

    B = A + 1524.0;
    C = floor((B - 122.1) / 365.25);
    D = floor(365.25 * C);
    E = floor((B - D) / 30.6001);

    day   = B - D - floor(30.6001 * E) + F;
    month = (E < 14.0) ? (int)E - 1 : (int)E - 13;
    year  = (month > 2) ? (int)C - 4716 : (int)C - 4715;

    /* fraction of the day -> hours and minutes (already minute-rounded;
       the +0.5 only guards against the fraction landing a hair low) */
    minute = (int)floor((day - floor(day)) * 1440.0 + 0.5);
    hour   = minute / 60;
    minute = minute % 60;

    snprintf(buf, len, "%04d-%02d-%02d %02d:%02d", year, month,
             (int)floor(day), hour, minute);
}

/* ═══════════════════════════════════════════════════════════
   COMMAND
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    run_asteroid
 * Input:       args (const char*) — text following the "asteroid" keyword:
 *                a=<AU> e=<> i=<deg> om=<deg> w=<deg> M=<deg> epoch=<JD|MJD>
 *                [start=<JD|MJD>]  default = epoch
 *                [span=<days>]     default = 365
 *                [step=<days>]     default = 0.25
 *                [sa= se= si= som= sw= sM=]  1-sigma uncertainty of each
 *                                  element, same units; default 0
 * Output:      void — report printed to stdout, results stored in variables
 * Description: Scans the window for the closest Earth approach, decides
 *              whether it is an impact, and — when uncertainties are given —
 *              estimates the impact probability.  See the file header.
 *
 *              $asteroid_info holds the graph's numbers at full precision
 *              (scalar variables print with only 6 significant digits, which
 *              turns a Julian Date into "2.4615e+06" — accurate to a week,
 *              useless to a plot):
 *                [0] start JD      [1] span, days   [2] TCA, JD
 *                [3] dmin, km      [4] vrel, km/s   [5] capture radius, km
 *                [6] hit 0/1       [7] probability  [8] probability 1-sigma
 *                [9] clones used   [10] epoch JD
 *************************************************************/
void run_asteroid(const char *args)
{
    Elements ast;
    double   a = 0, e = 0, incl = 0, om = 0, w = 0, M = 0, epoch = 0;
    double   start = 0, span = 365.0, step = 0.25;
    double   sig_in[6] = { 0, 0, 0, 0, 0, 0 };   /* sa, se, si, som, sw, sM */
    double   sig[6];                              /* same, angles in radians  */
    int      have_a = 0, have_e = 0, have_i = 0, have_om = 0;
    int      have_w = 0, have_M = 0, have_epoch = 0;
    int      have_start = 0, have_span = 0, have_step = 0;
    int      have_sig[6] = { 0, 0, 0, 0, 0, 0 };
    int      any_sig = 0;
    int      k;

    long     n_samples;
    double   best_d;
    double   best_t;
    int      n_minima = 0;

    double   dmin_km, vrel, bcap;
    int      hit;
    double   prob;
    double   prob_sig = 0;
    int      n_valid  = 0;
    char     date_txt[64];

    double  *t_all;
    int      n_plot;
    int      p;
    Matrix  *t_vec;
    Matrix  *d_vec;
    Matrix  *info;

    /* ── read parameters ── */
    parse_named_param(args, "a",     &a,     &have_a);
    parse_named_param(args, "e",     &e,     &have_e);
    parse_named_param(args, "i",     &incl,  &have_i);
    parse_named_param(args, "om",    &om,    &have_om);
    parse_named_param(args, "w",     &w,     &have_w);
    parse_named_param(args, "M",     &M,     &have_M);
    parse_named_param(args, "epoch", &epoch, &have_epoch);
    parse_named_param(args, "start", &start, &have_start);
    parse_named_param(args, "span",  &span,  &have_span);
    parse_named_param(args, "step",  &step,  &have_step);
    parse_named_param(args, "sa",    &sig_in[0], &have_sig[0]);
    parse_named_param(args, "se",    &sig_in[1], &have_sig[1]);
    parse_named_param(args, "si",    &sig_in[2], &have_sig[2]);
    parse_named_param(args, "som",   &sig_in[3], &have_sig[3]);
    parse_named_param(args, "sw",    &sig_in[4], &have_sig[4]);
    parse_named_param(args, "sM",    &sig_in[5], &have_sig[5]);

    if (!have_a || !have_e || !have_i || !have_om ||
        !have_w || !have_M || !have_epoch)
    {
        printf("  Usage: asteroid a=<AU> e=<> i=<deg> om=<deg> w=<deg> M=<deg> epoch=<JD>\n");
        printf("                  [start=<JD>] [span=<days>] [step=<days>]\n");
        printf("                  [sa=<> se=<> si=<> som=<> sw=<> sM=<>]  (1-sigma)\n");
        printf("  Elements: heliocentric, ecliptic J2000 — as listed by JPL's\n");
        printf("  Small-Body Database (ssd.jpl.nasa.gov/tools/sbdb_lookup.html).\n");
        return;
    }

    /* ── sanity checks ── */
    if (a <= 0)               { printf("  asteroid: a must be > 0\n");                        return; }
    if (e < 0 || e >= 1)      { printf("  asteroid: e must be in [0, 1) — hyperbolic orbits "
                                       "are not supported\n");                                return; }
    if (span <= 0)            { printf("  asteroid: span must be > 0\n");                     return; }
    if (step <= 0)            { printf("  asteroid: step must be > 0\n");                     return; }

    for (k = 0; k < 6; k++)
    {
        if (sig_in[k] < 0) { printf("  asteroid: uncertainties cannot be negative\n"); return; }
        if (sig_in[k] > 0) any_sig = 1;
    }

    epoch = normalise_jd(epoch);
    start = have_start ? normalise_jd(start) : epoch;

    n_samples = (long)ceil(span / step) + 1;
    if (n_samples > AST_MAX_SAMPLES)
    {
        printf("  asteroid: span/step asks for %ld samples (limit %d) — "
               "use a larger step\n", n_samples, AST_MAX_SAMPLES);
        return;
    }

    /* ── store inputs, so the GUI form can sync back to them ── */
    set_var("asteroid_a",     a);
    set_var("asteroid_e",     e);
    set_var("asteroid_i",     incl);
    set_var("asteroid_om",    om);
    set_var("asteroid_w",     w);
    set_var("asteroid_M",     M);
    set_var("asteroid_epoch", epoch);
    set_var("asteroid_start", start);
    set_var("asteroid_span",  span);
    set_var("asteroid_step",  step);
    set_var("asteroid_sa",    sig_in[0]);
    set_var("asteroid_se",    sig_in[1]);
    set_var("asteroid_si",    sig_in[2]);
    set_var("asteroid_som",   sig_in[3]);
    set_var("asteroid_sw",    sig_in[4]);
    set_var("asteroid_sM",    sig_in[5]);

    ast.a     = a;
    ast.e     = e;
    ast.i     = incl * AST_D2R;
    ast.om    = om   * AST_D2R;
    ast.w     = w    * AST_D2R;
    ast.M0    = M    * AST_D2R;
    ast.epoch = epoch;

    /* ── nominal orbit: closest approach and verdict ── */
    best_d  = find_closest(&ast, start, start + span, step, &best_t, &n_minima);
    dmin_km = best_d * AST_AU_KM;
    vrel    = relative_speed_kms(&ast, best_t);
    bcap    = capture_radius_km(vrel);
    hit     = (dmin_km <= bcap);

    /* ── impact probability ──
       No error bars means the nominal answer is the whole answer. */
    if (any_sig)
    {
        sig[0] = sig_in[0];                 /* a, AU            */
        sig[1] = sig_in[1];                 /* e, dimensionless */
        sig[2] = sig_in[2] * AST_D2R;       /* angles -> rad    */
        sig[3] = sig_in[3] * AST_D2R;
        sig[4] = sig_in[4] * AST_D2R;
        sig[5] = sig_in[5] * AST_D2R;

        prob = impact_probability(&ast, sig, best_t, &n_valid);

        /* binomial standard error of a fraction measured from n_valid trials */
        if (n_valid > 0)
            prob_sig = sqrt(prob * (1.0 - prob) / n_valid);
    }
    else
        prob = (double)hit;

    jd_to_text(best_t, date_txt, sizeof(date_txt));

    /* ── report ── */
    printf("\n  Asteroid Impact Screening  [km, km/s]\n");
    printf("  ─────────────────────────────────────────────────────\n");
    printf("  Inputs  (ecliptic J2000)              1-sigma\n");
    printf("    a     (semi-major axis)  = %-12g %g AU\n",  a,    sig_in[0]);
    printf("    e     (eccentricity)     = %-12g %g\n",     e,    sig_in[1]);
    printf("    i     (inclination)      = %-12g %g deg\n", incl, sig_in[2]);
    printf("    om    (ascending node)   = %-12g %g deg\n", om,   sig_in[3]);
    printf("    w     (arg. perihelion)  = %-12g %g deg\n", w,    sig_in[4]);
    printf("    M     (mean anomaly)     = %-12g %g deg\n", M,    sig_in[5]);
    printf("    epoch                    = %.5f JD\n", epoch);
    printf("    window                   = %.5f JD + %g days, step %g days\n",
           start, span, step);
    printf("  Results\n");
    printf("    closest approach         = %.0f km  (%.2f Earth radii, %.3f lunar distances)\n",
           dmin_km, dmin_km / AST_R_EARTH_KM, dmin_km / AST_LD_KM);
    printf("    time of closest approach = %.5f JD  (%s TDB, day %.2f of window)\n",
           best_t, date_txt, best_t - start);
    printf("    speed relative to Earth  = %.3f km/s\n", vrel);
    printf("    Earth capture radius     = %.0f km  (gravity-focused)\n", bcap);
    printf("    local minima examined    = %d\n", n_minima);
    if (any_sig)
        printf("    impact probability       = %.4f  (+/- %.4f, %d clone orbits)\n",
               prob, prob_sig, n_valid);
    else
        printf("    impact probability       = %.0f  (no uncertainties given — yes or no)\n",
               prob);
    printf("\n    VERDICT: %s\n",
           hit ? "*** IMPACT — trajectory passes inside Earth's capture radius ***"
               : "miss — trajectory stays outside Earth's capture radius");

    if (fabs(best_t - start) < 1e-9 || fabs(best_t - (start + span)) < 1e-9)
        printf("    note: closest point is at the edge of the window — widen span\n");

    if (start < 2378496.5 || start + span > 2469807.5)   /* 1800-01-01 .. 2050-01-01 */
        printf("    note: window falls outside 1800-2050, where Earth's elements are valid\n");

    if (any_sig)
        printf("    note: clone orbits vary each element independently; real orbit\n"
               "          errors are correlated, so the probability is approximate.\n");

    printf("    note: two-body screening — no planetary perturbations.\n");
    printf("          Official assessments: JPL Sentry, ESA NEOCC.\n");

    /* ── store results ── */
    set_var("asteroid_dmin",       dmin_km);
    set_var("asteroid_dmin_er",    dmin_km / AST_R_EARTH_KM);
    set_var("asteroid_dmin_ld",    dmin_km / AST_LD_KM);
    set_var("asteroid_tca",        best_t);
    set_var("asteroid_tca_d",      best_t - start);
    set_var("asteroid_vrel",       vrel);
    set_var("asteroid_bcap",       bcap);
    set_var("asteroid_hit",        (double)hit);
    set_var("asteroid_prob",       prob);
    set_var("asteroid_prob_sigma", prob_sig);

    /* ── full-precision summary for the graph window ── */
    info = mat_new(AST_INFO_LEN, 1);
    info->data[0]  = start;
    info->data[1]  = span;
    info->data[2]  = best_t;
    info->data[3]  = dmin_km;
    info->data[4]  = vrel;
    info->data[5]  = bcap;
    info->data[6]  = (double)hit;
    info->data[7]  = prob;
    info->data[8]  = prob_sig;
    info->data[9]  = (double)n_valid;
    info->data[10] = epoch;
    set_mat_var("asteroid_info", info);

    /* ── distance-vs-time curve (days after start, lunar distances) ──
       Evenly spaced samples across the window, plus a dense cluster round
       the encounter that includes the exact moment of closest approach.
       Without the cluster, a fast flyby's dip is drawn only as deep as the
       nearest even sample — which can be a lunar distance too shallow. */
    t_all  = malloc(sizeof(double) * (AST_PLOT_POINTS + AST_PLOT_DENSE));
    n_plot = 0;

    for (p = 0; p < AST_PLOT_POINTS; p++)
        t_all[n_plot++] = span * p / (AST_PLOT_POINTS - 1);

    for (p = 0; p < AST_PLOT_DENSE; p++)
    {
        /* evenly spaced across +/- AST_DENSE_DAYS; the middle one is the
           exact closest-approach time */
        double tp = (best_t - start)
                  + AST_DENSE_DAYS * (2.0 * p / (AST_PLOT_DENSE - 1) - 1.0);
        if (tp >= 0 && tp <= span)
            t_all[n_plot++] = tp;
    }

    qsort(t_all, n_plot, sizeof(double), cmp_double);

    t_vec = mat_new(n_plot, 1);
    d_vec = mat_new(n_plot, 1);
    for (p = 0; p < n_plot; p++)
    {
        t_vec->data[p] = t_all[p];
        d_vec->data[p] = earth_distance(&ast, start + t_all[p]) * AST_AU_KM / AST_LD_KM;
    }
    free(t_all);

    set_mat_var("asteroid_t", t_vec);
    set_mat_var("asteroid_d", d_vec);

    printf("\n  (results stored in $asteroid_dmin, $asteroid_tca, $asteroid_vrel,\n");
    printf("   $asteroid_bcap, $asteroid_hit, $asteroid_prob; distance curve in\n");
    printf("   $asteroid_d vs $asteroid_t)\n\n");
}
