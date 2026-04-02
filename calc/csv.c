#include "parse.h"
#include "matrix.h"
#include "csv.h"

#define CSV_MAX_ROWS   65536
#define CSV_MAX_COLS   1024
#define CSV_LINE_BUF   4096

/*************************************************************
 * Function:    detect_delim
 * Input:       line (const char*) — first data line of the file
 * Output:      char — the detected delimiter character
 * Description: Counts occurrences of comma, tab, and space in
 *              the first line and returns whichever appears most.
 *              Falls back to comma when counts are equal.
 *************************************************************/
static char detect_delim(const char *line)
{
    int commas = 0;
    int tabs   = 0;
    int spaces = 0;
    const char *p = line;

    while (*p)
    {
        if (*p == ',')  commas++;
        else if (*p == '\t') tabs++;
        else if (*p == ' ')  spaces++;
        p++;
    }
    if (tabs   > commas && tabs   > spaces) return '\t';
    if (spaces > commas && spaces > tabs)   return ' ';
    return ',';
}

/*************************************************************
 * Function:    parse_csv_cell
 * Input:       cell (const char*) — null-terminated cell text,
 *                possibly quoted
 *              out  (double*)     — receives the parsed value
 * Output:      int — 1 on success, 0 if the cell is non-numeric
 * Description: Strips optional surrounding double-quotes, then
 *              calls strtod.  Returns 0 (and leaves *out = 0)
 *              when the text cannot be converted (e.g. a header
 *              label).
 *************************************************************/
static int parse_csv_cell(const char *cell, double *out)
{
    char   buf[64];
    int    len;
    char  *end;
    double val;

    while (isspace((unsigned char)*cell)) cell++;
    if (*cell == '"') cell++;

    len = 0;
    while (*cell && *cell != '"' && len < 63)
        buf[len++] = *cell++;
    buf[len] = '\0';

    /* trim trailing whitespace */
    while (len > 0 && isspace((unsigned char)buf[len - 1]))
        buf[--len] = '\0';

    if (len == 0) { *out = 0.0; return 1; }   /* empty cell → 0 */

    val = strtod(buf, &end);
    if (end == buf) { *out = 0.0; return 0; } /* non-numeric */
    *out = val;
    return 1;
}

/*************************************************************
 * Function:    split_line
 * Input:       line  (char*)  — mutable copy of one CSV line
 *              delim (char)   — delimiter character
 *              cells (char**) — output array of cell pointers
 *              maxCells (int) — capacity of cells[]
 * Output:      int — number of cells found
 * Description: Splits line in-place by replacing each delimiter
 *              with '\0' and recording the start of each field.
 *              Handles a single level of double-quote quoting so
 *              that a comma inside quotes is not treated as a
 *              delimiter.
 *************************************************************/
static int split_line(char *line, char delim, char **cells, int maxCells)
{
    int   count  = 0;
    char *p      = line;
    int   inQuote = 0;

    cells[count++] = p;
    while (*p && count < maxCells)
    {
        if (*p == '"')         { inQuote = !inQuote; p++; continue; }
        if (!inQuote && *p == delim)
        {
            *p = '\0';
            cells[count++] = p + 1;
        }
        p++;
    }
    /* strip trailing newline from last cell */
    p = cells[count - 1];
    while (*p) p++;
    while (p > cells[count - 1] && (*p == '\n' || *p == '\r' || *p == '\0'))
        p--;
    *(p + 1) = '\0';
    return count;
}

/*************************************************************
 * Function:    run_load
 * Input:       args (const char*) — argument string after "load"
 * Output:      void
 * Description: Parses the argument string for a filename,
 *              optional col=<N> (1-based column index, default 1),
 *              and optional var=<name> (destination variable name,
 *              default "signal").  Opens the CSV file, auto-detects
 *              the delimiter from the first line, skips a non-numeric
 *              header row if present, reads the requested column into
 *              a dynamically allocated double array, then stores the
 *              result as a column-vector Matrix via set_mat_var().
 *              Prints a one-line summary on success or an error
 *              message on failure.
 *************************************************************/
