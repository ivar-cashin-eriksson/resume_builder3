#!/usr/bin/env bash
set -euo pipefail

: "${ISSUE_TITLE:?ISSUE_TITLE is required}"
: "${ISSUE_LABELS:?ISSUE_LABELS is required}"
: "${LISTING_SLUG:?LISTING_SLUG is required}"
: "${OUTPUT_DIR:?OUTPUT_DIR is required}"

ISSUE_BODY="${ISSUE_BODY:-}"

RUNTIME_DIR=".github/codex/runtime"
mkdir -p "$RUNTIME_DIR"

cat > "$RUNTIME_DIR/application_context.md" <<EOF
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
- Every major claim in the CV and cover letter must be traceable to a profile YAML file or previous application example.
- Prefer omission over unsupported claims.
- Compile PDFs when possible.
- Only the briefing step may use web search. Later steps must not browse the web.
EOF

cat prompts/application_briefing.md "$RUNTIME_DIR/application_context.md" > "$RUNTIME_DIR/briefing_prompt.md"
cat prompts/application_generator.md "$RUNTIME_DIR/application_context.md" > "$RUNTIME_DIR/generator_prompt.md"
cat prompts/application_fit_critic.md "$RUNTIME_DIR/application_context.md" > "$RUNTIME_DIR/fit_critic_prompt.md"
cat prompts/application_style_critic.md "$RUNTIME_DIR/application_context.md" > "$RUNTIME_DIR/style_critic_prompt.md"
cat prompts/application_revision.md "$RUNTIME_DIR/application_context.md" > "$RUNTIME_DIR/revision_prompt.md"
