#!/bin/bash
# ═══════════════════════════════════════════════════════════
# run_tests.sh — math shell test runner
# Usage:  ./run_tests.sh [testfile] [binary]
# Defaults: testcommands.txt and ./parse
# ═══════════════════════════════════════════════════════════
 
# always run from the directory the script lives in
cd "$(dirname "$0")" || exit 1

TESTFILE="${1:-testcommands.txt}"
BINARY="${2:-../parse}"
 
# ── sanity checks ──────────────────────────────────────────
if [ ! -f "$TESTFILE" ]; then
    echo "ERROR: test file '$TESTFILE' not found"
    exit 1
fi
 
if [ ! -x "$BINARY" ]; then
    echo "ERROR: binary '$BINARY' not found or not executable"
    exit 1
fi
 
# ── run tests ──────────────────────────────────────────────
echo "Running $TESTFILE against $BINARY ..."
echo ""
 
OUTPUT=$(grep -v '^#' "$TESTFILE" | "$BINARY" | sed 's/^< //')
FAILURES=$(echo "$OUTPUT" | cat -n | grep -E '^\s+[0-9]+\s+0$')
TOTAL=$(echo "$OUTPUT" | grep -cE '^[01]$')
FAIL_COUNT=$(echo "$FAILURES" | grep -c '^' )
 
# grep -c returns 1 with no matches, which also sets FAILURES to
# a single blank line — treat that as zero failures
if [ -z "$FAILURES" ]; then
    FAIL_COUNT=0
fi
 
# ── report ─────────────────────────────────────────────────
if [ -z "$FAILURES" ]; then
    echo "  All $TOTAL assertions PASSED"
    echo ""
    exit 0
else
    echo "  $FAIL_COUNT of $TOTAL assertions FAILED:"
    echo ""
    echo "  Output line   Value"
    echo "  ──────────────────"
    echo "$FAILURES" | while read -r line; do
        echo "  $line"
    done
    echo ""
    exit 1
fi
 
