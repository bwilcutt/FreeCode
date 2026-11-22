/* =============================================================================
 * File:         slittest.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-21
 * Description:  Two slits against one slit — does a fluid, carrying massless
 *               particles through slits, make a double-slit pattern?
 *
 *               The set-up (all heights measured from the channel floor):
 *
 *                   inlet         wall           screen     outlet
 *                     |  ------->  ##   ------->    :          |
 *                     |  parabolic ##  slit 2      :          |
 *                     |  flow in   ##  slit 1      :          |
 *                     |            ##               :          |
 *                       <- 0.05 ->  w <--- Ls ---->  <- 0.05 ->
 *
 *               Slit 1 sits at H/2 + d/2, slit 2 at H/2 - d/2.  "One slit"
 *               closes slit 2 and leaves slit 1 exactly where it was.
 *
 *               For every Reynolds number in the sweep:
 *                 1. Run the channel solver (channel.c's shared core) with
 *                    the slit wall as the obstacle, once with both slits
 *                    open and once with one.
 *                 2. After a warm-up, release massless tracers at the inlet,
 *                    spread so each one carries the same share of the flow,
 *                    and move them with the local fluid velocity (second-
 *                    order Runge-Kutta, bilinear interpolation off the
 *                    staggered grid).  Count where each crosses the screen.
 *                 3. Build the wave-optics pattern for the same geometry by
 *                    adding up Huygens wavelets from points across each
 *                    open slit (2D, free space, near field included).
 *                 4. Fit the wavelength so the two-slit wave pattern matches
 *                    the fluid's two-slit landing pattern as well as it
 *                    possibly can, then use that same wavelength for one
 *                    slit — same light, one slit taped over.
 *
 *               Fairness rules
 *                 - The wavelength search only covers wavelengths that put
 *                   fringes on the screen that the bins can resolve: a
 *                   wavelength so long that the "fringes" are wider than the
 *                   screen would match any single hump, which proves
 *                   nothing.
 *                 - Reynolds number is measured on the slit jet (mean speed
 *                   through an open slit x slit width / viscosity), so one
 *                   slit and two slits run at the same Re.  The jet speed is
 *                   held at 1 m/s and the viscosity changes instead, so
 *                   every run has the same time scale.
 *                 - The match score is the overlap of the two patterns
 *                   (each summing to 1): 1 = identical, 0 = no overlap.
 *
 *               Limits:
 *                 - The wave model is free space: it ignores reflections
 *                   off the channel walls.
 *                 - High Re on a coarse grid needs extra upwinding to stay
 *                   stable, which adds some numerical viscosity; raise res
 *                   if the highest Reynolds numbers matter to you.
 * ============================================================================= */

#include <stdint.h>
#include "slittest.h"
#include "channel.h"
#include "ns_core.h"

/* ═══════════════════════════════════════════════════════════
   CONSTANTS
   ═══════════════════════════════════════════════════════════ */

/* defaults */
#define ST_RE_MIN_DEFAULT    10.0
#define ST_RE_MAX_DEFAULT    1000.0
#define ST_RE_STEPS_DEFAULT  8
#define ST_A_DEFAULT         0.02      /* slit width, m                       */
#define ST_D_DEFAULT         0.08      /* slit separation, m                  */
#define ST_W_DEFAULT         0.02      /* wall thickness, m                   */
#define ST_H_DEFAULT         0.80      /* channel height, m — tall enough for
                                          several far-field fringes            */
#define ST_LS_DEFAULT        0.45      /* wall to screen, m                   */
#define ST_RES_DEFAULT       4         /* cells across one slit               */

/* limits */
#define ST_RES_MIN           3
#define ST_RES_MAX           20
#define ST_STEPS_MAX         40

/* fixed geometry and timing */
#define ST_UPSTREAM          0.05      /* inlet to wall, m                    */
#define ST_BUFFER            0.05      /* screen to outlet, m                 */
#define ST_UJET              1.0       /* mean speed through a slit, m/s      */
#define ST_WARM              3.0       /* warm-up, in screen transit times    */
#define ST_COLLECT           6.0       /* counting, in screen transit times   */
#define ST_RELEASE           16        /* tracers released per time step      */
#define ST_MAX_AGE           20.0      /* tracer retires after this many
                                          transit times — stuck in a corner   */
#define ST_GAMMA             1.2       /* upwinding: stable at high Re        */
#define ST_RHO               1.0       /* density — massless tracers do not
                                          care, but the solver wants one      */

/* screen and fitting */
#define ST_BINS              80        /* screen bins across the channel      */
#define ST_HUYGENS           24        /* wavelet sources across each slit    */
#define ST_LAM_N             400       /* wavelengths tried in the fit        */
#define ST_LAM_MIN_BINS      3.0       /* finest fringe: this many bins apart */
#define ST_LAM_MAX_FRAC      0.25      /* coarsest fringe: this much of H     */
#define ST_FAR_FIELD         1.0       /* fringe spacing at least this many
                                          slit separations: closer than that,
                                          the screen sits in the near field
                                          and the "pattern" is mostly the two
                                          slits' own shadows                  */

