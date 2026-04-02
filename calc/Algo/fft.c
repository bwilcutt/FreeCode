#include "parse.h"
#include "matrix.h"
#include "fft.h"

/*************************************************************
 * Function:    next_pow2
 * Input:       n (int) — any positive integer
 * Output:      int — smallest power of two >= n
 * Description: Bit-shifts a value of 1 left until it reaches
 *              or exceeds n.  Returns 1 for n <= 1.
 *************************************************************/
static int next_pow2(int n)
{
    int p = 1;
    while (p < n) p <<= 1;
    return p;
}

/*************************************************************
 * Function:    bit_reverse_copy
 * Input:       inRe  (const double*) — real input, length n
 *              inIm  (const double*) — imaginary input, length n
 *              outRe (double*)       — bit-reversed real output
 *              outIm (double*)       — bit-reversed imaginary output
 *              n     (int)           — transform length (power of 2)
 * Output:      void
 * Description: Performs the bit-reversal permutation required by
 *              the Cooley-Tukey DIT algorithm.  The number of bits
 *              needed is log2(n), computed by counting right-shifts
 *              of (n-1) until it reaches zero.
 *************************************************************/
static void bit_reverse_copy(const double *inRe,  const double *inIm,
                              double       *outRe, double       *outIm,
                              int n)
{
    int bits;
    int i;
    int rev;
    int tmp;
    int j;

    /* count bits = log2(n) */
    bits = 0;
    tmp  = n - 1;
    while (tmp > 0) { bits++; tmp >>= 1; }

    for (i = 0; i < n; i++)
    {
        rev = 0;
        tmp = i;
        for (j = 0; j < bits; j++)
        {
            rev = (rev << 1) | (tmp & 1);
            tmp >>= 1;
        }
        outRe[rev] = inRe[i];
        outIm[rev] = inIm[i];
    }
}

/*************************************************************
 * Function:    fft_inplace
 * Input:       re     (double*) — real part array, length n (in/out)
 *              im     (double*) — imaginary part array, length n (in/out)
 *              n      (int)     — transform length, must be a power of 2
 *              invert (int)     — 0 for forward FFT, 1 for inverse FFT
 * Output:      void
 * Description: Iterative Cooley-Tukey radix-2 DIT FFT operating
 *              in-place on re[] and im[].  The twiddle factor for
 *              the inverse transform uses a positive exponent and
 *              divides all outputs by n.
 *              Butterfly kernel:
 *                tRe = wRe*re[j+half] - wIm*im[j+half]
 *                tIm = wRe*im[j+half] + wIm*re[j+half]
 *                re[j+half] = re[j] - tRe
 *                im[j+half] = im[j] - tIm
 *                re[j]      = re[j] + tRe
 *                im[j]      = im[j] + tIm
 *************************************************************/
static void fft_inplace(double *re, double *im, int n, int invert)
{
    int    len;
    int    half;
    int    i;
    int    j;
    double angle;
    double wRe;
    double wIm;
    double curRe;
    double curIm;
    double tRe;
    double tIm;
    int    k;

    /* iterative stages: len = 2, 4, 8, … n */
    for (len = 2; len <= n; len <<= 1)
    {
        half  = len >> 1;
        angle = 2.0 * M_PI / len * (invert ? 1.0 : -1.0);
        wRe   = cos(angle);
        wIm   = sin(angle);

        for (i = 0; i < n; i += len)
        {
            curRe = 1.0;
            curIm = 0.0;
            for (j = 0; j < half; j++)
            {
                k   = i + j;
                tRe = curRe * re[k + half] - curIm * im[k + half];
                tIm = curRe * im[k + half] + curIm * re[k + half];

                re[k + half] = re[k] - tRe;
                im[k + half] = im[k] - tIm;
                re[k]        = re[k] + tRe;
                im[k]        = im[k] + tIm;

                /* advance twiddle factor by multiplication */
                tRe   = curRe * wRe - curIm * wIm;
                curIm = curRe * wIm + curIm * wRe;
                curRe = tRe;
            }
        }
    }

    /* inverse: divide by n */
    if (invert)
    {
        for (i = 0; i < n; i++)
        {
            re[i] /= n;
            im[i] /= n;
        }
    }
}

