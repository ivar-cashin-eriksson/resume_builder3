#!/usr/bin/env bash
set -euo pipefail

PR_BODY_PATH="${PR_BODY_PATH:-/tmp/pr_body.md}"

{
  printf 'Closes #%s\n\n' "${ISSUE_NUMBER}"
  printf 'Generated from issue #%s.\n\n' "${ISSUE_NUMBER}"
  printf 'Review the generated application materials before merging.\n'
} > "$PR_BODY_PATH"