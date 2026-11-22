#ifndef NS_CORE_H
#define NS_CORE_H

/*************************************************************
 * File:         ns_core.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Shared numerical pieces for parse's Navier-Stokes
 *               commands, so "navier" (lid-driven cavity), "channel"
 *               (flow past a cylinder) and "slittest" (slit wall) all
 *               run on one copy:
 *
 *                 ns_poisson()         Poisson equation on a grid that
 *                                      may contain walls and obstacles,
 *                                      by multigrid-preconditioned
 *                                      conjugate gradients
 *                 ns_vec_from_array()  wrap a C array as a parse
 *                                      column vector
 *
 *               Grid convention, same as the stored $navier_* and
 *               $channel_* fields: a Matrix with row = y index
 *               (from the bottom) and column = x index, so cell
 *               (i, j) is MAT(m, j, i).
 *************************************************************/

#include "matrix.h"

/* ── cell types for ns_poisson(), one byte per cell ── */
#define NS_CELL_FLUID  0   /* unknown: solved for                          */
#define NS_CELL_FIXED  1   /* known value (Dirichlet): held, used by
                              its neighbours                               */
#define NS_CELL_SOLID  2   /* wall / obstacle: ignored by its neighbours,
                              which gives a zero-gradient (Neumann) wall   */

/*************************************************************
 * Function:    ns_poisson
 * Input:       phi        (Matrix*)              — unknown, updated in place
 *                                                  (warm start = its contents)
 *              src        (const Matrix*)        — source term, same shape
 *              type       (const unsigned char*) — NS_CELL_* per cell,
 *                                                  index j * cols + i
 *              h          (double)               — grid spacing (square cells)
 *              max_iter   (int)                  — iteration ceiling
 *              tol        (double)               — stop when no cell moves
 *                                                  more than this in an
 *                                                  iteration
 * Output:      int — iterations used
 * Description: Solves  lap(phi) = -src  on the FLUID cells with the
 *              5-point Laplacian over the neighbours that are not
 *              SOLID.  FIXED cells keep their value and feed their
 *              neighbours; SOLID cells are left out, which makes them
 *              zero-gradient walls.  Every FLUID cell must be
 *              surrounded by cells of any type — the edge of the
 *              Matrix is never FLUID.  A FLUID cell walled in on all
 *              four sides is left alone.
 *
 *              Method: conjugate gradients, preconditioned with one
 *              multigrid V-cycle per iteration.  The coarse grids are
 *              built from the fine one (2 x 2 blocks of cells, the
 *              coupling between blocks added up), so obstacles of any
 *              shape carry through to every level.  The grid hierarchy
 *              is kept between calls and rebuilt only when the cell
 *              types change.
 *************************************************************/
int ns_poisson(Matrix *phi, const Matrix *src,
               const unsigned char *type, double h,
               int max_iter, double tol);

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
