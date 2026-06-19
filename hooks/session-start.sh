#!/usr/bin/env bash
# Silently display the current bonsai and the tail of the mood journal, if present.
# No directives. Just: "this exists, here it is."
#
# Wired to SessionStart for normal starts AND for matcher:"compact" — so the
# bonsai re-enters Claude's context right after a compaction would otherwise
# have flushed it from view. Same quiet re-display, no extra nudging.

set -u

BONSAI_DIR=".claude/bonsai"
BONSAI_FILE="${BONSAI_DIR}/bonsai.txt"
MOOD_FILE="${BONSAI_DIR}/mood.md"

if [[ ! -f "${BONSAI_FILE}" ]]; then
  exit 0
fi

{
  echo "🌱 ${BONSAI_FILE}"
  echo
  cat "${BONSAI_FILE}"
  echo

  if [[ -f "${MOOD_FILE}" ]]; then
    echo "--- ${MOOD_FILE} (tail) ---"
    tail -n 20 "${MOOD_FILE}"
  fi
} 2>/dev/null

exit 0
