#!/bin/bash
set -euo pipefail

# MO-Gov SessionStart Hook
# Shows pipeline status, session deadlines, and data quality on project open

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# --- Data quality check (silent unless issues) ---
VALIDATE_OUTPUT=""
if [ -f "./validate-legislators.sh" ]; then
  VALIDATE_OUTPUT=$(bash ./validate-legislators.sh 2>/dev/null | grep -E '(ERROR|WARNING|✗)' || true)
fi

# --- Session deadline calculation ---
TODAY=$(date +%s)
NEXT_DEADLINE=""
NEXT_EVENT=""
NEXT_DATE_STR=""

check_deadline() {
  local deadline_epoch
  deadline_epoch=$(date -d "$1" +%s 2>/dev/null || echo "0")
  if [ "$deadline_epoch" -gt "$TODAY" ] && [ -z "$NEXT_DEADLINE" ]; then
    NEXT_DEADLINE="$deadline_epoch"
    NEXT_EVENT="$2"
    NEXT_DATE_STR="$1"
  fi
}

check_deadline "2026-02-27" "Senate filing deadline"
check_deadline "2026-03-01" "House filing deadline"
check_deadline "2026-04-15" "Last day for House consent bills on Senate calendar"
check_deadline "2026-05-08" "Last day for floor action on appropriation bills"
check_deadline "2026-05-15" "LAST DAY OF SESSION"
check_deadline "2026-09-16" "Veto session"

# --- Repo stats ---
FILE_COUNT=$(find . -maxdepth 1 -type f ! -name '.*' | wc -l)
LAST_COMMIT=$(git log -1 --format="%ar" 2>/dev/null || echo "unknown")

# --- Output ---
echo ""
echo "=== MO-Gov Advocacy Navigator ==="
echo "Files: $FILE_COUNT | Last commit: $LAST_COMMIT"

if [ -n "$NEXT_DEADLINE" ]; then
  DAYS_LEFT=$(( (NEXT_DEADLINE - TODAY) / 86400 ))
  echo "Next deadline: $NEXT_EVENT ($NEXT_DATE_STR, ${DAYS_LEFT}d away)"
else
  echo "Session ended. Next: check for interim activity."
fi

if [ -n "$VALIDATE_OUTPUT" ]; then
  echo "DATA ISSUES:"
  echo "$VALIDATE_OUTPUT"
else
  echo "Data: All checks passing"
fi

echo "Pipeline: Check Airtable MO-Gov Legislators for overdue follow-ups"
echo "=================================="
echo ""
