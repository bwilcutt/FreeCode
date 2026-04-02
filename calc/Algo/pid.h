#ifndef PID_H
#define PID_H
 
/*************************************************************
 * pid.h — PID controller for the math shell
 *
 * Provides run_pid(), dispatched from main() when the user
 * types any "pid ..." command.
 *
 * Sub-commands:
 *
 *   pid step  Kp=<> Ki=<> Kd=<> sp=<> pv=<> dt=<>
 *             [imin=<> imax=<>] [omin=<> omax=<>]
 *   Stored scalars:
 *     $pid_out        — control output
 *     $pid_error      — current error (sp - pv)
 *     $pid_integral   — accumulated integral (persists across calls)
 *     $pid_prev_err   — previous error (persists across calls)
 *
 *   pid sim   Kp=<> Ki=<> Kd=<> sp=<> pv0=<> dt=<> n=<>
 *             gain=<> tau=<> [imin=<> imax=<>] [omin=<> omax=<>]
 *   Stored scalars (final step values):
 *     $pid_pv         — final process variable
 *     $pid_out        — final control output
 *     $pid_integral   — final integral accumulator
 *     $pid_prev_err   — final previous error
 *   Stored matrix column vectors (full time series, n+1 points):
 *     $pid_pv_vec     — process variable at every step (plottable)
 *     $pid_out_vec    — control output at every step   (plottable)
 *
 *   pid tune  method=zn   Ku=<> Tu=<>           [type=P|PI|PID]
 *   pid tune  method=znol K=<> L=<> tau=<>      [type=P|PI|PID]
 *   pid tune  method=cc   K=<> L=<> tau=<>      [type=P|PI|PID]
 *   Stored scalars:
 *     $pid_Kp, $pid_Ki, $pid_Kd, $pid_Ti, $pid_Td
 *
 *   pid reset
 *     Zeroes $pid_integral and $pid_prev_err.
 *************************************************************/
 
#include "parse.h"
 
void run_pid(const char *args);
 
#endif /* PID_H */
 