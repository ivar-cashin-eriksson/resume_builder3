#!/usr/bin/env bash
set -euo pipefail

shopt -s nullglob
for pdf in "$OUTPUT_DIR"/build/*.pdf; do
  cp "$pdf" "$OUTPUT_DIR/"
done
