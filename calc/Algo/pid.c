#include "pid.h"
#include "matrix.h"

/*************************************************************
 * Function:    pid_clamp
 * Input:       v  (double) — value to clamp
 *              lo (double) — lower bound
 *              hi (double) — upper bound
 * Output:      double — v clamped to [lo, hi]
 * Description: Utility used for integrator anti-windup and output saturation.
 *              When lo >= hi (i.e. user supplied no bounds) the value passes
 *              through unchanged because the defaults are -1e300 / +1e300.
 **************************************************************/
static double pid_clamp(double v, double lo, double hi)
{
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}

/*************************************************************
 * Function:    pid_step
 * Input:       args (const char*) — parameter string following "pid step"
 * Output:      void
 * Description: Executes one PID control tick using the parallel (ideal) form:
 *
 *                u(k) = Kp*e(k) + Ki*∫e dt + Kd*(e(k)-e(k-1))/dt
 *
 *              Persisted state ($pid_integral, $pid_prev_err) is read from the
 *              scalar variable store before the tick and written back after,
 *              so successive "pid step" calls accumulate naturally.
 *
 *              Named parameters
 *                Kp, Ki, Kd   — PID gains  (defaults: 1, 0, 0)
 *                sp           — setpoint   (default: 0)
 *                pv           — process variable / measurement  (default: 0)
 *                dt           — sample period in consistent units (default: 1)
 *                imin, imax   — integrator clamp bounds  (default: ±∞)
 *                omin, omax   — output clamp bounds      (default: ±∞)
 *
 *              Stored variables
 *                $pid_out, $pid_error, $pid_integral, $pid_prev_err
 **************************************************************/
static void pid_step(const char *args)
{
    double Kp   = 1.0, Ki   = 0.0,    Kd   = 0.0;
    double sp   = 0.0, pv   = 0.0,    dt   = 1.0;
    double imin = -1e300, imax = 1e300;
    double omin = -1e300, omax = 1e300;
    int    found;
    double integral, prev_err;
    double error, derivative, output;

    parse_named_param(args, "Kp",   &Kp,   &found);
    parse_named_param(args, "Ki",   &Ki,   &found);
    parse_named_param(args, "Kd",   &Kd,   &found);
    parse_named_param(args, "sp",   &sp,   &found);
    parse_named_param(args, "pv",   &pv,   &found);
    parse_named_param(args, "dt",   &dt,   &found);
    parse_named_param(args, "imin", &imin, &found);
    parse_named_param(args, "imax", &imax, &found);
    parse_named_param(args, "omin", &omin, &found);
    parse_named_param(args, "omax", &omax, &found);

    /* Load persisted state */
    integral = get_var("pid_integral");
    prev_err = get_var("pid_prev_err");

    /* Control law */
    error      = sp - pv;
    integral   = pid_clamp(integral + error * dt, imin, imax);
    derivative = (dt > 0.0) ? (error - prev_err) / dt : 0.0;
    output     = pid_clamp(Kp * error + Ki * integral + Kd * derivative,
                           omin, omax);

    /* Persist updated state */
    set_var("pid_integral", integral);
    set_var("pid_prev_err", error);
    set_var("pid_error",    error);
    set_var("pid_out",      output);

    printf("\n  PID Step\n");
    printf("  ──────────────────────────────────\n");
    printf("  Gains       : Kp=%-10g Ki=%-10g Kd=%g\n", Kp, Ki, Kd);
    printf("  Setpoint    : %g\n",  sp);
    printf("  Process var : %g\n",  pv);
    printf("  Error       : %g\n",  error);
    printf("  Integral    : %g\n",  integral);
    printf("  Derivative  : %g\n",  derivative);
    printf("  Output      : %g\n",  output);
    printf("  ──────────────────────────────────\n");
    printf("  $pid_out = %g\n\n", output);
}

/*************************************************************
 * Function:    pid_sim
 * Input:       args (const char*) — parameter string following "pid sim"
 * Output:      void
 * Description: Simulates a PID controller in closed loop with a first-order
 *              plant model for n discrete steps.
 *
 *              Plant model (Euler-discretised):
 *                pv[k+1] = pv[k] + (dt/tau) * (gain*u[k] - pv[k])
 *
 *              Named parameters
 *                Kp, Ki, Kd   — PID gains
 *                sp           — setpoint
 *                pv0          — initial process variable  (default: 0)
 *                dt           — sample period             (default: 0.1)
 *                n            — number of steps           (default: 50)
 *                gain         — plant static gain K       (default: 1)
 *                tau          — plant time constant       (default: 1)
 *                imin, imax   — integrator clamp
 *                omin, omax   — output clamp
 *
 *              Stored scalar variables (final step values)
 *                $pid_out, $pid_pv, $pid_integral, $pid_prev_err
 *
 *              Stored matrix variables (full time series, n+1 points)
 *                $pid_pv_vec  — process variable at every step
 *                $pid_out_vec — control output at every step
 **************************************************************/
