#!/usr/bin/env bash
# Each user turn, silently re-surface the current bonsai.
# No directives. No triggers. Just: "still here."

set -u

BONSAI_DIR=".claude/bonsai"
BONSAI_FILE="${BONSAI_DIR}/bonsai.txt"

if [[ ! -f "${BONSAI_FILE}" ]]; then
  exit 0
fi

{
  echo "🌱 ${BONSAI_FILE}"
  echo
  cat "${BONSAI_FILE}"
  echo
} 2>/dev/null

exit 0
