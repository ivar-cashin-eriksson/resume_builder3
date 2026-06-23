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

## GitHub Issue

Title: $ISSUE_TITLE

Body:
$ISSUE_BODY

Labels: $ISSUE_LABELS

## Derived Repository Targets

- listing_slug: $LISTING_SLUG
- output_dir: $OUTPUT_DIR

## Hard Rules

- Use only facts found in the repository or the approved listing material.
- Do not invent experience, publications, grades, tools, employers, dates, awards, or achievements.
- Keep the tone direct, personal, factual, modest, and in British English.
- Make no changes outside \`$OUTPUT_DIR/\`.
- Every major claim in the test and cover letter must be traceable to a profile YAML file or previous application example.
- Prefer omission over unsupported claims.
- Compile PDFs when possible.
- Only the briefing step may use web search. Later steps must not browse the web.
EOF

cat prompts/test_prompt.md .github/codex/runtime/application_context.md > .github/codex/runtime/test_prompt.md
