This is a commandline calculator with rediculous numbers of functions.   Basically, when you run it you can type in things such as

1+1

Which will return 2.


Take a look at the testcommands.txt file for examples.  You can exercise the test commands by typing in:

# parse < testcommands.txt


Note-- This is a living project, updated often with bug fixes, new additions, etc.  The ultimate goal is to slap a pretty GUI

on your screen and make this app the engine.


If you update, please drop a line to: bwilcutt@yahoo.com, I'm always happy to have corrections.


FUTURE EXPANSION:


if...else...elif

while..wend

for..next

Function creation

Function calling

GUI interface

Timing/PID methods


  Parse — command reference
  
  ─────────────────────────────────────────────────────

  Scalar operators
    
    +  -  *  /           arithmetic

    ( )                  grouping

    -x                   unary negation


  
  Scalar functions
    
    sin(x)  cos(x)  tan(x)    trig

    sqrt(x) abs(x)            root / absolute value

    log(x)  exp(x)            natural log / exponential


  
  Scalar variables
    
    $name = expr         assign

    $name                use in an expression


  
  Matrix literals
    
    [1 2 3; 4 5 6]       2x3 matrix  (';' separates rows)

    [1, 2; 3, 4]         commas optional


  
  Matrix operators
    
    $A + $B              element-wise addition

    $A - $B              element-wise subtraction

    $A * $B              matrix multiplication


  
  Matrix functions
    
    transpose($A)        transpose

    inv($A)              inverse  (square only)

    scale($A, k)         multiply every element by k

    det($A)              determinant  (printed as scalar)


  
  ── Hydraulics ────────────────────────────────────────

  Manning's Equation
    
    manning n=<> R=<> S=<> [A=<>] [D=<>] [units=si|us]

    manning ?            roughness coefficient table

    -> stores $manning_V, $manning_Q, $manning_Fr


  
  ── Fluid Mechanics ───────────────────────────────────

  Reynolds Number
    
    reynolds V=<> D=<> nu=<>

    reynolds V=<> D=<> rho=<> mu=<>

    -> stores $Re


  
  Darcy-Weisbach (pipe head loss)
    
    darcy f=<> L=<> D=<> V=<> [units=si|us]

    -> stores $darcy_hf, $darcy_dP_rho


  
  Bernoulli's Equation
    
    bernoulli P1=<> V1=<> z1=<> P2=<> V2=<> z2=<> [rho=<>] solve=<P1|V1|z1|P2|V2|z2>

    -> stores $bern_P1/V1/z1/P2/V2/z2


  
  Orifice Flow
    
    orifice Cd=<> A=<> h=<> [units=si|us]

    -> stores $orifice_Q, $orifice_V


  
  ── Structural Mechanics ──────────────────────────────

  Beam Deflection
    
    beam type=ss|cant load=point|udl P=<>|w=<> L=<> E=<> I=<>

    -> stores $beam_delta, $beam_Mmax, $beam_R


  
  Axial Stress / Strain
    
    stress F=<> A=<> [E=<>] [L=<>]

    -> stores $stress_sigma, $stress_eps, $stress_delta


  
  Mohr's Circle
    
    mohrs sx=<> sy=<> txy=<>

    -> stores $mohrs_s1, $mohrs_s2, $mohrs_tmax, $mohrs_theta


  
  ── Thermodynamics ────────────────────────────────────

  Ideal Gas Law  (PV = nRT)
    
    idealgas P=<> V=<> n=<> T=<> [units=si|us] solve=<P|V|n|T>

    -> stores $gas_P, $gas_V, $gas_n, $gas_T


  
  Heat Conduction  (Fourier's Law)
    
    conduction k=<> A=<> dT=<> L=<> [units=si|us]

    -> stores $cond_Q, $cond_flux, $cond_Rth


  
  Specific Heat  (Q = mc * dT)
    
    specificheat m=<> c=<> dT=<>             (solves Q)

    specificheat solve=<Q|m|c|dT> ...        (solve for any variable)

    -> stores $heat_Q, $heat_m, $heat_c, $heat_dT


  
  ── Control Systems ───────────────────────────────────

  PID Controller
    
    pid step  Kp=<> Ki=<> Kd=<> sp=<> pv=<> dt=<>
              
              [imin=<> imax=<>]  [omin=<> omax=<>]
    
    -> stores $pid_out, $pid_error, $pid_integral, $pid_prev_err

    Note: $pid_integral and $pid_prev_err persist across calls.


    
    pid sim   Kp=<> Ki=<> Kd=<> sp=<> pv0=<> dt=<> n=<>
              
              gain=<> tau=<>  [imin=<> imax=<>]  [omin=<> omax=<>]
    
    -> simulates n steps; prints table; stores $pid_pv, $pid_out

    Plant model: tau*dpv/dt = gain*u - pv  (Euler discretised)


    
    pid tune  method=zn   Ku=<> Tu=<>         [type=P|PI|PID]

    pid tune  method=znol K=<> L=<> tau=<>    [type=P|PI|PID]

    pid tune  method=cc   K=<> L=<> tau=<>    [type=P|PI|PID]

    -> stores $pid_Kp, $pid_Ki, $pid_Kd, $pid_Ti, $pid_Td

    Methods: zn=Ziegler-Nichols ultimate-gain
             
             znol=Ziegler-Nichols open-loop (reaction curve)

             cc=Cohen-Coon


    
    pid reset            zero $pid_integral and $pid_prev_err


  
  ── Shell Commands ────────────────────────────────────
    
    ?                    show this help

    vars                 list scalar variables

    mats                 list matrix variables

    exit                 quit


  All parameter values accept full scalar expressions:

    manning R=$r S=1/500 A=$w*$d

    beam    L=6 E=200e9 I=8.33e-6 P=$load

    pid sim Kp=$pid_Kp Ki=$pid_Ki Kd=$pid_Kd sp=100 pv0=0 dt=0.05 n=200 gain=1 tau=2
  
  ─────────────────────────────────────────────────────
