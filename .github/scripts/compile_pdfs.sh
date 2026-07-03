#!/usr/bin/env bash
set -euo pipefail

: "${OUTPUT_DIR:?OUTPUT_DIR is required}"

cd "$OUTPUT_DIR"
mkdir -p build

shopt -s nullglob
tex_files=(*.tex)

if [ ${#tex_files[@]} -eq 0 ]; then
  echo "No .tex files found in $OUTPUT_DIR" >&2
  exit 1
fi

for tex_file in "${tex_files[@]}"; do
  pdflatex -interaction=nonstopmode -output-directory=build "$tex_file"
  pdflatex -interaction=nonstopmode -output-directory=build "$tex_file"
done