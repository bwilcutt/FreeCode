#ifndef SCHRODINGER_H
#define SCHRODINGER_H

/*************************************************************
 * File:         schrodinger.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-20
 * Description:  1D time-independent Schrodinger equation command for
 *               Mathrix.
 *
 * Provides run_schrodinger(), dispatched from main() when the user
 * types (parameters separated by COMMAS, so a formula may contain
 * spaces; commas inside parentheses belong to the formula):
 *
 *   schrodinger V=<preset or formula in $x>, [xmin=<>], [xmax=<>],
 *               [n=<states>], [N=<grid>], [m=<mass>], [units=au|ev],
 *               [V0=<>], [a=<>], [k=<>]
 *   schrodinger ?           usage
 *
 * Presets (V0, a and k set their shape):
 *   well      infinite square well — the box walls at xmin and xmax
 *   harmonic  V = 0.5*k*x^2
 *   finite    finite square well, depth V0, width a, centred on 0
 *   barrier   square barrier, height V0, width a, inside the box
 *   double    double well, V = V0*((x/a)^2 - 1)^2, minima at +-a
 * Anything else after V= is a formula in $x, e.g.
 *   schrodinger V=0.5*$x^2 + 0.1*pow($x,4), xmin=-6, xmax=6, n=8
 *
 * Finds the lowest n energy levels and wavefunctions of
 *   -(hbar^2 / 2m) psi'' + V(x) psi = E psi,   psi(xmin) = psi(xmax) = 0
 * by finite differences on a uniform grid: the matrix is symmetric
 * tridiagonal, so the energies come from mat_eig_tridiag() and the
 * wavefunctions from inverse iteration.
 *
 * Units:
 *   au (default)  hbar = 1, m in units where hbar^2/2m = 1/(2m)
 *   ev            x in nm, V and E in eV, m in electron masses
 *
 * Stored scalar variables:
 *   $schrod_n       number of states found
 *   $schrod_N       grid points
 *   $schrod_E0      ground-state energy
 *   $schrod_nbound  states held by the potential itself (the rest exist
 *                   only because of the box walls; -1 when the box is
 *                   the whole point, as in "well" and "barrier")
 *   $schrod_err     largest relative difference from the exact energies
 *                   ("well" and "harmonic" only, -1 otherwise)
 *   $schrod_ev      1 = units=ev (nm, eV), 0 = atomic units
 *
 * Stored vectors / fields:
 *   $schrod_E     [n x 1]  energies, lowest first
 *   $schrod_x     [N x 1]  grid positions
 *   $schrod_V     [N x 1]  potential at each grid position
 *   $schrod_psi   [N x n]  wavefunctions, column k = state k,
 *                          normalised so the integral of psi^2 dx = 1
 *   $schrod_prob  [N x n]  probability density psi^2
 *************************************************************/

#include "parse.h"

void run_schrodinger(const char *args);

#endif /* SCHRODINGER_H */
