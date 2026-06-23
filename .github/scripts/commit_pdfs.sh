#!/usr/bin/env bash
set -euo pipefail

pdfs=("$OUTPUT_DIR"/*.pdf)

if [ "${#pdfs[@]}" -eq 0 ]; then
  echo "No PDF files found to commit"
  exit 0
fi

if [ -z "$(git status --porcelain -- "${pdfs[@]}")" ]; then
  echo "No PDF changes to commit"
  exit 0
fi

git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

git add "${pdfs[@]}"
git commit -m "Update generated test PDF"
git push
