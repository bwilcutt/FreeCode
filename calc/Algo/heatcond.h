#ifndef HEATCOND_H
#define HEATCOND_H

/*************************************************************
 * heatcond.h — Fourier heat conduction command for Mathrix
 *
 * Provides run_heatcond(), dispatched from main() when the
 * user types:
 *
 *   heatcond k=<> A=<> L=<> T1=<> T2=<> [units=si|us] [solve=<k|A|L|T1|T2>]
 *
 * Implements Fourier's Law of heat conduction for a planar wall:
 *
 *   Q = k * A * (T1 - T2) / L
 *
 * where:
 *   k   — thermal conductivity  (W/m·K  or  BTU·in/hr·ft²·°F)
 *   A   — cross-sectional area  (m²  or  ft²)
 *   L   — wall thickness        (m   or  in)
 *   T1  — hot-face temperature  (K or °C  /  °F)
 *   T2  — cold-face temperature (K or °C  /  °F)
 *   Q   — heat flow rate        (W   or  BTU/hr)
 *
 * With solve= any one of the five material/geometry parameters
 * can be determined from the other four plus a supplied Q value.
 * Omitting solve= computes Q when all five inputs are given.
 *
 * Additional derived quantities always computed:
 *   q'' = Q / A              heat flux            (W/m²  or  BTU/hr·ft²)
 *   Rth = L / (k * A)       thermal resistance   (K/W)
 *
 * Common k values (SI, W/m·K):
 *   copper=385, aluminium=205, steel=50, glass=1.05,
 *   brick=0.69, wood=0.12, insulation=0.04, air=0.026
 *
 * Stored scalar variables (readable as $heatcond_*):
 *   $heatcond_k    $heatcond_A    $heatcond_L
 *   $heatcond_T1   $heatcond_T2
 *   $heatcond_Q    $heatcond_q    $heatcond_Rth
 *************************************************************/

#include "parse.h"

void run_heatcond(const char *args);

#endif /* HEATCOND_H */