/*************************************************************
 * Function:    store_vec
 * Input:       name  (const char*) — matrix variable name (no '$')
 *              data  (const double*) — array of values
 *              n     (int)           — number of elements
 * Output:      void
 * Description: Allocates a column-vector Matrix of size n x 1,
 *              copies data into it, stores it via set_mat_var(),
 *              then frees the local Matrix handle (set_mat_var
 *              makes its own copy internally).
 *************************************************************/
static void store_vec(const char *name, const double *data, int n)
{
    Matrix *vec = mat_new(n, 1);
    memcpy(vec->data, data, n * sizeof(double));
    set_mat_var(name, vec);
}

/*************************************************************
 * Function:    run_fft
 * Input:       args (const char*) — argument string after "fft"
 * Output:      void
 * Description: Implements the "fft $vec [var=<prefix>]" shell
 *              command.  Reads the source variable name (the
 *              first $-prefixed token), retrieves the matrix,
 *              zero-pads to the next power of two, calls
 *              bit_reverse_copy() then fft_inplace(), and
 *              stores four output vectors:
 *                $<prefix>_re, $<prefix>_im,
 *                $<prefix>_mag, $<prefix>_phase.
 *              Prints a summary line showing N and the padded
 *              length if zero-padding was applied.
 *************************************************************/
void run_fft(const char *args)
{
    char        srcName[32];
    char        prefix[32];
    int         charIdx;
    const char *scanPtr;
    Matrix     *srcMat;
    int         n;
    int         nPad;
    double     *inRe;
    double     *inIm;
    double     *re;
    double     *im;
    double     *mag;
    double     *phase;
    char        outName[64];
    int         i;

    /* ── defaults ── */
    memset(srcName, 0, sizeof(srcName));
    memset(prefix,  0, sizeof(prefix));
    strcpy(prefix, "fft");

    /* ── find $varname ── */
    scanPtr = args;
    while (*scanPtr && isspace((unsigned char)*scanPtr)) scanPtr++;
    if (*scanPtr == '$') scanPtr++;
    charIdx = 0;
    while ((isalnum((unsigned char)*scanPtr) || *scanPtr == '_') &&
            charIdx < 31)
        srcName[charIdx++] = *scanPtr++;

    if (srcName[0] == '\0') { printf("fft: no source variable given\n"); return; }

    parse_named_string_param(args, "var", prefix, sizeof(prefix));

    /* ── retrieve matrix ── */
    srcMat = get_mat_var(srcName);
    if (!srcMat)
    {
        printf("fft: unknown matrix variable '$%s'\n", srcName);
        return;
    }
    n = srcMat->rows * srcMat->cols;   /* treat as flat vector */

    /* ── zero-pad to power of two ── */
    nPad = next_pow2(n);
    inRe = calloc(nPad, sizeof(double));
    inIm = calloc(nPad, sizeof(double));
    re   = malloc(nPad * sizeof(double));
    im   = malloc(nPad * sizeof(double));
    mag  = malloc(nPad * sizeof(double));
    phase= malloc(nPad * sizeof(double));

    if (!inRe || !inIm || !re || !im || !mag || !phase)
    {
        printf("fft: out of memory\n");
        free(inRe); free(inIm); free(re); free(im); free(mag); free(phase);
        return;
    }

    memcpy(inRe, srcMat->data, n * sizeof(double));
    /* inIm already zeroed by calloc */

    /* ── bit-reverse copy then in-place FFT ── */
    bit_reverse_copy(inRe, inIm, re, im, nPad);
    fft_inplace(re, im, nPad, 0);

    /* ── derived outputs ── */
    for (i = 0; i < nPad; i++)
    {
        mag[i]   = sqrt(re[i] * re[i] + im[i] * im[i]);
        phase[i] = atan2(im[i], re[i]);
    }

    /* ── store results ── */
    snprintf(outName, sizeof(outName), "%s_re",    prefix); store_vec(outName, re,    nPad);
    snprintf(outName, sizeof(outName), "%s_im",    prefix); store_vec(outName, im,    nPad);
    snprintf(outName, sizeof(outName), "%s_mag",   prefix); store_vec(outName, mag,   nPad);
    snprintf(outName, sizeof(outName), "%s_phase", prefix); store_vec(outName, phase, nPad);

    if (nPad != n)
        printf("  FFT: %d samples zero-padded to %d  →"
               "  $%s_re  $%s_im  $%s_mag  $%s_phase\n",
               n, nPad, prefix, prefix, prefix, prefix);
    else
        printf("  FFT: %d samples  →"
               "  $%s_re  $%s_im  $%s_mag  $%s_phase\n",
               nPad, prefix, prefix, prefix, prefix);

    free(inRe); free(inIm); free(re); free(im); free(mag); free(phase);
}

