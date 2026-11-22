/******************************************************************************************************
 * Program      : cparse
 * By           : Bryan Wilcutt
 * Date         : 10/20/1998
 * Description  : This is the matrix processing portion of cparse.
 * ****************************************************************************************************/
#include "matrix.h"
 
/*************************************************************
 * Function:    mat_new
 * Input:       rowCount (int) — number of rows in the matrix
 *              colCount (int) — number of columns in the matrix
 * Output:      Matrix*        — pointer to a newly allocated, zero-initialised matrix
 * Description: Allocates a Matrix struct and a contiguous data buffer on the heap.
 *              All elements are initialised to zero via calloc.
 *              The caller is responsible for freeing the matrix with mat_free().
 **************************************************************/
Matrix *mat_new(int rowCount, int colCount)
{
    Matrix *newMatrix = malloc(sizeof(Matrix));
    newMatrix->rows = rowCount;
    newMatrix->cols = colCount;
    newMatrix->data = calloc(rowCount * colCount, sizeof(double));
    return newMatrix;
}
 
/*************************************************************
 * Function:    mat_free
 * Input:       matrix (Matrix*) — pointer to the matrix to free; safe to pass NULL
 * Output:      void
 * Description: Releases the data buffer and the Matrix struct itself.
 *              Guards against NULL so callers do not need to check before calling.
 **************************************************************/
void mat_free(Matrix *matrix)
{
    if (!matrix) return;
    free(matrix->data);
    free(matrix);
}
 
/*************************************************************
 * Function:    mat_copy
 * Input:       srcMatrix (const Matrix*) — the matrix to duplicate
 * Output:      Matrix*                   — an independent deep copy of srcMatrix
 * Description: Allocates a new matrix with the same dimensions as srcMatrix and
 *              copies all element data with memcpy.
 *              The original and the copy share no memory; either may be freed
 *              independently.
 **************************************************************/
Matrix *mat_copy(const Matrix *srcMatrix)
{
    Matrix *newMatrix = mat_new(srcMatrix->rows, srcMatrix->cols);
    memcpy(newMatrix->data, srcMatrix->data,
           srcMatrix->rows * srcMatrix->cols * sizeof(double));
    return newMatrix;
}
 
/*************************************************************
 * Function:    mat_print
 * Input:       matrix (const Matrix*) — the matrix to display
 *              label  (const char*)   — optional variable name; pass NULL to omit
 * Output:      void   — output is written to stdout
 * Description: Prints each row of the matrix in bracketed, column-aligned form.
 *              When label is non-NULL, a "$label =" heading is printed first,
 *              matching the shell's variable-display convention.
 **************************************************************/
void mat_print(const Matrix *matrix, const char *label)
{
    if (label) printf("$%s =\n", label);
    for (int rowIdx = 0; rowIdx < matrix->rows; rowIdx++)
    {
        printf("  [");
        for (int colIdx = 0; colIdx < matrix->cols; colIdx++)
            printf(" %10.4g", MAT(matrix, rowIdx, colIdx));
        printf(" ]\n");
    }
}
 
/*************************************************************
 * Function:    mat_add
 * Input:       leftMatrix  (const Matrix*) — left operand
 *              rightMatrix (const Matrix*) — right operand; must match leftMatrix's dimensions
 * Output:      Matrix*                     — element-wise sum, or NULL on dimension mismatch
 * Description: Adds corresponding elements of two matrices and returns the result
 *              in a newly allocated matrix.
 *              Prints an error and returns NULL if the row or column counts differ.
 **************************************************************/
Matrix *mat_add(const Matrix *leftMatrix, const Matrix *rightMatrix)
{
    if (leftMatrix->rows != rightMatrix->rows ||
        leftMatrix->cols != rightMatrix->cols)
    {
        printf("add: dimension mismatch (%dx%d vs %dx%d)\n",
               leftMatrix->rows, leftMatrix->cols,
               rightMatrix->rows, rightMatrix->cols);
        return NULL;
    }
    Matrix *resultMatrix = mat_new(leftMatrix->rows, leftMatrix->cols);
    for (int elemIdx = 0; elemIdx < leftMatrix->rows * leftMatrix->cols; elemIdx++)
        resultMatrix->data[elemIdx] = leftMatrix->data[elemIdx] + rightMatrix->data[elemIdx];
    return resultMatrix;
}
 