/* bump counting */
#define ST_PEAK_FLOOR        0.15      /* a bump must reach 15% of the top    */
#define ST_PEAK_VALLEY       0.70      /* two bumps need a dip below 70% of
                                          the smaller one between them        */

/* index into the (nx+2) x (ny+2) arrays, ghost ring included */
#define IX(i, j)  ((j) * stride + (i))

/*************************************************************
 * Struct:      SlitCtx
 * Description: One run's geometry, tracers and screen tally.
 *
 *   xw0, xw1    wall upstream and downstream faces, m
 *   xs          screen position, m
 *   H, a        channel height and slit width, m
 *   yc, nopen   centres of the open slits, and how many are open
 *   t_warm      tracers start after this time, s
 *   max_age     tracers older than this are retired, s
 *   tx, ty, tb  tracer positions and birth times
 *   tn, tcap    tracers alive, and room for them
 *   rng         xorshift state — the same every run, so runs repeat
 *   hist        screen tally, ST_BINS bins across 0..H
 *   landed      tracers that reached the screen
 *************************************************************/
typedef struct
{
    double    xw0;
    double    xw1;
    double    xs;
    double    H;
    double    a;
    double    yc[2];
    int       nopen;
    double    t_warm;
    double    max_age;
    double   *tx;
    double   *ty;
    double   *tb;
    int       tn;
    int       tcap;
    uint64_t  rng;
    double    hist[ST_BINS];
    long      landed;
} SlitCtx;

/* ═══════════════════════════════════════════════════════════
   SMALL HELPERS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    st_rand
 * Input:       state (uint64_t*) — generator state, advanced
 * Output:      double — uniform in [0, 1)
 * Description: xorshift64*.  Not cryptographic; it only has to
 *              scatter tracers, and it has never once complained.
 **************************************************************/
static double st_rand(uint64_t *state)
{
    uint64_t x = *state;

    x ^= x >> 12;
    x ^= x << 25;
    x ^= x >> 27;
    *state = x;
    return (double)((x * 2685821657736338717ULL) >> 11) * (1.0 / 9007199254740992.0);
}

/*************************************************************
 * Function:    inlet_height
 * Input:       q (double) — share of the inlet flow below, 0..1
 *              H (double) — channel height, m
 * Output:      double — height y with that share of the flow beneath it
 * Description: The parabolic inlet carries a share 3s^2 - 2s^3 of
 *              its flow below s = y/H.  Inverting that (by bisection —
 *              it's monotonic and only has to be done a few times per
 *              step) puts each tracer on an equal slice of the flow.
 **************************************************************/
static double inlet_height(double q, double H)
{
    double lo = 0.0;
    double hi = 1.0;
    double s;
    int    k;

    for (k = 0; k < 40; k++)
    {
        s = 0.5 * (lo + hi);
        if (3.0 * s * s - 2.0 * s * s * s < q) lo = s;
        else                                   hi = s;
    }
    return 0.5 * (lo + hi) * H;
}

/*************************************************************
 * Function:    interp_u
 * Input:       g    (const ChGrid*) — grid
 *              x, y (double)        — position, m
 * Output:      double — x velocity there, m/s
 * Description: Bilinear interpolation of the u faces.  u(i, j) sits
 *              at x = i h, y = (j - 1/2) h.  Ghost values make the
 *              walls come out at zero on their own.
 **************************************************************/
static double interp_u(const ChGrid *g, double x, double y)
{
    int    stride = g->nx + 2;
    double fi     = x / g->h;
    double fj     = y / g->h + 0.5;
    int    i0     = (int)floor(fi);
    int    j0     = (int)floor(fj);
    double sx, sy;

    /* keep the 2 x 2 stencil on the array */
    if (i0 < 0)          i0 = 0;
    if (i0 > g->nx - 1)  i0 = g->nx - 1;
    if (j0 < 0)          j0 = 0;
    if (j0 > g->ny)      j0 = g->ny;
    sx = fi - i0;  if (sx < 0.0) sx = 0.0;  if (sx > 1.0) sx = 1.0;
    sy = fj - j0;  if (sy < 0.0) sy = 0.0;  if (sy > 1.0) sy = 1.0;

    return (1.0 - sx) * (1.0 - sy) * g->u[IX(i0,     j0)]
         +        sx  * (1.0 - sy) * g->u[IX(i0 + 1, j0)]
         + (1.0 - sx) *        sy  * g->u[IX(i0,     j0 + 1)]
         +        sx  *        sy  * g->u[IX(i0 + 1, j0 + 1)];
}

