#ifndef GRAPH_DATA_H
#define GRAPH_DATA_H

/*************************************************************
 * graph_data.h — GraphData struct shared between graph.c
 *                and mohr_graph.c
 *
 * Keeping this in its own header avoids circular includes
 * between graph.h (which needs GTK) and mohr_graph.h
 * (which is compiled as part of calc/Algo).
 *************************************************************/

#include "module_desc.h"

/*************************************************************
 * Struct:      GraphData
 * Description: Private per-window graph data.  Heap-allocated
 *              when a graph window opens, freed on close.
 *************************************************************/
typedef struct
{
    char     *title;
    char     *x_label;
    char     *y_label;
    double   *x_data;
    double   *y_data;
    int       n;
    PlotType  plot_type;
} GraphData;

#endif /* GRAPH_DATA_H */