/*************************************************************
 * Function:    run_ifft
 * Input:       args (const char*) — argument string after "ifft"
 * Output:      void
 * Description: Implements the "ifft $re_var $im_var [var=<prefix>]"
 *              shell command.  Reads two source variable names,
 *              validates that both exist and have the same length
 *              (which must be a power of two), calls
 *              bit_reverse_copy() then fft_inplace() in inverse
 *              mode, and stores the real part of the result as
 *              $<prefix>_out.  The imaginary residual is discarded
 *              since a real-valued IFFT of a conjugate-symmetric
 *              spectrum produces only negligible imaginary noise.
 *************************************************************/
void run_ifft(const char *args)
{
    char        reName[32];
    char        imName[32];
    char        prefix[32];
    int         charIdx;
    const char *scanPtr;
    Matrix     *reMat;
    Matrix     *imMat;
    int         n;
    double     *re;
    double     *im;
    double     *outRe;
    double     *outIm;
    char        outName[64];
    int         i;

    /* ── defaults ── */
    memset(reName, 0, sizeof(reName));
    memset(imName, 0, sizeof(imName));
    memset(prefix, 0, sizeof(prefix));
    strcpy(prefix, "ifft");

    /* ── first $var ── */
    scanPtr = args;
    while (*scanPtr && isspace((unsigned char)*scanPtr)) scanPtr++;
    if (*scanPtr == '$') scanPtr++;
    charIdx = 0;
    while ((isalnum((unsigned char)*scanPtr) || *scanPtr == '_') &&
            charIdx < 31)
        reName[charIdx++] = *scanPtr++;

    /* ── second $var ── */
    while (*scanPtr && isspace((unsigned char)*scanPtr)) scanPtr++;
    if (*scanPtr == '$') scanPtr++;
    charIdx = 0;
    while ((isalnum((unsigned char)*scanPtr) || *scanPtr == '_') &&
            charIdx < 31)
        imName[charIdx++] = *scanPtr++;

    if (reName[0] == '\0' || imName[0] == '\0')
    {
        printf("ifft: usage: ifft $re_var $im_var [var=<prefix>]\n");
        return;
    }

    parse_named_string_param(args, "var", prefix, sizeof(prefix));

    /* ── retrieve matrices ── */
    reMat = get_mat_var(reName);
    imMat = get_mat_var(imName);
    if (!reMat) { printf("ifft: unknown variable '$%s'\n", reName); return; }
    if (!imMat) { printf("ifft: unknown variable '$%s'\n", imName); return; }

    n = reMat->rows * reMat->cols;
    if (imMat->rows * imMat->cols != n)
    {
        printf("ifft: '$%s' and '$%s' must have the same length\n",
               reName, imName);
        return;
    }
    if (n != next_pow2(n))
    {
        printf("ifft: length %d is not a power of two\n", n);
        return;
    }

    /* ── allocate and bit-reverse copy ── */
    re    = malloc(n * sizeof(double));
    im    = malloc(n * sizeof(double));
    outRe = malloc(n * sizeof(double));
    outIm = malloc(n * sizeof(double));

    if (!re || !im || !outRe || !outIm)
    {
        printf("ifft: out of memory\n");
        free(re); free(im); free(outRe); free(outIm);
        return;
    }

    bit_reverse_copy(reMat->data, imMat->data, re, im, n);
    fft_inplace(re, im, n, 1);

    /* outRe = re (imaginary residual discarded) */
    for (i = 0; i < n; i++) outRe[i] = re[i];

    snprintf(outName, sizeof(outName), "%s_out", prefix);
    store_vec(outName, outRe, n);

    printf("  IFFT: %d points  →  $%s_out\n", n, prefix);

    free(re); free(im); free(outRe); free(outIm);
}
