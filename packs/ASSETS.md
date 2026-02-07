# Evidence assets (Release index)

Latest release: `evidence-v0.1`

Assets included:
- `TER_API_external_safe_bundle_20260206.zip` (+ `.zip.sha256`)
- `api_live_20260206T090053Z_reset__external_safe.zip` (+ `.zip.sha256`)
- `api_live_20260206T090104Z_reset__external_safe.zip` (+ `.zip.sha256`)
- `api_live_20260206T090107Z_reset__external_safe.zip` (+ `.zip.sha256`)

Verification:
1) Download an asset and its `.sha256`
2) Run `shasum -a 256 -c <file>.sha256` from the directory containing the files
3) For the bundle, you may also run `validator/verify_bundle.sh <bundle.zip>`
