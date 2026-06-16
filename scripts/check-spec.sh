#!/usr/bin/env bash
# Fails if any internal/personal reference leaks into the published spec,
# and flags likely non-English residue for manual review.
set -euo pipefail
cd "$(dirname "$0")/.."

PATHS=(docs README.md)
# Legal pages must carry the maintainer's real name by law (imprint/privacy),
# so the name check skips them. Internal filesystem paths stay forbidden everywhere.
LEGAL_EXCLUDE=(--exclude=imprint.md --exclude=privacy.md)

echo "== hard check: no internal filesystem paths =="
if grep -rniE '/Users/' "${PATHS[@]}"; then
    echo "FAIL: internal path found above"
    exit 1
fi
echo "OK"

echo "== hard check: no personal references (legal pages excluded) =="
if grep -rniE 'Sebastian|Mompour' "${LEGAL_EXCLUDE[@]}" "${PATHS[@]}"; then
    echo "FAIL: personal reference found above"
    exit 1
fi
echo "OK"

echo "== soft check: possible German residue (review manually) =="
grep -rnIE '[äöüßÄÖÜ]|\b(und|oder|nicht|wird|werden|Anforderung|Sektion|Massnahme|Verzerrung)\b' "${PATHS[@]}" || true
echo "(any hits above are candidates for manual review, not a hard fail)"
