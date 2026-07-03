#!/usr/bin/env bash
set -euo pipefail

: "${LISTING_SLUG:?LISTING_SLUG is required}"
: "${OUTPUT_DIR:?OUTPUT_DIR is required}"
: "${PROMPT_FILE:?PROMPT_FILE is required}"


RUNTIME_DIR=".github/codex/runtime"
mkdir -p "$RUNTIME_DIR"

PROMPT_BASENAME="$(basename "$PROMPT_FILE")"
RUNTIME_PROMPT_FILE="$RUNTIME_DIR/$PROMPT_BASENAME"

cat > "$RUNTIME_DIR/application_context.md" <<EOF

# Application Context

- listing_slug: $LISTING_SLUG
- output_dir: $OUTPUT_DIR

EOF

cat "$PROMPT_FILE" "$RUNTIME_DIR/application_context.md" > "$RUNTIME_PROMPT_FILE"

{
  echo "runtime_prompt_file=$RUNTIME_PROMPT_FILE"
} >> "$GITHUB_OUTPUT"