/*************************************************************
 * Function:    mat_sub
 * Input:       leftMatrix  (const Matrix*) — left operand (minuend)
 *              rightMatrix (const Matrix*) — right operand (subtrahend); must match leftMatrix's dimensions
 * Output:      Matrix*                     — element-wise difference, or NULL on dimension mismatch
 * Description: Subtracts each element of rightMatrix from the corresponding element of leftMatrix
 *              and returns the result in a newly allocated matrix.
 *              Prints an error and returns NULL if the row or column counts differ.
 **************************************************************/
Matrix *mat_sub(const Matrix *leftMatrix, const Matrix *rightMatrix)
{
    if (leftMatrix->rows != rightMatrix->rows ||
        leftMatrix->cols != rightMatrix->cols)
    {
        printf("sub: dimension mismatch (%dx%d vs %dx%d)\n",
               leftMatrix->rows, leftMatrix->cols,
               rightMatrix->rows, rightMatrix->cols);
        return NULL;
    }
    Matrix *resultMatrix = mat_new(leftMatrix->rows, leftMatrix->cols);
    for (int elemIdx = 0; elemIdx < leftMatrix->rows * leftMatrix->cols; elemIdx++)
        resultMatrix->data[elemIdx] = leftMatrix->data[elemIdx] - rightMatrix->data[elemIdx];
    return resultMatrix;
}
 
/*************************************************************
 * Function:    mat_mul
 * Input:       leftMatrix  (const Matrix*) — left operand  (m x k)
 *              rightMatrix (const Matrix*) — right operand (k x n); leftMatrix->cols must equal rightMatrix->rows
 * Output:      Matrix*                     — matrix product (m x n), or NULL on dimension mismatch
 * Description: Performs standard matrix multiplication using the inner-product
 *              (dot-product) method.
 *              Each output element (rowIdx, colIdx) is the dot product of row rowIdx
 *              of leftMatrix with column colIdx of rightMatrix.
 *              Prints an error and returns NULL if the inner dimensions do not match.
 **************************************************************/
Matrix *mat_mul(const Matrix *leftMatrix, const Matrix *rightMatrix)
{
    if (leftMatrix->cols != rightMatrix->rows)
    {
        printf("mul: inner dimensions must match (%dx%d * %dx%d)\n",
               leftMatrix->rows, leftMatrix->cols,
               rightMatrix->rows, rightMatrix->cols);
        return NULL;
    }
    Matrix *resultMatrix = mat_new(leftMatrix->rows, rightMatrix->cols);
    for (int rowIdx = 0; rowIdx < leftMatrix->rows; rowIdx++)
        for (int colIdx = 0; colIdx < rightMatrix->cols; colIdx++)
            for (int innerIdx = 0; innerIdx < leftMatrix->cols; innerIdx++)
                MAT(resultMatrix, rowIdx, colIdx) +=
                    MAT(leftMatrix, rowIdx, innerIdx) * MAT(rightMatrix, innerIdx, colIdx);
    return resultMatrix;
}
 
/*************************************************************
 * Function:    mat_scale
 * Input:       srcMatrix (const Matrix*) — the matrix whose elements are to be scaled
 *              scalar    (double)        — the scalar multiplier
 * Output:      Matrix*                   — a new matrix with every element of srcMatrix multiplied by scalar
 * Description: Creates a deep copy of srcMatrix and multiplies every element by scalar.
 *              The original matrix is not modified.
 *              Useful for scalar-matrix multiplication and sign inversion (scalar = -1).
 **************************************************************/
Matrix *mat_scale(const Matrix *srcMatrix, double scalar)
{
    Matrix *resultMatrix = mat_copy(srcMatrix);
    for (int elemIdx = 0; elemIdx < resultMatrix->rows * resultMatrix->cols; elemIdx++)
        resultMatrix->data[elemIdx] *= scalar;
    return resultMatrix;
}
 
/*************************************************************
 * Function:    mat_transpose
 * Input:       srcMatrix (const Matrix*) — the matrix to transpose (m x n)
 * Output:      Matrix*                   — the transpose of srcMatrix (n x m)
 * Description: Allocates a new matrix with rows and columns swapped relative to srcMatrix.
 *              Element (rowIdx, colIdx) of srcMatrix becomes element (colIdx, rowIdx) of the result.
 *              The original matrix is not modified.
 **************************************************************/
