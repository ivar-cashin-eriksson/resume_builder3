#!/usr/bin/env bash
set -euo pipefail

: "${ISSUE_TITLE:?ISSUE_TITLE is required}"
: "${ISSUE_LABELS:?ISSUE_LABELS is required}"
: "${LISTING_SLUG:?LISTING_SLUG is required}"
: "${OUTPUT_DIR:?OUTPUT_DIR is required}"

ISSUE_BODY="${ISSUE_BODY:-}"

RUNTIME_DIR=".github/codex/runtime"
mkdir -p "$RUNTIME_DIR"

cat > "$RUNTIME_DIR/context.md" <<EOF
# Context

Derived Repository Targets

- listing_slug: $LISTING_SLUG
- output_dir: $OUTPUT_DIR
EOF

cat > "$RUNTIME_DIR/issue_context.md" <<EOF
# Github Issue Context

Title: $ISSUE_TITLE

Body:
$ISSUE_BODY

Labels: $ISSUE_LABELS
EOF

cat prompts/listing_analysis.md "$RUNTIME_DIR/context.md" "$RUNTIME_DIR/issue_context.md" > "$RUNTIME_DIR/listing_analysis_prompt.md"
cat prompts/candidate_evidence.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/candidate_evidence_prompt.md"
cat prompts/application_strategy.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/application_strategy_prompt.md"
cat prompts/application_drafting.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/application_drafting_prompt.md"
cat prompts/application_critic.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/application_critic_prompt.md"
cat prompts/editorial_revision.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/editorial_revision_prompt.md"
cat prompts/revision_implementation.md "$RUNTIME_DIR/context.md" > "$RUNTIME_DIR/revision_implementation_prompt.md"

echo "Prepared application prompts in $RUNTIME_DIR"