/*************************************************************
 * Function:    interp_v
 * Input:       g    (const ChGrid*) — grid
 *              x, y (double)        — position, m
 * Output:      double — y velocity there, m/s
 * Description: Bilinear interpolation of the v faces.  v(i, j) sits
 *              at x = (i - 1/2) h, y = j h.
 **************************************************************/
static double interp_v(const ChGrid *g, double x, double y)
{
    int    stride = g->nx + 2;
    double fi     = x / g->h + 0.5;
    double fj     = y / g->h;
    int    i0     = (int)floor(fi);
    int    j0     = (int)floor(fj);
    double sx, sy;

    if (i0 < 0)          i0 = 0;
    if (i0 > g->nx)      i0 = g->nx;
    if (j0 < 0)          j0 = 0;
    if (j0 > g->ny - 1)  j0 = g->ny - 1;
    sx = fi - i0;  if (sx < 0.0) sx = 0.0;  if (sx > 1.0) sx = 1.0;
    sy = fj - j0;  if (sy < 0.0) sy = 0.0;  if (sy > 1.0) sy = 1.0;

    return (1.0 - sx) * (1.0 - sy) * g->v[IX(i0,     j0)]
         +        sx  * (1.0 - sy) * g->v[IX(i0 + 1, j0)]
         + (1.0 - sx) *        sy  * g->v[IX(i0,     j0 + 1)]
         +        sx  *        sy  * g->v[IX(i0 + 1, j0 + 1)];
}

/*************************************************************
 * Function:    overlap
 * Input:       p, q (const double*) — two patterns, each summing to 1
 *              n    (int)           — bins
 * Output:      double — sum of the smaller of each pair, 0..1
 * Description: The match score.  1 = the same pattern, 0 = they
 *              never share a bin.
 **************************************************************/
static double overlap(const double *p, const double *q, int n)
{
    double sum = 0.0;
    int    k;

    for (k = 0; k < n; k++) sum += fmin(p[k], q[k]);
    return sum;
}

/*************************************************************
 * Function:    normalise
 * Input:       p (double*) — pattern, rescaled in place
 *              n (int)     — bins
 * Output:      int — 1 if it had anything in it, 0 if it was empty
 * Description: Scales a pattern so its bins add up to 1.
 **************************************************************/
static int normalise(double *p, int n)
{
    double sum = 0.0;
    int    k;

    for (k = 0; k < n; k++) sum += p[k];
    if (sum <= 0.0) return 0;
    for (k = 0; k < n; k++) p[k] /= sum;
    return 1;
}

/*************************************************************
 * Function:    count_bumps
 * Input:       p (const double*) — pattern
 *              n (int)           — bins
 * Output:      int — distinct bumps (bright bands, piles of particles)
 * Description: Smooths over three bins, takes every local high that
 *              reaches ST_PEAK_FLOOR of the tallest, then merges two
 *              neighbours unless the dip between them falls below
 *              ST_PEAK_VALLEY of the smaller one — so a ragged hump
 *              counts once, and real fringes count separately.
 **************************************************************/
static int count_bumps(const double *p, int n)
{
    double s[ST_BINS];
    double top = 0.0;
    double valley;
    int    kept[ST_BINS];
    int    nkept = 0;
    int    k, m;

    /* three-bin smoothing; the ends just average what they have */
    for (k = 0; k < n; k++)
    {
        double sum = p[k];
        int    cnt = 1;
        if (k > 0)     { sum += p[k - 1]; cnt++; }
        if (k < n - 1) { sum += p[k + 1]; cnt++; }
        s[k] = sum / cnt;
        if (s[k] > top) top = s[k];
    }
    if (top <= 0.0) return 0;

    for (k = 0; k < n; k++)
    {
        /* a local high: not below the left, above the right (plateaus
           count at their right-hand end) */
        if (k > 0     && s[k] <  s[k - 1]) continue;
        if (k < n - 1 && s[k] <= s[k + 1]) continue;
        if (s[k] < ST_PEAK_FLOOR * top)    continue;

        if (nkept > 0)
        {
            /* deepest point between this high and the last one kept */
            valley = s[kept[nkept - 1]];
            for (m = kept[nkept - 1]; m <= k; m++)
                if (s[m] < valley) valley = s[m];

            if (valley > ST_PEAK_VALLEY * fmin(s[k], s[kept[nkept - 1]]))
            {
                /* no real dip: same bump — keep whichever is taller */
                if (s[k] > s[kept[nkept - 1]]) kept[nkept - 1] = k;
                continue;
            }
        }
        kept[nkept++] = k;
    }
    return nkept;
}

