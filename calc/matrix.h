#ifndef MATRIX_H
#define MATRIX_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

/* ═══════════════════════════════════════════════════════════
   MATRIX TYPE
   Row-major storage: element (r, c) lives at data[r * cols + c].
   ═══════════════════════════════════════════════════════════ */
typedef struct {
    int rows, cols;
    double *data;
} Matrix;

typedef struct MatVar {
    char name[32];
    Matrix *mat;
    struct MatVar *next;
} MatVar;

/* Convenience macro for element access. */
#define MAT(m, r, c) ((m)->data[(r) * (m)->cols + (c)])


/* API */

extern MatVar *mat_vars;
Matrix *parse_mat_expr();
extern void mat_print(const Matrix *m, const char *label);
extern int is_matrix_context(const char *s);
extern void set_mat_var(const char *name, Matrix *m);
extern double mat_det(const Matrix *a);
extern Matrix *mat_new(int rows, int cols);
extern void mat_free(Matrix *m);
extern Matrix *get_mat_var(const char *name);
extern Matrix *mat_copy(const Matrix *src);
extern Matrix *mat_transpose(const Matrix *a);
extern Matrix *mat_inv(const Matrix *a);
extern int is_mat_var(const char *name);
extern Matrix *mat_sub(const Matrix *a, const Matrix *b);
extern Matrix *mat_mul(const Matrix *a, const Matrix *b);
extern Matrix *mat_scale(const Matrix *a, double s);
extern Matrix *mat_transpose(const Matrix *a);
extern Matrix *mat_add(const Matrix *a, const Matrix *b);
#endif