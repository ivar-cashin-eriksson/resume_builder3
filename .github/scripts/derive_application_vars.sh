#!/usr/bin/env bash
set -euo pipefail

# Check required variables exist
: "${ISSUE_TITLE:?ISSUE_TITLE is required}"
: "${ISSUE_NUMBER:?ISSUE_NUMBER is required}"

# Define variables
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
BRANCH_NAME="application/${LISTING_SLUG}"

# Output cross-job variables
{
  echo "listing_slug=$LISTING_SLUG"
  echo "output_dir=$OUTPUT_DIR"
  echo "branch_name=$BRANCH_NAME"
} >> "$GITHUB_OUTPUT"