#ifndef FFT_H
#define FFT_H

/*************************************************************
 * fft.h — Cooley-Tukey radix-2 FFT for Parse.
 *
 * Provides two REPL commands dispatched from main():
 *
 *   fft  $vec  [var=<n>]
 *     Forward FFT of the column-vector matrix variable $vec.
 *     Input length is zero-padded to the next power of two if
 *     necessary.  Results are stored as column-vector matrix
 *     variables (prefix defaults to "fft"):
 *       $<prefix>_re     real parts
 *       $<prefix>_im     imaginary parts
 *       $<prefix>_mag    magnitude  sqrt(re²+im²)
 *       $<prefix>_phase  phase      atan2(im, re)  [radians]
 *
 *   ifft $re_var $im_var  [var=<n>]
 *     Inverse FFT from two real/imaginary column-vector matrix
 *     variables.  Stores only the real part of the result as
 *     $<prefix>_out  (prefix defaults to "ifft").
 *************************************************************/

void run_fft (const char *args);
void run_ifft(const char *args);

#endif /* FFT_H */