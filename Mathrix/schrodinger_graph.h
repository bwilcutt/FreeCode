/* =============================================================================
 * File:         schrodinger_graph.h
 * Author:       Bryan Wilcutt
 * Date Started: 2026-11-20
 * Description:  Interactive plot for the 1D Schrodinger equation in Mathrix.
 *
 *               The textbook picture: the potential V(x) as a filled curve,
 *               and every wavefunction floating at its own energy level in
 *               its own colour.  Unlike the other module plots this one has
 *               its own window, because it listens to the mouse:
 *
 *                 hover a level    — it lights up, and the line at the top
 *                                    says which state it is
 *                 click a level    — pick it (or click its label on the
 *                                    right; handy when two levels nearly
 *                                    touch, as in a double well)
 *                 pick one state   — it spins in place: the real part of
 *                                    psi breathes, the probability does not
 *                 pick two states  — they interfere and the particle sloshes
 *                                    from side to side (a quantum beat)
 *                 psi / psi^2      — switch between the wavefunction and the
 *                                    probability of finding the particle
 *                 Measure          — fire particles at the detector strip
 *                                    under the plot; the dots build up the
 *                                    probability shape one hit at a time,
 *                                    next to the shape theory predicts
 *
 *               All numbers come from parse ($schrod_*); this file fetches
 *               them once when the window opens and then only draws.
 * ============================================================================= */

#ifndef SCHRODINGER_GRAPH_H
#define SCHRODINGER_GRAPH_H

/*************************************************************
 * Function:    graph_window_open_schrodinger
 * Input:       void — reads the $schrod_* results from parse
 * Output:      void
 * Description: Fetches the energies, grid, potential and
 *              wavefunctions and opens the interactive window.
 *              Called by input_form.c when
 *              plot_type == PLOT_SCHRODINGER.
 *************************************************************/
void graph_window_open_schrodinger(void);

#endif /* SCHRODINGER_GRAPH_H */
