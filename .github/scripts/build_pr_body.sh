#!/usr/bin/env bash
set -euo pipefail

{
  printf 'Closes #%s\n\n' "${ISSUE_NUMBER}"
  printf 'Generated from issue #%s.\n\n' "${ISSUE_NUMBER}"
  printf '\n```\n'
} > .github/codex/runtime/pr_body.md
