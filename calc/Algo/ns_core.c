/* =============================================================================
 * File:         ns_core.c
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-19
 * Description:  Shared numerical pieces for the Navier-Stokes commands
 *               (navier.c, channel.c).  See ns_core.h.
 * ============================================================================= */

#include "ns_core.h"

/*************************************************************
 * Function:    ns_sor_poisson
 * Input:       see ns_core.h
 * Output:      int — sweeps used
 * Description: Each FLUID cell is replaced by the average of its
 *              non-SOLID neighbours plus the source term, then the
 *              change is overshot by omega.  The neighbours are
 *              added in the fixed order E, W, N, S so a grid with no
 *              SOLID cells reproduces the plain 5-point stencil
 *              exactly, bit for bit.
 **************************************************************/
int ns_sor_poisson(Matrix *phi, const Matrix *src,
                   const unsigned char *type, double h,
                   double omega, int max_sweeps, double tol)
{
    int    cols = phi->cols;
    int    rows = phi->rows;
    int    sweep;
    int    i;
    int    j;
    int    k;
    int    count;
    double h2 = h * h;
    double sum;
    double gsValue;
    double change;
    double maxChange;

    for (sweep = 1; sweep <= max_sweeps; sweep++)
    {
        maxChange = 0.0;

        for (j = 1; j < rows - 1; j++)
        {
            for (i = 1; i < cols - 1; i++)
            {
                k = j * cols + i;
                if (type[k] != NS_CELL_FLUID) continue;

                /* ── neighbours that are not walls, in E W N S order ── */
                sum   = 0.0;
                count = 0;
                if (type[k + 1]    != NS_CELL_SOLID) { sum += MAT(phi, j, i + 1); count++; }
                if (type[k - 1]    != NS_CELL_SOLID) { sum += MAT(phi, j, i - 1); count++; }
                if (type[k + cols] != NS_CELL_SOLID) { sum += MAT(phi, j + 1, i); count++; }
                if (type[k - cols] != NS_CELL_SOLID) { sum += MAT(phi, j - 1, i); count++; }

                /* a fluid cell walled in on all four sides has nothing to
                   average.  Physics says it can't exist; geometry says
                   never say never */
                if (count == 0) continue;

                /* ── Gauss-Seidel value, then overshoot it by omega ── */
                gsValue        = (sum + h2 * MAT(src, j, i)) / count;
                change         = omega * (gsValue - MAT(phi, j, i));
                MAT(phi, j, i) += change;

                if (fabs(change) > maxChange) maxChange = fabs(change);
            }
        }

        if (maxChange < tol) break;
    }

    return sweep;
}

/*************************************************************
 * Function:    ns_vec_from_array
 * Input:       src (const double*) — values to copy
 *              n   (int)           — element count
 * Output:      Matrix* — new n x 1 column vector (caller owns it)
 * Description: Allocates through mat_new() so the result is freed
 *              like any other parse matrix.
 **************************************************************/
Matrix *ns_vec_from_array(const double *src, int n)
{
    Matrix *vec = mat_new(n, 1);

    memcpy(vec->data, src, n * sizeof(double));
    return vec;
}
