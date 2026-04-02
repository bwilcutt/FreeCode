#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pipe_mgr.h"

/* ═══════════════════════════════════════════════════════════
   TEST HARNESS — pipe_mgr.c / parse
   Compile:
       gcc -o pipe_test pipe_test.c pipe_mgr.c
   Run:
       ./pipe_test [path_to_parse]
       ./pipe_test ../parse
   ═══════════════════════════════════════════════════════════ */

#define BUFSIZE 4096

static int tests_run    = 0;
static int tests_passed = 0;
static int tests_failed = 0;

/*************************************************************
 * Function:    check
 * Input:       label    (const char*) — test description
 *              pass     (int)         — 1 if test passed, 0 if failed
 * Output:      void
 * Description: Records and prints a single PASS/FAIL result.
 *************************************************************/
static void check(const char *label, int pass)
{
    tests_run++;
    if (pass)
    {
        tests_passed++;
        printf("  PASS  %s\n", label);
    }
    else
    {
        tests_failed++;
        printf("  FAIL  %s\n", label);
    }
}

/*************************************************************
 * Function:    check_contains
 * Input:       label    (const char*) — test description
 *              haystack (const char*) — response buffer to search
 *              needle   (const char*) — expected substring
 * Output:      void
 * Description: Passes if needle is found anywhere in haystack.
 *************************************************************/
static void check_contains(const char *label, const char *haystack,
                            const char *needle)
{
    check(label, strstr(haystack, needle) != NULL);
}

/*************************************************************
 * Function:    check_not_contains
 * Input:       label    (const char*) — test description
 *              haystack (const char*) — response buffer to search
 *              needle   (const char*) — string that must NOT appear
 * Output:      void
 * Description: Passes if needle is NOT found in haystack.
 *************************************************************/
static void check_not_contains(const char *label, const char *haystack,
                                const char *needle)
{
    check(label, strstr(haystack, needle) == NULL);
}

/* ═══════════════════════════════════════════════════════════
   TEST GROUPS
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    test_startup
 * Input:       void
 * Output:      void
 * Description: Verifies that parse starts up and pipe_alive()
 *              reports the process as running.
 *************************************************************/
static void test_startup(void)
{
    printf("\n── Startup ──────────────────────────────────────────\n");
    check("pipe_alive() after open", pipe_alive());
}

/*************************************************************
 * Function:    test_scalar_arithmetic
 * Input:       void
 * Output:      void
 * Description: Sends basic scalar expressions and checks that
 *              the response contains the expected numeric result.
 *************************************************************/
static void test_scalar_arithmetic(void)
{
    char buf[BUFSIZE];

    printf("\n── Scalar arithmetic ────────────────────────────────\n");

    pipe_transact("2 + 3\n", buf, sizeof(buf));
    check_contains("2 + 3 = 5",           buf, "5");

    pipe_transact("10 - 4\n", buf, sizeof(buf));
    check_contains("10 - 4 = 6",          buf, "6");

    pipe_transact("6 * 7\n", buf, sizeof(buf));
    check_contains("6 * 7 = 42",          buf, "42");

    pipe_transact("20 / 4\n", buf, sizeof(buf));
    check_contains("20 / 4 = 5",          buf, "5");

    pipe_transact("2 + 3 * 4\n", buf, sizeof(buf));
    check_contains("precedence 2+3*4=14", buf, "14");

    pipe_transact("(2 + 3) * 4\n", buf, sizeof(buf));
    check_contains("parens (2+3)*4=20",   buf, "20");

    pipe_transact("-5 + 3\n", buf, sizeof(buf));
    check_contains("unary minus = -2",    buf, "-2");
}

/*************************************************************
 * Function:    test_scalar_functions
 * Input:       void
 * Output:      void
 * Description: Exercises the built-in scalar functions.
 *************************************************************/
static void test_scalar_functions(void)
{
    char buf[BUFSIZE];

    printf("\n── Scalar functions ─────────────────────────────────\n");

    pipe_transact("sqrt(144)\n", buf, sizeof(buf));
    check_contains("sqrt(144) = 12",  buf, "12");

    pipe_transact("abs(-42)\n", buf, sizeof(buf));
    check_contains("abs(-42) = 42",   buf, "42");

    pipe_transact("floor(3.7)\n", buf, sizeof(buf));
    check_contains("floor(3.7) = 3",  buf, "3");

    pipe_transact("ceil(3.2)\n", buf, sizeof(buf));
    check_contains("ceil(3.2) = 4",   buf, "4");

    pipe_transact("log(1)\n", buf, sizeof(buf));
    check_contains("log(1) = 0",      buf, "0");

    pipe_transact("exp(0)\n", buf, sizeof(buf));
    check_contains("exp(0) = 1",      buf, "1");
}

