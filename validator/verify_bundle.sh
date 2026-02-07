#!/usr/bin/env bash
set -euo pipefail

BUNDLE_ZIP="${1:-}"
if [[ -z "${BUNDLE_ZIP}" ]]; then
  echo "Usage: $0 <bundle.zip>"
  exit 2
fi

SHA_FILE="${BUNDLE_ZIP}.sha256"
if [[ ! -f "${SHA_FILE}" ]]; then
  echo "Missing sha256 file: ${SHA_FILE}"
  exit 2
fi

echo "[1/3] Verify bundle sha256..."
shasum -a 256 -c "${SHA_FILE}"

echo "[2/3] Unzip to temp dir..."
TMP="$(mktemp -d)"
unzip -q "${BUNDLE_ZIP}" -d "${TMP}"

echo "[3/3] Verify internal pack checksums..."
# Find all checksums.sha256 inside the unzipped tree and verify each
FOUND=0
while IFS= read -r -d '' f; do
  FOUND=1
  d="$(dirname "$f")"
  (cd "$d" && shasum -a 256 -c checksums.sha256)
done < <(find "${TMP}" -name "checksums.sha256" -print0)

if [[ "${FOUND}" -eq 0 ]]; then
  echo "No internal checksums.sha256 found inside bundle."
  exit 3
fi

echo "OK: bundle verified"
