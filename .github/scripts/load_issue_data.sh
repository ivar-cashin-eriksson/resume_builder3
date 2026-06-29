#!/usr/bin/env bash
set -euo pipefail

mkdir -p .github/codex

ISSUE_NUMBER="${ISSUE_NUMBER:-}"

if [ -z "$ISSUE_NUMBER" ]; then
  echo "No issue number found." >&2
  exit 1
fi

gh issue view "$ISSUE_NUMBER" \
  --json number,title,body,author,labels \
  > .github/codex/runtime_issue.json

AUTHOR=$(jq -r '.author.login' .github/codex/runtime_issue.json)
LABELS=$(jq -r '[.labels[].name] | join(", ")' .github/codex/runtime_issue.json)

if [ "$AUTHOR" != "ivar-cashin-eriksson" ]; then
  echo "Issue author is $AUTHOR, expected ivar-cashin-eriksson." >&2
  exit 1
fi

if ! jq -e '.labels[].name == "job-application"' .github/codex/runtime_issue.json >/dev/null; then
  echo "Issue does not have label: job-application." >&2
  exit 1
fi

{
  echo "number=$(jq -r '.number' .github/codex/runtime_issue.json)"
  echo "title=$(jq -r '.title' .github/codex/runtime_issue.json)"
  echo "labels=$LABELS"

  echo "body<<EOF"
  jq -r '.body // ""' .github/codex/runtime_issue.json
  echo "EOF"
} >> "$GITHUB_OUTPUT"