Matrix *mat_transpose(const Matrix *srcMatrix)
{
    Matrix *resultMatrix = mat_new(srcMatrix->cols, srcMatrix->rows);
    for (int rowIdx = 0; rowIdx < srcMatrix->rows; rowIdx++)
        for (int colIdx = 0; colIdx < srcMatrix->cols; colIdx++)
            MAT(resultMatrix, colIdx, rowIdx) = MAT(srcMatrix, rowIdx, colIdx);
    return resultMatrix;
}
 
/*************************************************************
 * Function:    mat_det
 * Input:       srcMatrix (const Matrix*) — a square matrix whose determinant is to be computed
 * Output:      double                    — the determinant of srcMatrix, or 0 if singular or non-square
 * Description: Computes the determinant using Gaussian elimination with partial pivoting
 *              on a scratch copy of the matrix, leaving the original unchanged.
 *              Each row swap negates the running determinant; the final value is the
 *              product of the pivot diagonal of the resulting upper-triangular matrix.
 *              Returns 0 and prints an error if the matrix is non-square or singular.
 **************************************************************/
double mat_det(const Matrix *srcMatrix)
{
    if (srcMatrix->rows != srcMatrix->cols)
    {
        printf("det: matrix must be square (got %dx%d)\n",
               srcMatrix->rows, srcMatrix->cols);
        return 0;
    }
    int matSize = srcMatrix->rows;
    double *luData = malloc(matSize * matSize * sizeof(double));
    memcpy(luData, srcMatrix->data, matSize * matSize * sizeof(double));
 
#define LU(rowIdx, colIdx) luData[(rowIdx) * matSize + (colIdx)]
 
    double determinant = 1.0;
    for (int colIdx = 0; colIdx < matSize; colIdx++)
    {
        int pivotRow = colIdx;
        for (int rowIdx = colIdx + 1; rowIdx < matSize; rowIdx++)
            if (fabs(LU(rowIdx, colIdx)) > fabs(LU(pivotRow, colIdx)))
                pivotRow = rowIdx;
        if (pivotRow != colIdx)
        {
            for (int elemIdx = 0; elemIdx < matSize; elemIdx++)
            {
                double tempVal        = LU(colIdx,   elemIdx);
                LU(colIdx,   elemIdx) = LU(pivotRow, elemIdx);
                LU(pivotRow, elemIdx) = tempVal;
            }
            determinant = -determinant;
        }
        if (fabs(LU(colIdx, colIdx)) < 1e-12) { free(luData); return 0.0; }
        determinant *= LU(colIdx, colIdx);
        for (int rowIdx = colIdx + 1; rowIdx < matSize; rowIdx++)
        {
            double rowFactor = LU(rowIdx, colIdx) / LU(colIdx, colIdx);
            for (int elemIdx = colIdx; elemIdx < matSize; elemIdx++)
                LU(rowIdx, elemIdx) -= rowFactor * LU(colIdx, elemIdx);
        }
    }
    free(luData);
 
#undef LU
 
    return determinant;
}
 
/*************************************************************
 * Function:    mat_inv
 * Input:       srcMatrix (const Matrix*) — a square, non-singular matrix to invert
 * Output:      Matrix*                   — the inverse of srcMatrix, or NULL if singular or non-square
 * Description: Computes the matrix inverse using Gauss-Jordan elimination on the
 *              augmented matrix [A | I], reducing the left half to the identity.
 *              Partial pivoting is used for numerical stability.
 *              The right half of the augmented matrix after elimination is A^-1.
 *              Returns NULL and prints an error if the matrix is non-square or singular.
 **************************************************************/
