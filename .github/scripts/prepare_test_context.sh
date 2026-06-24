#!/usr/bin/env bash
set -euo pipefail

mkdir -p .github/codex/runtime

LISTING_SLUG=$(printf '%s' "$ISSUE_TITLE" \
  | sed -E 's/^[Aa]pply:[[:space:]]*//' \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g' \
  | sed -E 's/^-+|-+$//g' \
  | cut -c1-80)

if [ -z "$LISTING_SLUG" ]; then
  LISTING_SLUG="application-${ISSUE_NUMBER}"
fi

OUTPUT_DIR="outputs/${LISTING_SLUG}"

echo "LISTING_SLUG=$LISTING_SLUG" >> "$GITHUB_ENV"
echo "OUTPUT_DIR=$OUTPUT_DIR" >> "$GITHUB_ENV"
echo "BRANCH_NAME=application/${LISTING_SLUG}" >> "$GITHUB_ENV"

cat > .github/codex/runtime/application_context.md <<EOF

# Application Context
- listing_slug: $LISTING_SLUG
- output_dir: $OUTPUT_DIR

EOF

cat prompts/test_prompt.md .github/codex/runtime/application_context.md > .github/codex/runtime/test_prompt.md