/*************************************************************
 * Function:    test_variables
 * Input:       void
 * Output:      void
 * Description: Tests scalar variable assignment and retrieval
 *              across multiple round-trips, verifying that parse
 *              maintains state between commands.
 *************************************************************/
static void test_variables(void)
{
    char buf[BUFSIZE];

    printf("\n── Variables ────────────────────────────────────────\n");

    pipe_transact("$x = 10\n", buf, sizeof(buf));
    check_contains("assign $x = 10",      buf, "10");

    pipe_transact("$x\n", buf, sizeof(buf));
    check_contains("retrieve $x = 10",    buf, "10");

    pipe_transact("$y = 3.5\n", buf, sizeof(buf));
    check_contains("assign $y = 3.5",     buf, "3.5");

    pipe_transact("$z = $x + $y\n", buf, sizeof(buf));
    check_contains("$z = $x + $y = 13.5", buf, "13.5");

    pipe_transact("$x = 99\n", buf, sizeof(buf));
    check_contains("overwrite $x = 99",   buf, "99");

    pipe_transact("$x\n", buf, sizeof(buf));
    check_contains("retrieve overwritten", buf, "99");
}

/*************************************************************
 * Function:    test_comparisons
 * Input:       void
 * Output:      void
 * Description: Tests comparison operators, checking that true
 *              comparisons return 1 and false comparisons return 0.
 *************************************************************/
static void test_comparisons(void)
{
    char buf[BUFSIZE];

    printf("\n── Comparisons ──────────────────────────────────────\n");

    pipe_transact("5 == 5\n", buf, sizeof(buf));
    check_contains("5 == 5 is true",  buf, "1");

    pipe_transact("5 == 6\n", buf, sizeof(buf));
    check_contains("5 == 6 is false", buf, "0");

    pipe_transact("3 < 5\n", buf, sizeof(buf));
    check_contains("3 < 5 is true",   buf, "1");

    pipe_transact("5 > 3\n", buf, sizeof(buf));
    check_contains("5 > 3 is true",   buf, "1");

    pipe_transact("3 <= 3\n", buf, sizeof(buf));
    check_contains("3 <= 3 is true",  buf, "1");

    pipe_transact("3 >= 3\n", buf, sizeof(buf));
    check_contains("3 >= 3 is true",  buf, "1");

    pipe_transact("1 != 2\n", buf, sizeof(buf));
    check_contains("1 != 2 is true",  buf, "1");
}

/*************************************************************
 * Function:    test_matrix
 * Input:       void
 * Output:      void
 * Description: Tests matrix literals, arithmetic, and functions
 *              across the pipe.
 *************************************************************/
static void test_matrix(void)
{
    char buf[BUFSIZE];

    printf("\n── Matrix ───────────────────────────────────────────\n");

    pipe_transact("$A = [1 2; 3 4]\n", buf, sizeof(buf));
    check_contains("assign $A",            buf, "1");

    pipe_transact("det($A)\n", buf, sizeof(buf));
    check_contains("det($A) = -2",         buf, "-2");

    pipe_transact("$B = [5 6; 7 8]\n", buf, sizeof(buf));
    check_contains("assign $B",            buf, "5");

    pipe_transact("$A + $B\n", buf, sizeof(buf));
    check_contains("$A + $B contains 6",   buf, "6");

    pipe_transact("transpose($A)\n", buf, sizeof(buf));
    check_contains("transpose contains 3", buf, "3");

    pipe_transact("scale($A, 2)\n", buf, sizeof(buf));
    check_contains("scale($A,2) has 8",    buf, "8");
}

/*************************************************************
 * Function:    test_physics
 * Input:       void
 * Output:      void
 * Description: Sends a representative physics command from each
 *              domain and checks that the stored variable is
 *              returned correctly on the next query.
 *************************************************************/
static void test_physics(void)
{
    char buf[BUFSIZE];

    printf("\n── Physics ──────────────────────────────────────────\n");

    pipe_transact("reynolds V=1.5 D=0.05 nu=1.004e-6\n", buf, sizeof(buf));
    check_contains("reynolds stores $Re",     buf, "$Re");

    pipe_transact("$Re > 4000\n", buf, sizeof(buf));
    check_contains("Re turbulent",            buf, "1");

    pipe_transact("manning n=0.013 R=0.5 S=0.001\n", buf, sizeof(buf));
    check_contains("manning stores $manning_V", buf, "$manning_V");

    pipe_transact("$manning_V > 0\n", buf, sizeof(buf));
    check_contains("manning_V positive",      buf, "1");

    pipe_transact("darcy f=0.02 L=100 D=0.05 V=1.5\n", buf, sizeof(buf));
    check_contains("darcy stores $darcy_hf",  buf, "$darcy_hf");

    pipe_transact("$darcy_hf > 0\n", buf, sizeof(buf));
    check_contains("darcy_hf positive",       buf, "1");

    pipe_transact("stress F=50000 A=0.002\n", buf, sizeof(buf));
    check_contains("stress stores sigma",     buf, "$stress_sigma");

    pipe_transact("$stress_sigma == 50000 / 0.002\n", buf, sizeof(buf));
    check_contains("stress_sigma correct",    buf, "1");
}