Matrix *mat_inv(const Matrix *srcMatrix)
{
    if (srcMatrix->rows != srcMatrix->cols)
    {
        printf("inv: matrix must be square (got %dx%d)\n",
               srcMatrix->rows, srcMatrix->cols);
        return NULL;
    }
    int matSize = srcMatrix->rows;
    double *augData = malloc(matSize * 2 * matSize * sizeof(double));
 
#define AUG(rowIdx, colIdx) augData[(rowIdx) * (2 * matSize) + (colIdx)]
 
    for (int rowIdx = 0; rowIdx < matSize; rowIdx++)
        for (int colIdx = 0; colIdx < matSize; colIdx++)
        {
            AUG(rowIdx, colIdx)           = MAT(srcMatrix, rowIdx, colIdx);
            AUG(rowIdx, colIdx + matSize) = (rowIdx == colIdx) ? 1.0 : 0.0;
        }
    for (int colIdx = 0; colIdx < matSize; colIdx++)
    {
        int pivotRow = colIdx;
        for (int rowIdx = colIdx + 1; rowIdx < matSize; rowIdx++)
            if (fabs(AUG(rowIdx, colIdx)) > fabs(AUG(pivotRow, colIdx)))
                pivotRow = rowIdx;
        if (pivotRow != colIdx)
            for (int elemIdx = 0; elemIdx < 2 * matSize; elemIdx++)
            {
                double tempVal         = AUG(colIdx,   elemIdx);
                AUG(colIdx,   elemIdx) = AUG(pivotRow, elemIdx);
                AUG(pivotRow, elemIdx) = tempVal;
            }
        if (fabs(AUG(colIdx, colIdx)) < 1e-12)
        {
            printf("inv: matrix is singular\n");
            free(augData);
            return NULL;
        }
        double pivotVal = AUG(colIdx, colIdx);
        for (int elemIdx = 0; elemIdx < 2 * matSize; elemIdx++)
            AUG(colIdx, elemIdx) /= pivotVal;
        for (int rowIdx = 0; rowIdx < matSize; rowIdx++)
        {
            if (rowIdx == colIdx) continue;
            double rowFactor = AUG(rowIdx, colIdx);
            for (int elemIdx = 0; elemIdx < 2 * matSize; elemIdx++)
                AUG(rowIdx, elemIdx) -= rowFactor * AUG(colIdx, elemIdx);
        }
    }
    Matrix *inverseMatrix = mat_new(matSize, matSize);
    for (int rowIdx = 0; rowIdx < matSize; rowIdx++)
        for (int colIdx = 0; colIdx < matSize; colIdx++)
            MAT(inverseMatrix, rowIdx, colIdx) = AUG(rowIdx, colIdx + matSize);
    free(augData);
 
#undef AUG
 
    return inverseMatrix;
}
 
/* ═══════════════════════════════════════════════════════════
   MATRIX VARIABLE STORE
   ═══════════════════════════════════════════════════════════ */
MatVar *mat_vars = NULL;
 
/*************************************************************
 * Function:    is_mat_var
 * Input:       name (const char*) — the variable name to look up (null-terminated)
 * Output:      int  — 1 if name is a known matrix variable, 0 otherwise
 * Description: Performs a linear search through the matrix variable store.
 *              Used by the parser to decide whether a $name token refers to a
 *              matrix rather than a scalar, so the correct parse path is taken.
 **************************************************************/
int is_mat_var(const char *name)
{
    for (MatVar *varNode = mat_vars; varNode; varNode = varNode->next)
        if (strcmp(varNode->name, name) == 0) return 1;
    return 0;
}
 
/*************************************************************
 * Function:    set_mat_var
 * Input:       name   (const char*) — the variable name to create or overwrite
 *              matrix (Matrix*)     — the matrix to store; ownership is transferred
 * Output:      void
 * Description: Stores matrix under name in the matrix variable linked list.
 *              If a variable with that name already exists its previous matrix is
 *              freed before the new one is installed, preventing memory leaks.
 *              The caller must not free matrix after this call; the store owns it.
 **************************************************************/
void set_mat_var(const char *name, Matrix *matrix)
{
    for (MatVar *varNode = mat_vars; varNode; varNode = varNode->next)
    {
        if (strcmp(varNode->name, name) == 0)
        {
            mat_free(varNode->mat);
            varNode->mat = matrix;
            return;
        }
    }
    MatVar *varNode = malloc(sizeof(MatVar));
    strncpy(varNode->name, name, 31);
    varNode->name[31] = '\0';
    varNode->mat      = matrix;
    varNode->next     = mat_vars;
    mat_vars          = varNode;
}
 
/*************************************************************
 * Function:    get_mat_var
 * Input:       name (const char*) — the variable name to look up (null-terminated)
 * Output:      Matrix*            — pointer to the stored matrix, or NULL if not found
 * Description: Returns the matrix pointer held by the variable store directly —
 *              not a copy.
 *              The caller must not free the returned pointer; the store retains
 *              ownership. Use mat_copy() if an independent copy is needed.
 **************************************************************/
Matrix *get_mat_var(const char *name)
{
    for (MatVar *varNode = mat_vars; varNode; varNode = varNode->next)
        if (strcmp(varNode->name, name) == 0) return varNode->mat;
    return NULL;
}
 
/* ═══════════════════════════════════════════════════════════
   EIGEN DECOMPOSITION — SYMMETRIC MATRICES
   Method: Householder reduction to tridiagonal form, then the
   implicit-shift QL algorithm (after the public-domain EISPACK
   tred2/tql2 routines). Real symmetric matrices only — which is
   every Hamiltonian worth its salt, and most stiffness matrices.
   ═══════════════════════════════════════════════════════════ */

