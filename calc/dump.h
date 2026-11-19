#ifndef DUMP_H
#define DUMP_H

/*************************************************************
 * dump.h — raw numeric vector dump command
 *
 * Provides run_dump(), dispatched from main() when the user
 * (or the Mathrix GUI) types:
 *
 *   dump $varname
 *
 * Output format — designed for easy machine parsing:
 *
 *   dump:begin <N>
 *   <val0>
 *   <val1>
 *   ...
 *   dump:end
 *
 * Where N is the element count and each value is printed in
 * full double precision (%-.17g).  The begin/end markers let
 * graph.c detect the block unambiguously even if other output
 * surrounds it.
 *
 * Paging, for arrays too big for one reply:
 *
 *   dump $varname start=<first> count=<how many>
 *
 * sends only that slice (elements numbered from 0, row by row);
 * N is then the slice length.  Without start/count, the whole
 * array goes, exactly as before.
 *
 * If the variable does not exist or is not a matrix variable,
 * an error line is printed and no begin/end block is emitted.
 *************************************************************/

void run_dump(const char *args);

#endif /* DUMP_H */