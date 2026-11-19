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
 *              the elements one per line between dump:begin and
 *              dump:end markers.
 *
 *              Optional paging, for arrays too big for one reply:
 *                dump $var start=<first> count=<how many>
 *              Elements are numbered from 0 in storage order
 *              (row by row).  start defaults to 0, count to "all
 *              the rest"; a page that runs off the end is cut
 *              short, and N in dump:begin is what was actually
 *              sent.  Plain "dump $var" is unchanged.
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
 *              If start is past the end, prints:
 *                dump:error start <s> is past the end (<n> values)
 *************************************************************/
void run_dump(const char *args)
{
    char        varName[32];
    int         charIdx;
    const char *scanPtr;
    Matrix     *mat;
    int         n;
    int         i;
    double      start_d = 0.0;
    double      count_d = -1.0;
    int         found   = 0;
    int         first;
    int         last;

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

    n = mat->rows * mat->cols;

    /* ── optional page: start=<first element> count=<how many>.
          Read from what follows the name, so "$var" itself never
          gets mistaken for a parameter ── */
    parse_named_param(scanPtr, "start", &start_d, &found);
    parse_named_param(scanPtr, "count", &count_d, &found);

    first = (start_d > 0.0) ? (int)start_d : 0;
    if (first >= n && n > 0)
    {
        printf("dump:error start %d is past the end (%d values)\n", first, n);
        return;
    }

    /* no count, or one that overshoots: everything to the end */
    last = (count_d < 0.0 || first + (int)count_d > n) ? n : first + (int)count_d;

    /* ── emit block: N is what this page actually holds ── */
    printf("dump:begin %d\n", last - first);
    for (i = first; i < last; i++)
        printf("%-.17g\n", mat->data[i]);
    printf("dump:end\n");
}