/* Largest number of QL sweeps allowed on any one eigenvalue before we
   admit defeat. Well-behaved matrices converge in two or three. */
#define EIG_MAX_ITER 60

/*************************************************************
 * Function:    eig_tred2
 * Input:       matSize (int)     — order of the matrix
 *              vecData (double*) — matSize x matSize row-major; on entry the
 *                                  symmetric matrix, on exit the orthogonal
 *                                  transform Q that tridiagonalised it
 *              diag    (double*) — out: matSize diagonal entries
 *              offDiag (double*) — out: matSize sub-diagonal entries, with
 *                                  offDiag[i] coupling rows i-1 and i
 *                                  (offDiag[0] is unused and set to 0)
 * Output:      void
 * Description: Householder reduction of a real symmetric matrix to symmetric
 *              tridiagonal form, accumulating the transformations so the
 *              eigenvectors of the original matrix can be recovered later.
 **************************************************************/
static void eig_tred2(int matSize, double *vecData, double *diag, double *offDiag)
{
#define V(r, c) vecData[(r) * matSize + (c)]

    /* Start with the last row as the working vector. */
    for (int colIdx = 0; colIdx < matSize; colIdx++)
        diag[colIdx] = V(matSize - 1, colIdx);

    /* Work upward one row at a time, zeroing everything left of the
       sub-diagonal with a Householder reflection. */
    for (int rowIdx = matSize - 1; rowIdx > 0; rowIdx--)
    {
        double scale = 0.0, hVal = 0.0;
        for (int k = 0; k < rowIdx; k++)
            scale += fabs(diag[k]);

        if (scale == 0.0)
        {
            /* Row is already zero to the left — nothing to reflect. */
            offDiag[rowIdx] = diag[rowIdx - 1];
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
            {
                diag[colIdx]      = V(rowIdx - 1, colIdx);
                V(rowIdx, colIdx) = 0.0;
                V(colIdx, rowIdx) = 0.0;
            }
        }
        else
        {
            /* Scale the row to dodge overflow, then build the Householder vector. */
            for (int k = 0; k < rowIdx; k++)
            {
                diag[k] /= scale;
                hVal    += diag[k] * diag[k];
            }
            double fVal = diag[rowIdx - 1];
            double gVal = sqrt(hVal);
            if (fVal > 0) gVal = -gVal;
            offDiag[rowIdx]  = scale * gVal;
            hVal            -= fVal * gVal;
            diag[rowIdx - 1] = fVal - gVal;
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
                offDiag[colIdx] = 0.0;

            /* Apply the similarity transform to the remaining sub-matrix. */
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
            {
                fVal              = diag[colIdx];
                V(colIdx, rowIdx) = fVal;
                gVal              = offDiag[colIdx] + V(colIdx, colIdx) * fVal;
                for (int k = colIdx + 1; k <= rowIdx - 1; k++)
                {
                    gVal       += V(k, colIdx) * diag[k];
                    offDiag[k] += V(k, colIdx) * fVal;
                }
                offDiag[colIdx] = gVal;
            }
            fVal = 0.0;
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
            {
                offDiag[colIdx] /= hVal;
                fVal            += offDiag[colIdx] * diag[colIdx];
            }
            double hhVal = fVal / (hVal + hVal);
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
                offDiag[colIdx] -= hhVal * diag[colIdx];
            for (int colIdx = 0; colIdx < rowIdx; colIdx++)
            {
                fVal = diag[colIdx];
                gVal = offDiag[colIdx];
                for (int k = colIdx; k <= rowIdx - 1; k++)
                    V(k, colIdx) -= (fVal * offDiag[k] + gVal * diag[k]);
                diag[colIdx]      = V(rowIdx - 1, colIdx);
                V(rowIdx, colIdx) = 0.0;
            }
        }
        diag[rowIdx] = hVal;
    }

    /* Accumulate the reflections into Q, from the top-left outward. */
    for (int rowIdx = 0; rowIdx < matSize - 1; rowIdx++)
    {
        V(matSize - 1, rowIdx) = V(rowIdx, rowIdx);
        V(rowIdx, rowIdx)      = 1.0;
        double hVal = diag[rowIdx + 1];
        if (hVal != 0.0)
        {
            for (int k = 0; k <= rowIdx; k++)
                diag[k] = V(k, rowIdx + 1) / hVal;
            for (int colIdx = 0; colIdx <= rowIdx; colIdx++)
            {
                double gVal = 0.0;
                for (int k = 0; k <= rowIdx; k++)
                    gVal += V(k, rowIdx + 1) * V(k, colIdx);
                for (int k = 0; k <= rowIdx; k++)
                    V(k, colIdx) -= gVal * diag[k];
            }
        }
        for (int k = 0; k <= rowIdx; k++)
            V(k, rowIdx + 1) = 0.0;
    }

    /* The bottom row of V was being used as scratch; recover the diagonal
       from it and finish Q off with a 1 in the corner. */
    for (int colIdx = 0; colIdx < matSize; colIdx++)
    {
        diag[colIdx]           = V(matSize - 1, colIdx);
        V(matSize - 1, colIdx) = 0.0;
    }
    V(matSize - 1, matSize - 1) = 1.0;
    offDiag[0] = 0.0;

#undef V
}