/*************************************************************
 * Function:    wave_pattern
 * Input:       lam   (double)        — wavelength, m
 *              yc    (const double*) — open slit centres, m
 *              nopen (int)           — how many slits are open
 *              a     (double)        — slit width, m
 *              Ls    (double)        — slit exit to screen, m
 *              H     (double)        — screen height, m
 *              out   (double*)       — receives ST_BINS intensities,
 *                                      summing to 1
 * Output:      void
 * Description: Huygens: every point across an open slit sends out a
 *              circular wavelet; the screen sees their sum.  In 2D a
 *              wavelet falls off as 1/sqrt(r).  Done in full, not with
 *              the far-field shortcut, because the screen is close
 *              enough to the slits for the shortcut to lie.
 **************************************************************/
static void wave_pattern(double lam, const double *yc, int nopen, double a,
                         double Ls, double H, double *out)
{
    double k  = 2.0 * M_PI / lam;
    double yb, ys, r, amp, re, im;
    int    b, sl, m;

    for (b = 0; b < ST_BINS; b++)
    {
        yb = (b + 0.5) * H / ST_BINS;
        re = 0.0;
        im = 0.0;
        for (sl = 0; sl < nopen; sl++)
        {
            for (m = 0; m < ST_HUYGENS; m++)
            {
                ys  = yc[sl] - 0.5 * a + (m + 0.5) * a / ST_HUYGENS;
                r   = hypot(Ls, yb - ys);
                amp = 1.0 / sqrt(r);
                re += amp * cos(k * r);
                im += amp * sin(k * r);
            }
        }
        out[b] = re * re + im * im;
    }
    normalise(out, ST_BINS);
}

/* ═══════════════════════════════════════════════════════════
   SOLVER HOOKS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    slit_body
 * Input:       g   (ChGrid*) — grid; wall cells marked solid
 *              ctx (void*)   — SlitCtx with the wall and slits
 * Output:      void
 * Description: Every cell whose centre is in the wall's thickness is
 *              solid, unless it falls inside an open slit.
 **************************************************************/
static void slit_body(ChGrid *g, void *ctx)
{
    SlitCtx *c      = ctx;
    int      stride = g->nx + 2;
    double   x, y;
    int      i, j, sl, open;

    for (j = 1; j <= g->ny; j++)
    {
        y = (j - 0.5) * g->h;
        for (i = 1; i <= g->nx; i++)
        {
            x = (i - 0.5) * g->h;
            if (x < c->xw0 || x >= c->xw1) continue;     /* not the wall */

            /* inside the wall: solid unless it's a hole */
            open = 0;
            for (sl = 0; sl < c->nopen; sl++)
                if (fabs(y - c->yc[sl]) < 0.5 * c->a) open = 1;
            g->solid[IX(i, j)] = !open;
        }
    }
}

/*************************************************************
 * Function:    slit_step
 * Input:       g   (ChGrid*) — grid after a good time step
 *              t   (double)  — time reached, s
 *              dt  (double)  — the step just taken, s
 *              ctx (void*)   — SlitCtx; tracers moved, screen tallied
 * Output:      void
 * Description: Once the warm-up is over: release a fresh batch of
 *              tracers at the inlet, move every tracer with the flow
 *              (RK2 midpoint), and count the ones that cross the
 *              screen.  Tracers that wander into the wall (a grid-
 *              size accident), leave the channel, or idle in a corner
 *              too long are retired.
 **************************************************************/
static void slit_step(ChGrid *g, double t, double dt, void *ctx)
{
    SlitCtx *c = ctx;
    double   x, y, u1, v1, xm, ym, u2, v2, xn, yn, ycross;
    int      k, bin, ci, cj, drop;

    if (t < c->t_warm) return;            /* the flow is still settling in */

    /* ── release: ST_RELEASE tracers on equal slices of the inlet flow,
          each jittered inside its slice so they don't march in rows ── */
    if (c->tn + ST_RELEASE > c->tcap)
    {
        c->tcap = c->tcap ? c->tcap * 2 : 8192;
        c->tx   = realloc(c->tx, c->tcap * sizeof(double));
        c->ty   = realloc(c->ty, c->tcap * sizeof(double));
        c->tb   = realloc(c->tb, c->tcap * sizeof(double));
    }
    for (k = 0; k < ST_RELEASE; k++)
    {
        c->tx[c->tn] = 0.5 * g->h;
        c->ty[c->tn] = inlet_height((k + st_rand(&c->rng)) / ST_RELEASE, c->H);
        c->tb[c->tn] = t;
        c->tn++;
    }

    /* ── move them all ── */
    k = 0;
    while (k < c->tn)
    {
        x = c->tx[k];
        y = c->ty[k];

        /* RK2 midpoint: half a step to look ahead, then the full step
           with the velocity found there */
        u1 = interp_u(g, x, y);
        v1 = interp_v(g, x, y);
        xm = x + 0.5 * dt * u1;
        ym = y + 0.5 * dt * v1;
        u2 = interp_u(g, xm, ym);
        v2 = interp_v(g, xm, ym);
        xn = x + dt * u2;
        yn = y + dt * v2;

        drop = 0;

        if (x < c->xs && xn >= c->xs)
        {
            /* crossed the screen: where, exactly, between the two points */
            ycross = y + (yn - y) * (c->xs - x) / (xn - x);
            bin    = (int)(ycross / c->H * ST_BINS);
            if (bin >= 0 && bin < ST_BINS)
            {
                c->hist[bin] += 1.0;
                c->landed++;
            }
            drop = 1;
        }
        else if (yn <= 0.0 || yn >= c->H || xn <= 0.0)
        {
            drop = 1;                                  /* left the channel */
        }
        else
        {
            /* ended up inside the wall?  massless means no tunnelling */
            ci = (int)(xn / g->h) + 1;
            cj = (int)(yn / g->h) + 1;
            if (!ch_is_fluid(g, ci, cj))      drop = 1;
            if (t - c->tb[k] > c->max_age)    drop = 1;
        }

        if (drop)
        {
            /* swap the last one into this slot; don't advance k */
            c->tn--;
            c->tx[k] = c->tx[c->tn];
            c->ty[k] = c->ty[c->tn];
            c->tb[k] = c->tb[c->tn];
            continue;
        }

        c->tx[k] = xn;
        c->ty[k] = yn;
        k++;
    }
}