/*************************************************************
 * Function:    test_csv_fft
 * Input:       void
 * Output:      void
 * Description: Tests the CSV load and FFT commands over the pipe.
 *              Assumes test CSV files are in the TestData directory
 *              relative to where parse is run from.
 *************************************************************/
static void test_csv_fft(void)
{
    char buf[BUFSIZE];

    printf("\n── CSV / FFT ────────────────────────────────────────\n");

    pipe_transact("load TestData/test_fft_data.csv col=1\n", buf, sizeof(buf));
    check_contains("load CSV succeeds",       buf, "Loaded");
    check_contains("load stores $signal",     buf, "$signal");

    pipe_transact("$imp = [1 0 0 0 0 0 0 0]\n", buf, sizeof(buf));
    check_contains("assign impulse",          buf, "1");

    pipe_transact("fft $imp var=imp\n", buf, sizeof(buf));
    check_contains("fft runs",                buf, "FFT");
    check_contains("fft stores _mag",         buf, "$imp_mag");

    pipe_transact("det(transpose($imp_mag) * $imp_mag)\n", buf, sizeof(buf));
    check_contains("Parseval impulse = 8",    buf, "8");

    pipe_transact("$dc8 = [2 2 2 2 2 2 2 2]\n", buf, sizeof(buf));
    pipe_transact("fft $dc8 var=dc8\n", buf, sizeof(buf));
    check_contains("fft DC runs",             buf, "FFT");

    pipe_transact("det(transpose($dc8_mag) * $dc8_mag)\n", buf, sizeof(buf));
    check_contains("Parseval DC = 256",       buf, "256");

    pipe_transact("ifft $imp_re $imp_im var=rt\n", buf, sizeof(buf));
    check_contains("ifft runs",               buf, "IFFT");
    check_contains("ifft stores _out",        buf, "$rt_out");

    pipe_transact("det(transpose($rt_out) * $rt_out)\n", buf, sizeof(buf));
    check_contains("round-trip energy = 1",   buf, "1");
}

/*************************************************************
 * Function:    test_state_persistence
 * Input:       void
 * Output:      void
 * Description: Verifies that variable state persists correctly
 *              across many separate pipe_transact() calls —
 *              the core requirement for a stateful GUI session.
 *************************************************************/
static void test_state_persistence(void)
{
    char buf[BUFSIZE];

    printf("\n── State persistence ────────────────────────────────\n");

    pipe_transact("$p = 7\n",      buf, sizeof(buf));
    pipe_transact("$q = 3\n",      buf, sizeof(buf));
    pipe_transact("$p + $q\n",     buf, sizeof(buf));
    check_contains("$p + $q = 10", buf, "10");

    pipe_transact("$p * $q\n",     buf, sizeof(buf));
    check_contains("$p * $q = 21", buf, "21");

    pipe_transact("$p = $p + 1\n", buf, sizeof(buf));
    pipe_transact("$p\n",          buf, sizeof(buf));
    check_contains("$p incremented to 8", buf, "8");
}

/*************************************************************
 * Function:    test_pipe_alive
 * Input:       void
 * Output:      void
 * Description: Verifies pipe_alive() returns 0 after pipe_close().
 *************************************************************/
static void test_pipe_alive(void)
{
    printf("\n── pipe_alive / shutdown ────────────────────────────\n");
    check("alive before close", pipe_alive());
    pipe_close();
    check("dead after close",  !pipe_alive());
}

/* ═══════════════════════════════════════════════════════════
   MAIN
   ═══════════════════════════════════════════════════════════ */

int main(int argc, char *argv[])
{
    const char *exe = (argc > 1) ? argv[1] : "./parse";

    printf("pipe_test — pipe_mgr test harness\n");
    printf("parse binary: %s\n", exe);
    printf("════════════════════════════════════════════════════\n");

    if (!pipe_open(exe))
    {
        fprintf(stderr, "FATAL: could not spawn '%s'\n", exe);
        return 1;
    }

    /* consume the startup prompt */
    {
        char buf[BUFSIZE];
        pipe_recv(buf, sizeof(buf));
    }

    test_startup();
    test_scalar_arithmetic();
    test_scalar_functions();
    test_variables();
    test_comparisons();
    test_matrix();
    test_physics();
    test_csv_fft();
    test_state_persistence();
    test_pipe_alive();

    printf("\n════════════════════════════════════════════════════\n");
    printf("Results: %d/%d passed", tests_passed, tests_run);
    if (tests_failed > 0)
        printf("  (%d FAILED)", tests_failed);
    printf("\n");

    return (tests_failed > 0) ? 1 : 0;
}