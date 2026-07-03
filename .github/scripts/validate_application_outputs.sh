#!/usr/bin/env bash
set -euo pipefail

PHASE="${1:?usage: validate_application_outputs.sh briefing|critics}"
RUNTIME_DIR=".github/codex/runtime"

case "$PHASE" in
  briefing)
    : "${OUTPUT_DIR:?OUTPUT_DIR is required}"

    if [ ! -f "$OUTPUT_DIR/job_analysis.md" ]; then
      echo "Missing briefing output: $OUTPUT_DIR/job_analysis.md" >&2
      exit 1
    fi
    ;;

  critics)
    for file in "$RUNTIME_DIR/fit_critic.yaml" "$RUNTIME_DIR/style_critic.yaml"; do
      if [ ! -f "$file" ]; then
        echo "Missing critic output: $file" >&2
        exit 1
      fi
    done

    grep -q '^listing_slug:' "$RUNTIME_DIR/fit_critic.yaml"
    grep -q '^verdict:' "$RUNTIME_DIR/fit_critic.yaml"
    grep -q '^score:' "$RUNTIME_DIR/fit_critic.yaml"
    grep -q '^must_fix:' "$RUNTIME_DIR/fit_critic.yaml"
    grep -q '^recommended_edits:' "$RUNTIME_DIR/fit_critic.yaml"

    grep -q '^listing_slug:' "$RUNTIME_DIR/style_critic.yaml"
    grep -q '^verdict:' "$RUNTIME_DIR/style_critic.yaml"
    grep -q '^score:' "$RUNTIME_DIR/style_critic.yaml"
    grep -q '^style_mismatches:' "$RUNTIME_DIR/style_critic.yaml"
    grep -q '^recommended_edits:' "$RUNTIME_DIR/style_critic.yaml"
    ;;

  *)
    echo "Unknown validation phase: $PHASE" >&2
    exit 1
    ;;
esac
