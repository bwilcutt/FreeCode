#include "parse.h"
#include "matrix.h"
#include "mathfuncs.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>

/* ───────────────────────────────────────────────────────────
   Internal helpers
   ─────────────────────────────────────────────────────────── */

static int elem_count(const Matrix *v) { return v->rows * v->cols; }

static int cmp_double(const void *a, const void *b)
{
    double da = *(const double *)a;
    double db = *(const double *)b;
    return (da > db) - (da < db);
}

/* ───────────────────────────────────────────────────────────
   Vector -> scalar
   ─────────────────────────────────────────────────────────── */

/*************************************************************
 * Function:    vf_sum
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — sum of all elements
 *************************************************************/
double vf_sum(const Matrix *v)
{
    int    n = elem_count(v);
    double s = 0.0;
    int    i;
    for (i = 0; i < n; i++) s += v->data[i];
    return s;
}

/*************************************************************
 * Function:    vf_mean
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — arithmetic mean; 0 if empty
 *************************************************************/
double vf_mean(const Matrix *v)
{
    int n = elem_count(v);
    return (n > 0) ? vf_sum(v) / n : 0.0;
}

/*************************************************************
 * Function:    vf_median
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — median; 0 if empty
 * Description: Sorts a temporary copy so the original is not mutated.
 *              Returns the middle element (odd n) or the mean of the
 *              two middle elements (even n).
 *************************************************************/
double vf_median(const Matrix *v)
{
    int     n = elem_count(v);
    double *tmp;
    double  result;

    if (n <= 0) return 0.0;
    tmp = malloc(n * sizeof(double));
    if (!tmp) return 0.0;
    memcpy(tmp, v->data, n * sizeof(double));
    qsort(tmp, n, sizeof(double), cmp_double);
    result = (n % 2 == 1) ? tmp[n / 2]
                           : (tmp[n / 2 - 1] + tmp[n / 2]) * 0.5;
    free(tmp);
    return result;
}

/*************************************************************
 * Function:    vf_var
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — population variance; 0 if fewer than 1 element
 * Description: Two-pass method: compute mean first, then sum squared
 *              deviations.  More numerically stable than the single-pass form.
 *************************************************************/
double vf_var(const Matrix *v)
{
    int    n = elem_count(v);
    double m, acc;
    int    i;

    if (n < 1) return 0.0;
    m   = vf_mean(v);
    acc = 0.0;
    for (i = 0; i < n; i++)
    {
        double d = v->data[i] - m;
        acc += d * d;
    }
    return acc / n;
}

/*************************************************************
 * Function:    vf_std
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — population standard deviation
 *************************************************************/
double vf_std(const Matrix *v) { return sqrt(vf_var(v)); }

/*************************************************************
 * Function:    vf_min
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — smallest element; 0 if empty
 *************************************************************/
double vf_min(const Matrix *v)
{
    int    n = elem_count(v);
    double m;
    int    i;

    if (n <= 0) return 0.0;
    m = v->data[0];
    for (i = 1; i < n; i++) if (v->data[i] < m) m = v->data[i];
    return m;
}

/*************************************************************
 * Function:    vf_max
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — largest element; 0 if empty
 *************************************************************/
double vf_max(const Matrix *v)
{
    int    n = elem_count(v);
    double m;
    int    i;

    if (n <= 0) return 0.0;
    m = v->data[0];
    for (i = 1; i < n; i++) if (v->data[i] > m) m = v->data[i];
    return m;
}

/*************************************************************
 * Function:    vf_norm
 * Input:       v (const Matrix*) — matrix treated as flat array
 * Output:      double — L2 (Euclidean) norm: sqrt(sum of squares)
 *************************************************************/
double vf_norm(const Matrix *v)
{
    int    n = elem_count(v);
    double s = 0.0;
    int    i;
    for (i = 0; i < n; i++) s += v->data[i] * v->data[i];
    return sqrt(s);
}

/* ───────────────────────────────────────────────────────────
   Vector generators
   ─────────────────────────────────────────────────────────── */

/*************************************************************
 * Function:    vf_linspace
 * Input:       a (double) — start value
 *              b (double) — end value (inclusive)
 *              n (int)    — number of elements (clamped to >= 2)
 * Output:      Matrix* — column vector of n evenly-spaced values
 * Description: Produces the same sequence as MATLAB/NumPy linspace.
 *              When n==1 the single element equals a.
 *              Caller owns the returned matrix.
 *************************************************************/
Matrix *vf_linspace(double a, double b, int n)
{
    Matrix *v;
    int     i;

    if (n < 1) n = 1;
    v = mat_new(n, 1);
    if (n == 1) { v->data[0] = a; return v; }
    for (i = 0; i < n; i++)
        v->data[i] = a + (b - a) * i / (n - 1);
    return v;
}

/*************************************************************
 * Function:    vf_zeros
 * Input:       n (int) — number of elements
 * Output:      Matrix* — n-element column vector of zeros
 * Description: mat_new already zero-initialises via calloc.
 *              Caller owns the returned matrix.
 *************************************************************/
Matrix *vf_zeros(int n)
{
    if (n < 1) n = 1;
    return mat_new(n, 1);   /* calloc zero-fills */
}

/*************************************************************
 * Function:    vf_ones
 * Input:       n (int) — number of elements
 * Output:      Matrix* — n-element column vector of ones
 *              Caller owns the returned matrix.
 *************************************************************/
Matrix *vf_ones(int n)
{
    Matrix *v;
    int     i;

    if (n < 1) n = 1;
    v = mat_new(n, 1);
    for (i = 0; i < n; i++) v->data[i] = 1.0;
    return v;
}

/* ───────────────────────────────────────────────────────────
   Interpolation
   ─────────────────────────────────────────────────────────── */

/*************************************************************
 * Function:    vf_interp
 * Input:       xv (const Matrix*) — monotonically increasing x knots
 *              yv (const Matrix*) — corresponding y values (same length)
 *              x  (double)        — query point
 * Output:      double — linearly interpolated y at x
 * Description: Clamps to the first/last y value when x is outside the
 *              knot range.  Assumes xv is sorted ascending — no check
 *              is performed.  Element counts are taken from xv; yv must
 *              be at least as long.
 *************************************************************/
double vf_interp(const Matrix *xv, const Matrix *yv, double x)
{
    int    n = elem_count(xv);
    int    i;
    double t;

    if (n <= 0) return 0.0;
    if (n == 1) return yv->data[0];
    if (x <= xv->data[0])   return yv->data[0];
    if (x >= xv->data[n-1]) return yv->data[n-1];

    for (i = 0; i < n - 1; i++)
    {
        if (x >= xv->data[i] && x <= xv->data[i + 1])
        {
            t = (x - xv->data[i]) / (xv->data[i + 1] - xv->data[i]);
            return yv->data[i] + t * (yv->data[i + 1] - yv->data[i]);
        }
    }
    return yv->data[n - 1];
}
