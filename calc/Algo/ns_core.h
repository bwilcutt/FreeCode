#ifndef NS_CORE_H
#define NS_CORE_H

/*************************************************************
 * File:         ns_core.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Shared numerical pieces for parse's Navier-Stokes
 *               commands, so "navier" (lid-driven cavity) and
 *               "channel" (flow past a cylinder) run on one copy:
 *
 *                 ns_sor_poisson()     Poisson equation by SOR on a
 *                                      grid that may contain walls
 *                                      and obstacles
 *                 ns_vec_from_array()  wrap a C array as a parse
 *                                      column vector
 *
 *               Grid convention, same as the stored $navier_* and
 *               $channel_* fields: a Matrix with row = y index
 *               (from the bottom) and column = x index, so cell
 *               (i, j) is MAT(m, j, i).
 *************************************************************/

#include "matrix.h"

/* ── cell types for ns_sor_poisson(), one byte per cell ── */
#define NS_CELL_FLUID  0   /* unknown: solved for                          */
#define NS_CELL_FIXED  1   /* known value (Dirichlet): held, used by
                              its neighbours                               */
#define NS_CELL_SOLID  2   /* wall / obstacle: ignored by its neighbours,
                              which gives a zero-gradient (Neumann) wall   */

/*************************************************************
 * Function:    ns_sor_poisson
 * Input:       phi        (Matrix*)              — unknown, updated in place
 *                                                  (warm start = its contents)
 *              src        (const Matrix*)        — source term, same shape
 *              type       (const unsigned char*) — NS_CELL_* per cell,
 *                                                  index j * cols + i
 *              h          (double)               — grid spacing (square cells)
 *              omega      (double)               — over-relaxation, 1 < omega < 2
 *              max_sweeps (int)                  — sweep ceiling
 *              tol        (double)               — stop when no cell moves
 *                                                  more than this in a sweep
 * Output:      int — sweeps used
 * Description: Solves  lap(phi) = -src  on the FLUID cells by
 *              Gauss-Seidel with over-relaxation, using the
 *              5-point Laplacian over the neighbours that are not
 *              SOLID.  Every FLUID cell must be surrounded by
 *              cells of any type — the edge of the Matrix is never
 *              FLUID — so no bounds checks are needed inside.
 *************************************************************/
int ns_sor_poisson(Matrix *phi, const Matrix *src,
                   const unsigned char *type, double h,
                   double omega, int max_sweeps, double tol);

/*************************************************************
 * Function:    ns_vec_from_array
 * Input:       src (const double*) — values to copy
 *              n   (int)           — element count
 * Output:      Matrix* — new n x 1 column vector (caller owns it)
 * Description: Wraps a plain C array as a parse column vector so it
 *              can be handed to set_mat_var() or vf_interp().
 *************************************************************/
Matrix *ns_vec_from_array(const double *src, int n);

#endif /* NS_CORE_H */
