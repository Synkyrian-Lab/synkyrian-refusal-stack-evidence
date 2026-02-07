# Synkyria Refusal Stack — Evidence (External-Safe)

This repository hosts **external-safe evidence bundles** for independent verification.
Large artifacts are published as **GitHub Release assets** (not tracked in git history).

## Folder structure
- `packs/` (small index files only; large `.zip` files live in Releases)
- `validator/` minimal verification scripts
- `CHECKSUMS.sha256` top-level checksums for released bundles (mirrors release assets)

## How to verify a bundle
1) Download the bundle `.zip` and its `.zip.sha256` from the latest Release.
2) Verify (run from the directory containing the downloaded files):
   - `shasum -a 256 -c <bundle>.zip.sha256`
3) Unzip and verify per-pack:
   - `shasum -a 256 -c checksums.sha256` (inside each pack directory)