static void pid_sim(const char *args)
{
    double Kp   = 1.0,  Ki   = 0.0,   Kd  = 0.0;
    double sp   = 1.0,  pv0  = 0.0,   dt  = 0.1;
    double gain = 1.0,  tau  = 1.0;
    double n_d  = 50.0;
    double imin = -1e300, imax = 1e300;
    double omin = -1e300, omax = 1e300;
    int    found;
    int    n, i;
    double pv, integral, prev_err;
    double error, derivative, output;
    double *pv_history;
    double *out_history;
    Matrix *pv_mat;
    Matrix *out_mat;

    parse_named_param(args, "Kp",   &Kp,   &found);
    parse_named_param(args, "Ki",   &Ki,   &found);
    parse_named_param(args, "Kd",   &Kd,   &found);
    parse_named_param(args, "sp",   &sp,   &found);
    parse_named_param(args, "pv0",  &pv0,  &found);
    parse_named_param(args, "dt",   &dt,   &found);
    parse_named_param(args, "n",    &n_d,  &found);
    parse_named_param(args, "gain", &gain, &found);
    parse_named_param(args, "tau",  &tau,  &found);
    parse_named_param(args, "imin", &imin, &found);
    parse_named_param(args, "imax", &imax, &found);
    parse_named_param(args, "omin", &omin, &found);
    parse_named_param(args, "omax", &omax, &found);

    if (tau <= 0.0) { printf("  pid sim: tau must be > 0\n"); return; }
    if (dt  <= 0.0) { printf("  pid sim: dt must be > 0\n");  return; }

    n        = (int)n_d;
    pv       = pv0;
    integral = 0.0;
    prev_err = 0.0;
    output   = 0.0;

    /* ── allocate history arrays (n+1 points including step 0) ── */
    pv_history  = malloc((n + 1) * sizeof(double));
    out_history = malloc((n + 1) * sizeof(double));
    if (!pv_history || !out_history)
    {
        printf("  pid sim: out of memory\n");
        free(pv_history);
        free(out_history);
        return;
    }

    printf("\n  PID Closed-Loop Simulation\n");
    printf("  Gains : Kp=%.6g  Ki=%.6g  Kd=%.6g\n", Kp, Ki, Kd);
    printf("  Plant : gain=%.6g  tau=%.6g\n", gain, tau);
    printf("  Run   : sp=%.6g  pv0=%.6g  dt=%.6g  n=%d\n\n",
           sp, pv0, dt, n);
    printf("  %-6s  %-14s  %-14s  %-14s  %-14s\n",
           "step", "time", "pv", "error", "output");
    printf("  ──────  ──────────────  ──────────────"
           "  ──────────────  ──────────────\n");

    /* Step 0: initial state, no control action yet */
    pv_history[0]  = pv;
    out_history[0] = 0.0;
    printf("  %-6d  %-14.6g  %-14.6g  %-14.6g  %-14.6g\n",
           0, 0.0, pv, sp - pv, 0.0);

    for (i = 1; i <= n; i++)
    {
        error      = sp - pv;
        integral   = pid_clamp(integral + error * dt, imin, imax);
        derivative = (i == 1) ? 0.0 : (error - prev_err) / dt;
        output     = pid_clamp(
                         Kp * error + Ki * integral + Kd * derivative,
                         omin, omax);
        prev_err   = error;

        /* Euler plant update: pv[k+1] = pv[k] + (dt/tau)*(gain*u - pv[k]) */
        pv = pv + (dt / tau) * (gain * output - pv);

        pv_history[i]  = pv;
        out_history[i] = output;

        printf("  %-6d  %-14.6g  %-14.6g  %-14.6g  %-14.6g\n",
               i, i * dt, pv, error, output);
    }

    printf("  ──────  ──────────────  ──────────────"
           "  ──────────────  ──────────────\n\n");

    /* ── store scalar end-state (backward compatible) ── */
    set_var("pid_integral", integral);
    set_var("pid_prev_err", prev_err);
    set_var("pid_out",      output);
    set_var("pid_pv",       pv);

    /* ── store full time-series as matrix column vectors ── */
    pv_mat  = mat_new(n + 1, 1);
    out_mat = mat_new(n + 1, 1);
    memcpy(pv_mat->data,  pv_history,  (n + 1) * sizeof(double));
    memcpy(out_mat->data, out_history, (n + 1) * sizeof(double));
    set_mat_var("pid_pv_vec",  pv_mat);
    set_mat_var("pid_out_vec", out_mat);
    free(pv_history);
    free(out_history);

    printf("  $pid_pv = %g   $pid_out = %g\n", pv, output);
    printf("  $pid_pv_vec  [%d x 1]  — full PV time series\n",  n + 1);
    printf("  $pid_out_vec [%d x 1]  — full output time series\n\n", n + 1);
}

