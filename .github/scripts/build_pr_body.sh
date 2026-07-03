#!/usr/bin/env bash
set -euo pipefail

PR_BODY_PATH="${PR_BODY_PATH:-/tmp/pr_body.md}"
INCLUDE_SUMMARIES="${INCLUDE_SUMMARIES:-false}"
GENERATOR_SUMMARY_PATH="${GENERATOR_SUMMARY_PATH:-}"
REVISION_SUMMARY_PATH="${REVISION_SUMMARY_PATH:-}"

{
  printf 'Closes #%s\n\n' "${ISSUE_NUMBER}"
  printf 'Generated from issue #%s.\n\n' "${ISSUE_NUMBER}"

  if [ "$INCLUDE_SUMMARIES" = "true" ]; then
    if [ ! -f "$GENERATOR_SUMMARY_PATH" ]; then
      echo "Missing generator summary: $GENERATOR_SUMMARY_PATH" >&2
      exit 1
    fi

    if [ ! -f "$REVISION_SUMMARY_PATH" ]; then
      echo "Missing revision summary: $REVISION_SUMMARY_PATH" >&2
      exit 1
    fi

    printf 'Generator summary:\n\n```md\n'
    cat "$GENERATOR_SUMMARY_PATH"
    printf '\n```\n\nRevision summary:\n\n```md\n'
    cat "$REVISION_SUMMARY_PATH"
    printf '\n```\n'
  else
    printf 'Review the generated application materials before merging.\n'
  fi
} > "$PR_BODY_PATH"
