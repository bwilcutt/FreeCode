#ifndef CSV_H
#define CSV_H
 
/*************************************************************
 * csv.h — CSV file loader for the math shell
 *
 * Provides run_load(), dispatched from main() when the user
 * types:
 *
 *   load <filename> [col=<N>] [var=<name>]
 *
 * The named column (1-based, default 1) is read from the CSV
 * and stored as a column-vector matrix variable whose name
 * defaults to "signal" (i.e. $signal).  The file may have an
 * optional header row; if the first non-empty cell of row 0
 * cannot be parsed as a number the row is skipped silently.
 * Empty cells are treated as 0.0.  Delimiter auto-detection
 * tries comma then tab then space.
 *************************************************************/
 
void run_load(const char *args);
 
#endif /* CSV_H */