/* ═══════════════════════════════════════════════════════════
   ONE RUN
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    slit_run
 * Input:       c     (SlitCtx*)       — geometry filled in; tally out
 *              s     (const ChSetup*) — channel set-up for this run
 * Output:      int — 0 = ran and tracers landed, 1 = unstable,
 *                    2 = nothing reached the screen
 * Description: One fluid run with tracers: build, march, tally.
 *              The landing pattern is left in c->hist, summing to 1.
 **************************************************************/
static int slit_run(SlitCtx *c, const ChSetup *s)
{
    ChGrid    g;
    ChHooks   hooks;
    ChRunInfo info;
    int       rc;

    /* fresh tally and the same random sequence every time */
    memset(c->hist, 0, sizeof c->hist);
    c->landed = 0;
    c->tn     = 0;
    c->rng    = 0x9E3779B97F4A7C15ULL;

    hooks.body   = slit_body;
    hooks.step   = slit_step;
    hooks.report = NULL;
    hooks.ctx    = c;

    if (ch_grid_init(&g, s, &hooks) != 0) return 1;
    rc = ch_solve(&g, s, &hooks, &info);
    ch_grid_free(&g);

    if (rc != 0) return 1;
    if (!normalise(c->hist, ST_BINS)) return 2;
    return 0;
}

/*************************************************************
 * Function:    slittest_usage
 * Input:       void
 * Output:      void — usage text printed to stdout
 * Description: Shown for "slittest ?" and on bad input.
 **************************************************************/
static void slittest_usage(void)
{
    printf("\n  Two slits against one: fluid particles against waves\n");
    printf("  ──────────────────────────────────────────────────────────\n");
    printf("  slittest [Re_min=<>], [Re_max=<>], [Re_steps=<>],\n");
    printf("           [a=<>], [d=<>], [w=<>], [H=<>], [Ls=<>], [res=<>]\n");
    printf("\n");
    printf("  Massless particles ride a fluid through a wall with slits in it\n");
    printf("  and a screen counts where they land.  Each Reynolds number runs\n");
    printf("  twice, both slits open and then one, and each pattern is scored\n");
    printf("  against the wave-optics pattern, with the wavelength fitted to\n");
    printf("  give the fluid its best chance.\n");
    printf("\n");
    printf("  Re_min, Re_max  Reynolds range on the slit jet  (%g, %g)\n",
           ST_RE_MIN_DEFAULT, ST_RE_MAX_DEFAULT);
    printf("  Re_steps        how many, evenly spread on a log scale  (%d)\n",
           ST_RE_STEPS_DEFAULT);
    printf("  a  slit width (%g m)     d  slit separation (%g m)\n",
           ST_A_DEFAULT, ST_D_DEFAULT);
    printf("  w  wall thickness (%g m) H  channel height (%g m)\n",
           ST_W_DEFAULT, ST_H_DEFAULT);
    printf("  Ls wall to screen (%g m) res cells across a slit (%d)\n",
           ST_LS_DEFAULT, ST_RES_DEFAULT);
    printf("\n");
    printf("    -> $slit_best $slit_bestRe\n");
    printf("    -> $slit_re $slit_match2 $slit_match1 $slit_lambda\n");
    printf("       $slit_bumps2 $slit_bumps1 $slit_bands2 $slit_bands1\n");
    printf("                                            (one row per Re)\n");
    printf("    -> $slit_ns2 $slit_ns1 $slit_wave2 $slit_wave1 $slit_y\n");
    printf("                                            (screen patterns)\n");
    printf("  ──────────────────────────────────────────────────────────\n\n");
}

