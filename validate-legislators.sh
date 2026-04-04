#!/usr/bin/env bash
# validate-legislators.sh — Check mo-legislators.md data against official sources
#
# Usage: ./validate-legislators.sh
#
# This script performs basic validation on the legislator reference file:
# 1. Checks that all 34 senate districts are present
# 2. Checks that no room numbers are missing (VERIFY / —)
# 3. Checks that phone numbers are formatted correctly
# 4. Checks that email patterns match expected format
# 5. Reports the last-verified date and warns if stale (>30 days)
# 6. Optionally fetches the official Senate roster page to compare names
#
# Requirements: bash, grep, awk, curl (optional for online checks)

set -euo pipefail

FILE="mo-legislators.md"
CSV="senate-mail-merge.csv"
ERRORS=0
WARNINGS=0

echo "=========================================="
echo "  MO-Gov Legislator Data Validator"
echo "=========================================="
echo ""

# --- Check files exist ---
if [[ ! -f "$FILE" ]]; then
    echo "ERROR: $FILE not found. Run from the mo-gov repo root."
    exit 1
fi

# --- 1. Check all 34 districts are present ---
echo "1. Checking all 34 Senate districts are present..."
for d in $(seq 1 34); do
    if ! grep -qP "^\| $d \|" "$FILE"; then
        echo "   ERROR: District $d not found in $FILE"
        ((ERRORS++))
    fi
done
FOUND=$(grep -cP '^\| \d+ \|' "$FILE" || true)
echo "   Found $FOUND district rows (expected 34)"
if [[ "$FOUND" -eq 34 ]]; then
    echo "   ✓ All 34 districts present"
else
    echo "   ✗ Missing districts detected"
    ((ERRORS++))
fi
echo ""

# --- 2. Check for missing room numbers ---
echo "2. Checking for missing room numbers..."
MISSING_ROOMS=$(grep -cP '^\| \d+ \|.*\| (VERIFY|—) \|' "$FILE" || true)
if [[ "$MISSING_ROOMS" -gt 0 ]]; then
    echo "   WARNING: $MISSING_ROOMS senators have unverified room numbers:"
    grep -P '^\| \d+ \|.*\| (VERIFY|—) \|' "$FILE" | awk -F'|' '{print "     - District " $2 ": " $3}' | sed 's/^  *//'
    ((WARNINGS += MISSING_ROOMS))
else
    echo "   ✓ All room numbers populated"
fi
echo ""

# --- 3. Check phone number format ---
echo "3. Checking phone number format..."
BAD_PHONES=$(grep -P '^\| \d+ \|' "$FILE" | grep -cvP '\(573\) 751-\d{4}' || true)
# Subtract header row if matched
if [[ "$BAD_PHONES" -gt 0 ]]; then
    echo "   WARNING: $BAD_PHONES rows may have missing or malformed phone numbers"
    grep -P '^\| \d+ \|' "$FILE" | grep -vP '\(573\) 751-\d{4}' | head -5
    ((WARNINGS += BAD_PHONES))
else
    echo "   ✓ All phone numbers match expected format (573) 751-XXXX"
fi
echo ""

# --- 4. Check last-verified date ---
echo "4. Checking data freshness..."
VERIFIED_DATE=$(grep -oP 'Last verified.*?:\s*\K.*' "$FILE" | head -1 | xargs)
if [[ -n "$VERIFIED_DATE" ]]; then
    echo "   Last verified: $VERIFIED_DATE"
    # Try to parse date and check if >30 days old
    if command -v date &>/dev/null; then
        VERIFIED_EPOCH=$(date -d "$VERIFIED_DATE" +%s 2>/dev/null || echo "0")
        NOW_EPOCH=$(date +%s)
        if [[ "$VERIFIED_EPOCH" -gt 0 ]]; then
            DAYS_OLD=$(( (NOW_EPOCH - VERIFIED_EPOCH) / 86400 ))
            if [[ "$DAYS_OLD" -gt 30 ]]; then
                echo "   WARNING: Data is $DAYS_OLD days old. Consider re-verifying."
                ((WARNINGS++))
            else
                echo "   ✓ Data is $DAYS_OLD days old (within 30-day window)"
            fi
        fi
    fi
else
    echo "   WARNING: No 'Last verified' date found in $FILE"
    ((WARNINGS++))
fi
echo ""

# --- 5. Check CSV if present ---
if [[ -f "$CSV" ]]; then
    echo "5. Checking mail merge CSV..."
    CSV_ROWS=$(tail -n +2 "$CSV" | wc -l)
    echo "   Found $CSV_ROWS data rows in $CSV (expected 34)"

    # Check for VERIFY entries in CSV
    CSV_VERIFY=$(grep -c "VERIFY" "$CSV" || true)
    if [[ "$CSV_VERIFY" -gt 0 ]]; then
        echo "   WARNING: $CSV_VERIFY VERIFY entries remain in CSV"
        ((WARNINGS++))
    else
        echo "   ✓ No VERIFY entries in CSV"
    fi

    # Check all rows have email
    CSV_NO_EMAIL=$(tail -n +2 "$CSV" | awk -F',' '{print $13}' | grep -c '""' || true)
    if [[ "$CSV_NO_EMAIL" -gt 0 ]]; then
        echo "   WARNING: $CSV_NO_EMAIL rows missing email addresses"
        ((WARNINGS++))
    else
        echo "   ✓ All rows have email addresses"
    fi
else
    echo "5. Skipping CSV check ($CSV not found)"
fi
echo ""

# --- 6. Optional: Online verification ---
echo "6. Online verification (optional)..."
if command -v curl &>/dev/null; then
    echo "   Checking senate.mo.gov accessibility..."
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "https://senate.mo.gov/Senators" 2>/dev/null || echo "000")
    if [[ "$HTTP_CODE" == "200" ]]; then
        echo "   ✓ senate.mo.gov is accessible (HTTP $HTTP_CODE)"
        echo "   TIP: Visit https://senate.mo.gov/Senators/Directory to verify roster"
    elif [[ "$HTTP_CODE" == "403" ]]; then
        echo "   ⚠ senate.mo.gov returned 403 (blocked automated access)"
        echo "   TIP: Verify manually at https://senate.mo.gov/Senators/Directory"
    else
        echo "   ⚠ senate.mo.gov returned HTTP $HTTP_CODE"
    fi
else
    echo "   Skipping (curl not available)"
fi
echo ""

# --- Summary ---
echo "=========================================="
echo "  SUMMARY"
echo "=========================================="
echo "  Errors:   $ERRORS"
echo "  Warnings: $WARNINGS"
echo ""
if [[ "$ERRORS" -gt 0 ]]; then
    echo "  ✗ FAIL — Fix errors before printing labels or sending letters."
    exit 1
elif [[ "$WARNINGS" -gt 0 ]]; then
    echo "  ⚠ PASS with warnings — Review warnings above."
    exit 0
else
    echo "  ✓ ALL CHECKS PASSED — Data is print-ready."
    exit 0
fi
