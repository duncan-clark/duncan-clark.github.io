# CV source and build

LaTeX source for Duncan A. Clark's academic CV. Publications are kept in sync with [`../_pages/research.MD`](../_pages/research.MD) and [`../_pages/bib.bib`](../_pages/bib.bib).

## Layout

```
Duncan_Clark_CV/
  CV.tex              # current working CV (edit this)
  bib.bib             # bibliography for CV.tex
  industry_resume.tex # separate industry resume
  build.sh            # compile PDF and archive snapshot
  archive/
    YYYY-MM-DD/       # one folder per update (typically annual)
      CV.tex
      bib.bib
      CV.pdf
      Duncan_Clark_CV.pdf
```

## Annual update workflow

1. Edit `CV.tex` and `bib.bib` (align publications with the research page).
2. Run `./build.sh` from this directory.
3. The script will:
   - compile `CV.pdf`
   - copy the PDF to `../files/Duncan_Clark_CV.pdf` (linked from the website)
   - snapshot `CV.tex`, `bib.bib`, and the PDF into `archive/YYYY-MM-DD/`

To archive under a specific date:

```sh
./build.sh 2026-06-20
```

## Requirements

- `pdflatex` and `bibtex` (run twice for bibliography)
- `natbib` / `bibentry` (standard TeX Live install)

## Website link

The CV page at `/CV/` links to `/files/Duncan_Clark_CV.pdf`. Re-run `build.sh` after changes to publish an updated PDF.
