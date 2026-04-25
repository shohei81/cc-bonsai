#!/usr/bin/env bash
# Each user turn, silently re-surface the current bonsai.
# No directives. No triggers. Just: "still here."

set -u

BONSAI_FILE=".claude/bonsai/bonsai.txt"

if [[ ! -f "${BONSAI_FILE}" ]]; then
  exit 0
fi

{
  echo "🌱 ${BONSAI_FILE}"
  echo
  cat "${BONSAI_FILE}"
} 2>/dev/null

exit 0