/*************************************************************
 * Function:    eig_tql2
 * Input:       matSize (int)     — order of the tridiagonal matrix
 *              diag    (double*) — in: diagonal; out: eigenvalues (unsorted)
 *              offDiag (double*) — in: sub-diagonal, offDiag[i] couples rows
 *                                  i-1 and i (offDiag[0] ignored); destroyed
 *              vecData (double*) — matSize x matSize row-major transform to
 *                                  rotate into eigenvectors (identity for a
 *                                  bare tridiagonal matrix, Q from eig_tred2
 *                                  for a full one); NULL = eigenvalues only
 * Output:      int — 0 on success, -1 if an eigenvalue failed to converge
 * Description: Implicit-shift QL iteration on a symmetric tridiagonal matrix.
 *              Each eigenvalue is chased down by plane rotations until its
 *              off-diagonal neighbour is negligible. When vecData is given,
 *              every rotation is also applied to it, so its columns end up
 *              as the eigenvectors.
 **************************************************************/
static int eig_tql2(int matSize, double *diag, double *offDiag, double *vecData)
{
#define V(r, c) vecData[(r) * matSize + (c)]

    /* Shift the sub-diagonal down one slot so offDiag[i] couples i and i+1. */
    for (int i = 1; i < matSize; i++)
        offDiag[i - 1] = offDiag[i];
    offDiag[matSize - 1] = 0.0;

    double shiftTotal = 0.0;   /* running sum of the shifts applied */
    double normEst    = 0.0;   /* rough matrix norm, for the "negligible" test */
    const double eps  = 2.220446049250313e-16;

    for (int lowIdx = 0; lowIdx < matSize; lowIdx++)
    {
        /* Find the first small sub-diagonal element at or below lowIdx —
           that splits the matrix and bounds the block we must iterate on. */
        double localNorm = fabs(diag[lowIdx]) + fabs(offDiag[lowIdx]);
        if (localNorm > normEst) normEst = localNorm;
        int splitIdx = lowIdx;
        while (splitIdx < matSize)
        {
            if (fabs(offDiag[splitIdx]) <= eps * normEst) break;
            splitIdx++;
        }

        /* If lowIdx is not already isolated, iterate until it is. */
        if (splitIdx > lowIdx)
        {
            int iterCount = 0;
            do
            {
                if (++iterCount > EIG_MAX_ITER)
                    return -1;   /* Should never happen. Famous last words. */

                /* Wilkinson-style shift from the leading 2x2 block. */
                double gVal = diag[lowIdx];
                double pVal = (diag[lowIdx + 1] - gVal) / (2.0 * offDiag[lowIdx]);
                double rVal = hypot(pVal, 1.0);
                if (pVal < 0) rVal = -rVal;
                diag[lowIdx]     = offDiag[lowIdx] / (pVal + rVal);
                diag[lowIdx + 1] = offDiag[lowIdx] * (pVal + rVal);
                double dNext     = diag[lowIdx + 1];
                double hVal      = gVal - diag[lowIdx];
                for (int i = lowIdx + 2; i < matSize; i++)
                    diag[i] -= hVal;
                shiftTotal += hVal;

                /* Chase the bulge from the bottom of the block back up to lowIdx. */
                pVal = diag[splitIdx];
                double cVal = 1.0, c2Val = 1.0, c3Val = 1.0;
                double eNext = offDiag[lowIdx + 1];
                double sVal = 0.0, s2Val = 0.0;
                for (int i = splitIdx - 1; i >= lowIdx; i--)
                {
                    c3Val = c2Val;
                    c2Val = cVal;
                    s2Val = sVal;
                    gVal  = cVal * offDiag[i];
                    hVal  = cVal * pVal;
                    rVal  = hypot(pVal, offDiag[i]);
                    offDiag[i + 1] = sVal * rVal;
                    sVal  = offDiag[i] / rVal;
                    cVal  = pVal / rVal;
                    pVal  = cVal * diag[i] - sVal * gVal;
                    diag[i + 1] = hVal + sVal * (cVal * gVal + sVal * diag[i]);

                    /* Carry the same rotation into the eigenvector matrix. */
                    if (vecData)
                        for (int k = 0; k < matSize; k++)
                        {
                            hVal         = V(k, i + 1);
                            V(k, i + 1)  = sVal * V(k, i) + cVal * hVal;
                            V(k, i)      = cVal * V(k, i) - sVal * hVal;
                        }
                }
                pVal = -sVal * s2Val * c3Val * eNext * offDiag[lowIdx] / dNext;
                offDiag[lowIdx] = sVal * pVal;
                diag[lowIdx]    = cVal * pVal;

            } while (fabs(offDiag[lowIdx]) > eps * normEst);
        }
        diag[lowIdx]   += shiftTotal;
        offDiag[lowIdx] = 0.0;
    }
    return 0;

#undef V
}