/*************************************************************
 * Function:    run_slittest
 * Input:       args (const char*) — text following the "slittest" keyword
 * Output:      void — results printed and stored in $slit_* variables
 * Description: Reads the set-up, then for each Reynolds number runs
 *              the fluid with two slits and with one, fits the
 *              wavelength, scores both, prints a row; finally prints
 *              the best match and a plain-English verdict and stores
 *              everything for plotting.
 **************************************************************/
void run_slittest(const char *args)
{
    double   reMin = ST_RE_MIN_DEFAULT, reMax = ST_RE_MAX_DEFAULT;
    double   steps_d = ST_RE_STEPS_DEFAULT;
    double   a = ST_A_DEFAULT, d = ST_D_DEFAULT, w = ST_W_DEFAULT;
    double   H = ST_H_DEFAULT, Ls = ST_LS_DEFAULT, res_d = ST_RES_DEFAULT;
    int      found = 0;
    int      nsteps, res, nx, ny;
    double   h, L, binw, lamMin, lamMax, lam, sc, bestSc;
    SlitCtx  c;
    ChSetup  s;
    double   ns2[ST_BINS], ns1[ST_BINS], wv2[ST_BINS], wv1[ST_BINS];
    double  *reV, *m2V, *m1V, *lamV, *b2V, *b1V, *w2V, *w1V;
    Matrix  *ns2M, *ns1M, *wv2M, *wv1M, *yM;
    double   Re, best = -1.0, bestRe = 0.0;
    int      bestIdx = -1;
    int      q, k, b, rc2, rc1, unstable = 0;
    int      wb2 = 0, wb1 = 0;

    /* ── "slittest ?" ── */
    while (isspace(*args)) args++;
    if (*args == '?') { slittest_usage(); return; }

    /* ── inputs ── */
    parse_named_param(args, "Re_min",   &reMin,   &found);
    parse_named_param(args, "Re_max",   &reMax,   &found);
    parse_named_param(args, "Re_steps", &steps_d, &found);
    parse_named_param(args, "a",        &a,       &found);
    parse_named_param(args, "d",        &d,       &found);
    parse_named_param(args, "w",        &w,       &found);
    parse_named_param(args, "H",        &H,       &found);
    parse_named_param(args, "Ls",       &Ls,      &found);
    parse_named_param(args, "res",      &res_d,   &found);

    /* ── sanity, in plain words ── */
    if (reMin <= 0.0 || reMax < reMin)
    {
        printf("  slittest: Re_min must be above zero and Re_max at least Re_min.\n\n");
        return;
    }
    if (a <= 0.0 || d <= a || w <= 0.0 || H <= 0.0 || Ls <= 0.0)
    {
        printf("  slittest: sizes must be above zero, and the slits must be\n");
        printf("            further apart (d) than they are wide (a).\n\n");
        return;
    }
    nsteps = (int)(steps_d + 0.5);
    if (nsteps < 1)            nsteps = 1;
    if (nsteps > ST_STEPS_MAX) nsteps = ST_STEPS_MAX;
    res = (int)(res_d + 0.5);
    if (res < ST_RES_MIN) res = ST_RES_MIN;
    if (res > ST_RES_MAX) res = ST_RES_MAX;

    /* ── geometry ── */
    memset(&c, 0, sizeof c);
    h        = a / res;
    c.H      = H;
    c.a      = a;
    c.xw0    = ST_UPSTREAM;
    c.xw1    = ST_UPSTREAM + w;
    c.xs     = c.xw1 + Ls;
    c.yc[0]  = 0.5 * H + 0.5 * d;          /* slit 1: stays open        */
    c.yc[1]  = 0.5 * H - 0.5 * d;          /* slit 2: closed for "one"  */
    c.t_warm = ST_WARM * Ls / ST_UJET;
    c.max_age = ST_MAX_AGE * Ls / ST_UJET;
    L        = c.xs + ST_BUFFER;

    if (c.yc[0] + 0.5 * a > H - 2.0 * h || c.yc[1] - 0.5 * a < 2.0 * h)
    {
        printf("  slittest: the slits don't fit in the channel.  Make H bigger\n");
        printf("            or bring the slits closer together (smaller d).\n\n");
        return;
    }

    /* ── the parts of the set-up that never change between runs ── */
    memset(&s, 0, sizeof s);
    s.L            = L;
    s.H            = H;
    s.rho          = ST_RHO;
    s.D            = a;                    /* cells are sized on the slit */
    s.res          = res;
    s.t_end        = (ST_WARM + ST_COLLECT) * Ls / ST_UJET;
    s.tol          = 0.0;                  /* never "settle": keep counting */
    s.gamma_safety = ST_GAMMA;
    s.Uref         = ST_UJET;              /* the jets set the pressure scale */

    ch_grid_dims(&s, &nx, &ny, &h);
    if (nx < 4 || ny < 4)
    {
        printf("  slittest: the channel is too small for the grid.  Raise res.\n\n");
        return;
    }

    /* ── wavelengths allowed.  Fringe spacing on the screen is about
          lam Ls / d.  It must be:
            - wide enough for the bins to see (ST_LAM_MIN_BINS),
            - at least the slit separation, so the screen is in the far
              field where real fringes live, not the near field where a
              wave just casts two slit-shaped shadows — which would hand
              two fluid jets a match they didn't earn,
            - narrow enough that a few fit on the screen ── */
    binw   = H / ST_BINS;
    lamMin = fmax(ST_LAM_MIN_BINS * binw, ST_FAR_FIELD * d) * d / Ls;
    lamMax = ST_LAM_MAX_FRAC * H * d / Ls;
    if (lamMax <= lamMin)
    {
        printf("  slittest: the screen is too short to show far-field fringes.\n");
        printf("            Make H bigger, or bring the slits closer (smaller d).\n\n");
        return;
    }

    reV  = calloc(nsteps, sizeof(double));
    m2V  = calloc(nsteps, sizeof(double));
    m1V  = calloc(nsteps, sizeof(double));
    lamV = calloc(nsteps, sizeof(double));
    b2V  = calloc(nsteps, sizeof(double));
    b1V  = calloc(nsteps, sizeof(double));
    w2V  = calloc(nsteps, sizeof(double));
    w1V  = calloc(nsteps, sizeof(double));
    ns2M = mat_new(ST_BINS, nsteps);
    ns1M = mat_new(ST_BINS, nsteps);
    wv2M = mat_new(ST_BINS, nsteps);
    wv1M = mat_new(ST_BINS, nsteps);
    yM   = mat_new(ST_BINS, 1);
    for (b = 0; b < ST_BINS; b++) MAT(yM, b, 0) = (b + 0.5) * binw;

    printf("\n  Two Slits Against One — Fluid Particles Against Waves\n");
    printf("  ──────────────────────────────────────────────────────────────\n");
    printf("  Slits %g m wide, %g m apart; screen %g m behind the wall\n", a, d, Ls);
    printf("  Grid %d x %d (%d cells across a slit), %d Reynolds numbers\n",
           nx, ny, res, nsteps);
    printf("  Wavelengths tried: %.3g to %.3g m (fringes the screen can show)\n",
           lamMin, lamMax);
    printf("  Each Reynolds number runs the fluid twice; this takes a while.\n\n");
    printf("      Re    match 2 slits  match 1 slit   fluid bumps   wave bands   wavelength\n");
    printf("                                            2 / 1         2 / 1          m\n");
    fflush(stdout);

    for (q = 0; q < nsteps; q++)
    {
        /* log-spaced Reynolds numbers, Re_min .. Re_max */
        Re = (nsteps == 1) ? reMin
                           : reMin * pow(reMax / reMin, (double)q / (nsteps - 1));
        reV[q] = Re;

        /* jet speed held at ST_UJET: viscosity sets Re */
        s.nu = ST_UJET * a / Re;

        /* ── two slits: inlet mean = jet x (2a / H), peak = 1.5 x mean ── */
        c.nopen = 2;
        s.U     = 1.5 * ST_UJET * 2.0 * a / H;
        rc2     = slit_run(&c, &s);
        memcpy(ns2, c.hist, sizeof ns2);

        /* ── one slit: same jet speed through the one that's left ── */
        c.nopen = 1;
        s.U     = 1.5 * ST_UJET * a / H;
        rc1     = slit_run(&c, &s);
        memcpy(ns1, c.hist, sizeof ns1);

        if (rc2 != 0 || rc1 != 0)
        {
            /* no pattern to score — say why, in a row of its own */
            printf("  %7.4g    %s\n", Re,
                   (rc2 == 1 || rc1 == 1)
                   ? "the fluid run became unstable — try a larger res"
                   : "no particles reached the screen");
            m2V[q] = -1.0;
            m1V[q] = -1.0;
            unstable++;
            continue;
        }

        /* ── fit: the wavelength that suits the fluid's two-slit
              pattern best, searched on a log scale ── */
        bestSc = -1.0;
        lamV[q] = lamMin;
        for (k = 0; k < ST_LAM_N; k++)
        {
            lam = lamMin * pow(lamMax / lamMin, (double)k / (ST_LAM_N - 1));
            wave_pattern(lam, c.yc, 2, a, Ls, H, wv2);
            sc = overlap(ns2, wv2, ST_BINS);
            if (sc > bestSc) { bestSc = sc; lamV[q] = lam; }
        }

        /* same light, one slit taped over */
        wave_pattern(lamV[q], c.yc, 2, a, Ls, H, wv2);
        wave_pattern(lamV[q], c.yc, 1, a, Ls, H, wv1);
        m2V[q] = overlap(ns2, wv2, ST_BINS);
        m1V[q] = overlap(ns1, wv1, ST_BINS);
        b2V[q] = count_bumps(ns2, ST_BINS);
        b1V[q] = count_bumps(ns1, ST_BINS);
        w2V[q] = count_bumps(wv2, ST_BINS);
        w1V[q] = count_bumps(wv1, ST_BINS);

        for (b = 0; b < ST_BINS; b++)
        {
            MAT(ns2M, b, q) = ns2[b];
            MAT(ns1M, b, q) = ns1[b];
            MAT(wv2M, b, q) = wv2[b];
            MAT(wv1M, b, q) = wv1[b];
        }

        if (m2V[q] > best)
        {
            best    = m2V[q];
            bestRe  = Re;
            bestIdx = q;
            wb2     = (int)w2V[q];
            wb1     = (int)w1V[q];
        }

        printf("  %7.4g       %3.0f%%          %3.0f%%          %2d / %-2d       %2d / %-2d    %.3g\n",
               Re, 100.0 * m2V[q], 100.0 * m1V[q],
               (int)b2V[q], (int)b1V[q], (int)w2V[q], (int)w1V[q],
               lamV[q]);
        fflush(stdout);
    }

    /* ── verdict, in plain words ── */
    printf("  ──────────────────────────────────────────────────────────────\n");
    if (bestIdx < 0)
    {
        printf("  No run produced a pattern to compare.  Try a larger res.\n");
    }
    else
    {
        printf("  Best two-slit match: %.0f%% at Re = %.4g (wavelength %.3g m)\n",
               100.0 * best, bestRe, lamV[bestIdx]);
        printf("  There, waves give %d bright band%s with two slits and %d with one;\n",
               wb2, wb2 == 1 ? "" : "s", wb1);
        printf("  the fluid piled its particles into %d bump%s with two slits and %d with one.\n",
               (int)b2V[bestIdx], b2V[bestIdx] == 1 ? "" : "s", (int)b1V[bestIdx]);

        /* the hypothesis wins only if the fluid makes a row of fringes
           that collapses when one slit closes — like the waves do */
        if (best >= 0.80 && b2V[bestIdx] >= 4 && b1V[bestIdx] <= 2)
            printf("  Verdict: the fluid made fringe-like bands that went away when\n"
                   "  one slit closed — the behaviour the wave pattern shows.\n");
        else
            printf("  Verdict: at no Reynolds number in this sweep did the fluid's\n"
                   "  landing pattern look like a two-slit interference pattern.\n");
    }
    if (unstable > 0)
        printf("  %d Reynolds number%s gave no result (see the table).\n",
               unstable, unstable == 1 ? "" : "s");
    printf("  ──────────────────────────────────────────────────────────────\n");

    /* ── store ── */
    set_var("slit_best",   best);
    set_var("slit_bestRe", bestRe);
    set_mat_var("slit_re",     ns_vec_from_array(reV,  nsteps));
    set_mat_var("slit_match2", ns_vec_from_array(m2V,  nsteps));
    set_mat_var("slit_match1", ns_vec_from_array(m1V,  nsteps));
    set_mat_var("slit_lambda", ns_vec_from_array(lamV, nsteps));
    set_mat_var("slit_bumps2", ns_vec_from_array(b2V,  nsteps));
    set_mat_var("slit_bumps1", ns_vec_from_array(b1V,  nsteps));
    set_mat_var("slit_bands2", ns_vec_from_array(w2V,  nsteps));
    set_mat_var("slit_bands1", ns_vec_from_array(w1V,  nsteps));
    set_mat_var("slit_ns2",    ns2M);
    set_mat_var("slit_ns1",    ns1M);
    set_mat_var("slit_wave2",  wv2M);
    set_mat_var("slit_wave1",  wv1M);
    set_mat_var("slit_y",      yM);

    printf("  $slit_best $slit_bestRe\n");
    printf("  $slit_re $slit_match2 $slit_match1 $slit_lambda  [%d x 1]\n", nsteps);
    printf("  $slit_bumps2 $slit_bumps1 $slit_bands2 $slit_bands1  [%d x 1]\n", nsteps);
    printf("  $slit_ns2 $slit_ns1 $slit_wave2 $slit_wave1  [%d x %d]   $slit_y [%d x 1]\n\n",
           ST_BINS, nsteps, ST_BINS);

    free(reV); free(m2V); free(m1V); free(lamV); free(b2V); free(b1V);
    free(w2V); free(w1V);
    free(c.tx); free(c.ty); free(c.tb);
}
