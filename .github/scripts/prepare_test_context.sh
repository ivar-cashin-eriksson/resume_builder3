#!/usr/bin/env bash
set -euo pipefail

: "${LISTING_SLUG:?LISTING_SLUG is required}"
: "${OUTPUT_DIR:?OUTPUT_DIR is required}"

RUNTIME_DIR="${RUNTIME_DIR:-/tmp/codex-runtime}"
mkdir -p "$RUNTIME_DIR"

cat > .github/codex/runtime/application_context.md <<EOF

# Application Context

- listing_slug: $LISTING_SLUG
- output_dir: $OUTPUT_DIR

EOF

cat prompts/test_prompt.md .github/codex/runtime/application_context.md > .github/codex/runtime/test_prompt.md