/*************************************************************
 * Function:    eig_pack_results
 * Input:       matSize    (int)       — number of eigenpairs
 *              evals      (double*)   — eigenvalues (unsorted)
 *              vecData    (double*)   — row-major eigenvectors by column, or NULL
 *              outValues  (Matrix**)  — out: n x 1 column, ascending order
 *              outVectors (Matrix**)  — out: n x n eigenvectors, or NULL to skip
 * Output:      void
 * Description: Sorts the eigenpairs into ascending eigenvalue order (ground
 *              state first, as physicists expect) and copies them into new
 *              Matrix objects. Each eigenvector's sign is fixed so that its
 *              largest-magnitude component is positive; the maths does not
 *              care, but plots that flip upside down between runs annoy people.
 **************************************************************/
static void eig_pack_results(int matSize, double *evals, double *vecData,
                             Matrix **outValues, Matrix **outVectors)
{
    /* Selection sort — n is modest and it moves each column only once. */
    for (int i = 0; i < matSize - 1; i++)
    {
        int minIdx = i;
        for (int j = i + 1; j < matSize; j++)
            if (evals[j] < evals[minIdx]) minIdx = j;
        if (minIdx == i) continue;

        double tmp = evals[i]; evals[i] = evals[minIdx]; evals[minIdx] = tmp;
        if (vecData)
            for (int k = 0; k < matSize; k++)
            {
                tmp = vecData[k * matSize + i];
                vecData[k * matSize + i]      = vecData[k * matSize + minIdx];
                vecData[k * matSize + minIdx] = tmp;
            }
    }

    /* Eigenvalues out as a column vector. */
    *outValues = mat_new(matSize, 1);
    for (int i = 0; i < matSize; i++)
        MAT(*outValues, i, 0) = evals[i];

    if (!outVectors || !vecData) return;

    /* Eigenvectors out, with the sign convention applied per column. */
    *outVectors = mat_new(matSize, matSize);
    for (int colIdx = 0; colIdx < matSize; colIdx++)
    {
        int bigIdx = 0;
        for (int k = 1; k < matSize; k++)
            if (fabs(vecData[k * matSize + colIdx]) > fabs(vecData[bigIdx * matSize + colIdx]))
                bigIdx = k;
        double sign = (vecData[bigIdx * matSize + colIdx] < 0) ? -1.0 : 1.0;
        for (int k = 0; k < matSize; k++)
            MAT(*outVectors, k, colIdx) = sign * vecData[k * matSize + colIdx];
    }
}

/*************************************************************
 * Function:    mat_eig_sym
 * Input:       srcMatrix  (const Matrix*) — real symmetric square matrix
 *              outValues  (Matrix**)      — out: n x 1 eigenvalues, ascending
 *              outVectors (Matrix**)      — out: n x n eigenvectors (column k
 *                                           belongs to eigenvalue k); pass
 *                                           NULL if only eigenvalues are wanted
 * Output:      int — 0 on success, -1 on error (message printed)
 * Description: Full eigen decomposition of a real symmetric matrix.
 *              The matrix is reduced to tridiagonal form by Householder
 *              reflections, then solved by implicit-shift QL. The original
 *              matrix is not modified. Caller frees the returned matrices
 *              with mat_free().
 **************************************************************/
