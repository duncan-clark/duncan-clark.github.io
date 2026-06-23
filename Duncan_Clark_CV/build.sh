#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
DATE="${1:-$(date +%Y-%m-%d)}"
ARCHIVE="$ROOT/archive/$DATE"
SITE_PDF="$ROOT/../files/Duncan_Clark_CV.pdf"

cd "$ROOT"

if ! command -v pdflatex >/dev/null 2>&1; then
  echo "Error: pdflatex not found. Install TeX Live or MacTeX." >&2
  exit 1
fi

echo "Compiling CV..."
pdflatex -interaction=nonstopmode CV.tex >/dev/null || true
bibtex CV >/dev/null || true
pdflatex -interaction=nonstopmode CV.tex >/dev/null || true
pdflatex -interaction=nonstopmode CV.tex >/dev/null || true

if [[ ! -f CV.pdf ]]; then
  echo "Error: CV.pdf was not produced." >&2
  exit 1
fi

mkdir -p "$ARCHIVE"
cp CV.tex bib.bib CV.pdf "$ARCHIVE/"
cp CV.pdf "$ARCHIVE/Duncan_Clark_CV.pdf"

cp CV.pdf "$SITE_PDF"

echo "Published: $SITE_PDF"
echo "Archived:  $ARCHIVE/"
