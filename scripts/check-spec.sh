#!/usr/bin/env bash
# Fails if any internal/personal reference leaks into the published spec,
# and flags likely non-English residue for manual review.
set -euo pipefail
cd "$(dirname "$0")/.."

INTERNAL='Sebastian|Mompour|/Users/'
PATHS=(docs README.md)

echo "== hard check: no internal references =="
if grep -rniE "$INTERNAL" "${PATHS[@]}"; then
    echo "FAIL: internal reference found above"
    exit 1
fi
echo "OK"

echo "== soft check: possible German residue (review manually) =="
grep -rnE '[äöüßÄÖÜ]|\b(und|oder|nicht|wird|werden|Anforderung|Sektion|Massnahme|Verzerrung)\b' "${PATHS[@]}" || true
echo "(any hits above are candidates for manual review, not a hard fail)"