int mat_eig_sym(const Matrix *srcMatrix, Matrix **outValues, Matrix **outVectors)
{
    if (srcMatrix->rows != srcMatrix->cols)
    {
        printf("eig: matrix must be square (got %dx%d)\n",
               srcMatrix->rows, srcMatrix->cols);
        return -1;
    }
    int matSize = srcMatrix->rows;
    if (matSize < 1)
    {
        printf("eig: matrix is empty\n");
        return -1;
    }

    /* This solver is for symmetric matrices only. Check, rather than
       quietly return nonsense for a lopsided one. */
    for (int r = 0; r < matSize; r++)
        for (int c = r + 1; c < matSize; c++)
        {
            double upper = MAT(srcMatrix, r, c), lower = MAT(srcMatrix, c, r);
            if (fabs(upper - lower) > 1e-9 * (fabs(upper) + fabs(lower)) + 1e-12)
            {
                printf("eig: matrix must be symmetric (row %d col %d is %g, "
                       "but row %d col %d is %g)\n",
                       r + 1, c + 1, upper, c + 1, r + 1, lower);
                return -1;
            }
        }

    /* Scratch space: working copy (becomes Q, then the eigenvectors),
       diagonal and sub-diagonal. */
    double *vecData = malloc(matSize * matSize * sizeof(double));
    double *diag    = malloc(matSize * sizeof(double));
    double *offDiag = malloc(matSize * sizeof(double));
    memcpy(vecData, srcMatrix->data, matSize * matSize * sizeof(double));

    eig_tred2(matSize, vecData, diag, offDiag);
    if (eig_tql2(matSize, diag, offDiag, outVectors ? vecData : NULL) != 0)
    {
        printf("eig: did not converge\n");
        free(vecData); free(diag); free(offDiag);
        return -1;
    }

    eig_pack_results(matSize, diag, outVectors ? vecData : NULL,
                     outValues, outVectors);
    free(vecData); free(diag); free(offDiag);
    return 0;
}

/*************************************************************
 * Function:    mat_eig_tridiag
 * Input:       diag       (const double*) — n diagonal entries
 *              offDiag    (const double*) — n-1 off-diagonal entries, with
 *                                           offDiag[i] coupling rows i and i+1
 *              n          (int)           — order of the matrix
 *              outValues  (Matrix**)      — out: n x 1 eigenvalues, ascending
 *              outVectors (Matrix**)      — out: n x n eigenvectors, or NULL
 *                                           for eigenvalues only (much faster)
 * Output:      int — 0 on success, -1 on error (message printed)
 * Description: Eigen decomposition of a symmetric tridiagonal matrix given as
 *              its two diagonals, skipping the Householder step entirely.
 *              This is the fast path for finite-difference problems such as
 *              the 1D Schrodinger equation, where the matrix is tridiagonal
 *              from birth and storing all n x n zeros would be a waste.
 *              Caller frees the returned matrices with mat_free().
 **************************************************************/
int mat_eig_tridiag(const double *diag, const double *offDiag, int n,
                    Matrix **outValues, Matrix **outVectors)
{
    if (n < 1)
    {
        printf("eig: matrix is empty\n");
        return -1;
    }

    /* Working copies — tql2 chews up its inputs. offDiag goes into the
       slot convention tql2 expects: work[i] couples rows i-1 and i. */
    double *workDiag = malloc(n * sizeof(double));
    double *workOff  = malloc(n * sizeof(double));
    memcpy(workDiag, diag, n * sizeof(double));
    workOff[0] = 0.0;
    for (int i = 1; i < n; i++)
        workOff[i] = offDiag[i - 1];

    /* Eigenvectors start from the identity: the matrix is already tridiagonal,
       so there is no Householder transform to undo. */
    double *vecData = NULL;
    if (outVectors)
    {
        vecData = calloc(n * n, sizeof(double));
        for (int i = 0; i < n; i++)
            vecData[i * n + i] = 1.0;
    }

    if (eig_tql2(n, workDiag, workOff, vecData) != 0)
    {
        printf("eig: did not converge\n");
        free(workDiag); free(workOff); free(vecData);
        return -1;
    }

    eig_pack_results(n, workDiag, vecData, outValues, outVectors);
    free(workDiag); free(workOff); free(vecData);
    return 0;
}
