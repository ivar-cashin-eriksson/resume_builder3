#!/usr/bin/env bash
set -euo pipefail

: "${ISSUE_NUMBER:?ISSUE_NUMBER is required}"

PR_BODY_PATH="${PR_BODY_PATH:-/tmp/pr_body.md}"
RENDER_STATUS_MESSAGE="${RENDER_STATUS_MESSAGE:-}"

{
  printf 'Closes #%s\n\n' "$ISSUE_NUMBER"
  printf 'Generated from issue #%s.\n\n' "$ISSUE_NUMBER"

  if [ -n "$RENDER_STATUS_MESSAGE" ]; then
    printf '%s\n\n' "$RENDER_STATUS_MESSAGE"
  fi

  printf 'Review the generated application materials before merging.\n'
} > "$PR_BODY_PATH"