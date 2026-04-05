#ifndef MATHFUNCS_H
#define MATHFUNCS_H

#include "scalar.h"
#include "matrix.h"

/*************************************************************
 * mathfuncs.h — extended scalar and vector math functions
 *
 * Scalar — one argument (handled in parse_factor):
 *   asin(x)  acos(x)  atan(x)     inverse trig
 *   sinh(x)  cosh(x)  tanh(x)     hyperbolic trig
 *   asinh(x) acosh(x) atanh(x)    inverse hyperbolic
 *   deg(x)                        radians -> degrees
 *   rad(x)                        degrees -> radians
 *   round(x)                      nearest integer
 *   trunc(x)                      truncate toward zero
 *   sign(x)                       -1, 0, or +1
 *   cbrt(x)                       cube root
 *   log2(x)                       base-2 logarithm
 *   log1p(x)                      ln(1+x), accurate near zero
 *   expm1(x)                      e^x-1,   accurate near zero
 *   db(x)                         20*log10(|x|)  amplitude dB
 *   dbp(x)                        10*log10(|x|)  power dB
 *
 * Scalar — two arguments (handled in parse_factor):
 *   atan2(y,x)    four-quadrant arctangent
 *   pow(x,y)      x raised to y  (alias for ^ operator)
 *   mod(x,y)      floating-point remainder  (fmod)
 *   min(x,y)      smaller of two scalars
 *   max(x,y)      larger of two scalars
 *   hypot(x,y)    sqrt(x^2+y^2)
 *
 * Scalar — three arguments (handled in parse_factor):
 *   clamp(x,lo,hi)   constrain x to [lo, hi]
 *
 * Vector -> scalar (handled in parse_factor when arg is $name):
 *   vsum($v)      sum of all elements
 *   vmean($v)     arithmetic mean
 *   vmedian($v)   median  (non-mutating)
 *   vstd($v)      population standard deviation
 *   vvar($v)      population variance
 *   vmin($v)      minimum element
 *   vmax($v)      maximum element
 *   vnorm($v)     L2 norm
 *   vlen($v)      element count
 *
 * Vector generators — return Matrix* (handled in parse_mat_primary):
 *   linspace(a,b,n)   n evenly-spaced values from a to b
 *   zeros(n)          n-element zero vector
 *   ones(n)           n-element ones vector
 *
 * Interpolation — scalar result (handled in parse_factor):
 *   interp($xv,$yv,x) linear interpolation of x into xv/yv
 *************************************************************/

/* vector -> scalar */
extern double  vf_sum    (const Matrix *v);
extern double  vf_mean   (const Matrix *v);
extern double  vf_median (const Matrix *v);
extern double  vf_var    (const Matrix *v);
extern double  vf_std    (const Matrix *v);
extern double  vf_min    (const Matrix *v);
extern double  vf_max    (const Matrix *v);
extern double  vf_norm   (const Matrix *v);

/* vector generators — caller owns the returned Matrix */
Matrix *vf_linspace(double a, double b, int n);
Matrix *vf_zeros   (int n);
Matrix *vf_ones    (int n);

/* interpolation */
extern double  vf_interp(const Matrix *xv, const Matrix *yv, double x);

#endif /* MATHFUNCS_H */
