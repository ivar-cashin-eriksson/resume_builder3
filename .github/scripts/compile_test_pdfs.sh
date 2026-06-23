#!/usr/bin/env bash
set -euo pipefail

cd "$OUTPUT_DIR"
mkdir -p build

pdflatex -interaction=nonstopmode -output-directory=build test.tex
pdflatex -interaction=nonstopmode -output-directory=build test.tex