/*************************************************************
 * Function:    pid_tune
 * Input:       args (const char*) — parameter string following "pid tune"
 * Output:      void
 * Description: Computes PID gain recommendations using one of three classical
 *              tuning rules selected by method=<zn|znol|cc>.
 *
 *              method=zn   Ziegler-Nichols ultimate-gain method
 *                Required : Ku=<ultimate gain>  Tu=<ultimate period>
 *
 *              method=znol Ziegler-Nichols open-loop (reaction-curve) method
 *                Required : K=<plant gain>  L=<dead time>  tau=<time constant>
 *
 *              method=cc   Cohen-Coon
 *                Required : K=<plant gain>  L=<dead time>  tau=<time constant>
 *
 *              All three methods support type=P|PI|PID (default: PID).
 *
 *              Stored variables
 *                $pid_Kp, $pid_Ki, $pid_Kd, $pid_Ti, $pid_Td
 **************************************************************/
static void pid_tune(const char *args)
{
    char   method[16] = "zn";
    char   type[8]    = "PID";
    double Ku = 0.0, Tu = 0.0;
    double K  = 0.0, L  = 0.0, tau_p = 0.0;
    double Kp = 0.0, Ti = 0.0, Td    = 0.0;
    double Ki, Kd;
    double r;
    int    found;

    parse_named_string_param(args, "method", method, sizeof(method));
    parse_named_string_param(args, "type",   type,   sizeof(type));
    parse_named_param(args, "Ku",  &Ku,    &found);
    parse_named_param(args, "Tu",  &Tu,    &found);
    parse_named_param(args, "K",   &K,     &found);
    parse_named_param(args, "L",   &L,     &found);
    parse_named_param(args, "tau", &tau_p, &found);

    /* ── Ziegler-Nichols: Ultimate-Gain Method ── */
    if (strcmp(method, "zn") == 0)
    {
        if (Ku == 0.0 || Tu == 0.0)
        {
            printf("  pid tune zn requires Ku=<> and Tu=<>\n");
            return;
        }
        if (strcmp(type, "P") == 0)
        {
            Kp = 0.5 * Ku;
            Ti = 0.0; Td = 0.0;
        }
        else if (strcmp(type, "PI") == 0)
        {
            Kp = 0.45 * Ku;
            Ti = Tu / 1.2;
            Td = 0.0;
        }
        else /* PID */
        {
            Kp = 0.6  * Ku;
            Ti = Tu   / 2.0;
            Td = Tu   / 8.0;
        }
    }
    /* ── Ziegler-Nichols: Open-Loop Reaction-Curve Method ── */
    else if (strcmp(method, "znol") == 0)
    {
        if (K == 0.0 || L <= 0.0 || tau_p <= 0.0)
        {
            printf("  pid tune znol requires K=<> L=<> tau=<> (all non-zero)\n");
            return;
        }
        if (strcmp(type, "P") == 0)
        {
            Kp = tau_p / (K * L);
            Ti = 0.0; Td = 0.0;
        }
        else if (strcmp(type, "PI") == 0)
        {
            Kp = 0.9  * tau_p / (K * L);
            Ti = L    / 0.3;
            Td = 0.0;
        }
        else /* PID */
        {
            Kp = 1.2  * tau_p / (K * L);
            Ti = 2.0  * L;
            Td = 0.5  * L;
        }
    }
    /* ── Cohen-Coon ── */
    else if (strcmp(method, "cc") == 0)
    {
        if (K == 0.0 || L <= 0.0 || tau_p <= 0.0)
        {
            printf("  pid tune cc requires K=<> L=<> tau=<> (all non-zero)\n");
            return;
        }
        r = L / tau_p;
        if (strcmp(type, "P") == 0)
        {
            Kp = (1.0 / K) * (tau_p / L) * (1.0 + r / 3.0);
            Ti = 0.0; Td = 0.0;
        }
        else if (strcmp(type, "PI") == 0)
        {
            Kp = (1.0 / K) * (tau_p / L) * (0.9 + r / 12.0);
            Ti = L * (30.0 + 3.0 * r) / (9.0 + 20.0 * r);
            Td = 0.0;
        }
        else /* PID */
        {
            Kp = (1.0 / K) * (tau_p / L) * (4.0 / 3.0 + r / 4.0);
            Ti = L * (32.0 + 6.0 * r) / (13.0 + 8.0 * r);
            Td = L *  4.0             / (11.0 + 2.0 * r);
        }
    }
    else
    {
        printf("  Unknown tuning method '%s'  (use: zn | znol | cc)\n", method);
        return;
    }

    /* Convert to parallel gains */
    Ki = (Ti > 0.0) ? Kp / Ti : 0.0;
    Kd = Kp * Td;

    printf("\n  PID Tuning\n");
    printf("  Method : %s", method);
    if (strcmp(method, "zn") == 0)
        printf("  (Ziegler-Nichols ultimate-gain)\n");
    else if (strcmp(method, "znol") == 0)
        printf("  (Ziegler-Nichols open-loop / reaction curve)\n");
    else
        printf("  (Cohen-Coon)\n");
    printf("  Type   : %s controller\n", type);
    printf("  ──────────────────────────────────\n");
    printf("  Kp = %g\n",  Kp);
    printf("  Ti = %g      (integral time)\n",   Ti);
    printf("  Td = %g      (derivative time)\n", Td);
    printf("  Ki = %g      (= Kp/Ti, parallel form)\n", Ki);
    printf("  Kd = %g      (= Kp*Td, parallel form)\n", Kd);
    printf("  ──────────────────────────────────\n\n");

    set_var("pid_Kp", Kp);
    set_var("pid_Ki", Ki);
    set_var("pid_Kd", Kd);
    set_var("pid_Ti", Ti);
    set_var("pid_Td", Td);
}

