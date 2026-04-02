#include "parse.h"
#include "matrix.h"
#include "dump.h"

/*************************************************************
 * Function:    run_dump
 * Input:       args (const char*) — argument string after "dump"
 * Output:      void
 * Description: Parses the first $-prefixed token from args to
 *              get the variable name, looks it up in the matrix
 *              variable table via get_mat_var(), then prints
 *              all elements one per line between dump:begin and
 *              dump:end markers.
 *
 *              Output format:
 *                dump:begin <N>
 *                <val0 in %-.17g>
 *                <val1 in %-.17g>
 *                ...
 *                dump:end
 *
 *              Scalar variables are not supported — the GUI
 *              reads scalar results directly from parse output.
 *              If the variable is not found, prints:
 *                dump:error unknown variable $<name>
 *************************************************************/
void run_dump(const char *args)
{
    char        varName[32];
    int         charIdx;
    const char *scanPtr;
    Matrix     *mat;
    int         n;
    int         i;

    memset(varName, 0, sizeof(varName));

    /* ── find $varname ── */
    scanPtr = args;
    while (*scanPtr && isspace((unsigned char)*scanPtr)) scanPtr++;
    if (*scanPtr == '$') scanPtr++;

    charIdx = 0;
    while ((isalnum((unsigned char)*scanPtr) || *scanPtr == '_')
           && charIdx < 31)
        varName[charIdx++] = *scanPtr++;

    if (varName[0] == '\0')
    {
        printf("dump:error no variable name given\n");
        return;
    }

    /* ── look up matrix variable ── */
    mat = get_mat_var(varName);
    if (!mat)
    {
        printf("dump:error unknown variable $%s\n", varName);
        return;
    }

    /* ── emit block ── */
    n = mat->rows * mat->cols;
    printf("dump:begin %d\n", n);
    for (i = 0; i < n; i++)
        printf("%-.17g\n", mat->data[i]);
    printf("dump:end\n");
}