void run_load(const char *args)
{
    char        filename[256];
    char        varName[32];
    int         targetCol;
    int         colFound;
    int         varFound;
    double      colVal;
    double      varVal;
    FILE       *fp;
    char        lineBuf[CSV_LINE_BUF];
    char        lineCopy[CSV_LINE_BUF];
    char       *cells[CSV_MAX_COLS];
    char        delim;
    int         delimDetected;
    int         rowCount;
    int         cellCount;
    double     *data;
    double      cellVal;
    int         numeric;
    int         isHeaderRow;
    Matrix     *vec;
    int         i;
    const char *scanPtr;

    /* ── defaults ── */
    memset(filename, 0, sizeof(filename));
    memset(varName,  0, sizeof(varName));
    strcpy(varName, "signal");
    targetCol     = 1;
    colFound      = 0;
    varFound      = 0;
    delim         = ',';
    delimDetected = 0;
    rowCount      = 0;
    data          = NULL;

    /* ── extract filename (first non-space token) ── */
    scanPtr = args;
    while (*scanPtr && isspace((unsigned char)*scanPtr)) scanPtr++;
    i = 0;
    while (*scanPtr && !isspace((unsigned char)*scanPtr) && i < 255)
        filename[i++] = *scanPtr++;
    filename[i] = '\0';

    if (filename[0] == '\0') { printf("load: no filename given\n"); return; }

    /* ── named parameters ── */
    parse_named_param(args, "col", &colVal, &colFound);
    if (colFound) targetCol = (int)colVal;
    if (targetCol < 1) targetCol = 1;

    parse_named_string_param(args, "var", varName, sizeof(varName));

    /* ── open file ── */
    fp = fopen(filename, "r");
    if (!fp) { printf("load: cannot open '%s'\n", filename); return; }

    /* ── allocate data buffer ── */
    data = malloc(CSV_MAX_ROWS * sizeof(double));
    if (!data) { printf("load: out of memory\n"); fclose(fp); return; }

    isHeaderRow = 1;

    while (fgets(lineBuf, sizeof(lineBuf), fp) && rowCount < CSV_MAX_ROWS)
    {
        /* skip blank lines */
        {
            const char *chk = lineBuf;
            while (*chk && isspace((unsigned char)*chk)) chk++;
            if (!*chk) continue;
        }

        /* copy before splitting (split_line mutates) */
        strncpy(lineCopy, lineBuf, sizeof(lineCopy) - 1);
        lineCopy[sizeof(lineCopy) - 1] = '\0';

        /* detect delimiter from first line */
        if (!delimDetected) { delim = detect_delim(lineCopy); delimDetected = 1; }

        cellCount = split_line(lineCopy, delim, cells, CSV_MAX_COLS);

        if (targetCol > cellCount)
        {
            if (!isHeaderRow) data[rowCount++] = 0.0;
            isHeaderRow = 0;
            continue;
        }

        numeric = parse_csv_cell(cells[targetCol - 1], &cellVal);

        /* first row non-numeric → treat as header, skip */
        if (isHeaderRow && !numeric) { isHeaderRow = 0; continue; }
        isHeaderRow = 0;

        data[rowCount++] = cellVal;
    }
    fclose(fp);

    if (rowCount == 0)
    {
        printf("load: no numeric data found in column %d of '%s'\n",
               targetCol, filename);
        free(data);
        return;
    }

    /* ── build column-vector Matrix ── */
    vec = mat_new(rowCount, 1);
    memcpy(vec->data, data, rowCount * sizeof(double));
    free(data);

    set_mat_var(varName, vec);
    printf("  Loaded %d samples from '%s' col %d  →  $%s\n",
           rowCount, filename, targetCol, varName);
}
 