/*************************************************************
 * Function:    run_pid
 * Input:       args (const char*) — everything after the "pid" token
 * Output:      void
 * Description: Strips leading whitespace, then dispatches to pid_step(),
 *              pid_sim(), pid_tune(), or a state reset.
 **************************************************************/
void run_pid(const char *args)
{
    while (*args && (*args == ' ' || *args == '\t')) args++;

    if (strncmp(args, "step",  4) == 0) { pid_step(args + 4);  return; }
    if (strncmp(args, "sim",   3) == 0) { pid_sim(args + 3);   return; }
    if (strncmp(args, "tune",  4) == 0) { pid_tune(args + 4);  return; }
    if (strncmp(args, "reset", 5) == 0)
    {
        set_var("pid_integral", 0.0);
        set_var("pid_prev_err", 0.0);
        printf("  PID state reset  ($pid_integral = 0, $pid_prev_err = 0)\n");
        return;
    }

    printf("\n  PID sub-commands\n");
    printf("  ──────────────────────────────────────────────────────────\n");
    printf("  pid step  Kp=<> Ki=<> Kd=<> sp=<> pv=<> dt=<>\n");
    printf("            [imin=<> imax=<>]  [omin=<> omax=<>]\n");
    printf("    -> $pid_out  $pid_error  $pid_integral  $pid_prev_err\n\n");
    printf("  pid sim   Kp=<> Ki=<> Kd=<> sp=<> pv0=<> dt=<> n=<>\n");
    printf("            gain=<> tau=<>  [imin=<> imax=<>]  [omin=<> omax=<>]\n");
    printf("    -> $pid_pv  $pid_out  (scalars, final step)\n");
    printf("    -> $pid_pv_vec  $pid_out_vec  (full time series)\n\n");
    printf("  pid tune  method=zn   Ku=<> Tu=<>           [type=P|PI|PID]\n");
    printf("  pid tune  method=znol K=<> L=<> tau=<>      [type=P|PI|PID]\n");
    printf("  pid tune  method=cc   K=<> L=<> tau=<>      [type=P|PI|PID]\n");
    printf("    -> $pid_Kp  $pid_Ki  $pid_Kd  $pid_Ti  $pid_Td\n\n");
    printf("  pid reset\n");
    printf("  ──────────────────────────────────────────────────────────\n\n");
}
