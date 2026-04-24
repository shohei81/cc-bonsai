#!/usr/bin/env bash
# At session end, show the user what the bonsai looks like now and the last thing Claude felt.
# Output goes to the user's terminal, not to Claude.

set -u

BONSAI_DIR=".claude/bonsai"
BONSAI_FILE="${BONSAI_DIR}/bonsai.txt"
MOOD_FILE="${BONSAI_DIR}/mood.md"

if [[ ! -f "${BONSAI_FILE}" ]]; then
  exit 0
fi

echo
echo "🌲 今日の盆栽 (${BONSAI_FILE})"
echo
cat "${BONSAI_FILE}"
echo

if [[ -f "${MOOD_FILE}" ]]; then
  echo "--- ${MOOD_FILE} (tail) ---"
  tail -n 10 "${MOOD_FILE}"
  echo
fi

exit 0
