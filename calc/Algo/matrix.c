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
 