# Duncan A. Clark — Personal Site

Academic portfolio site for [duncan-clark.github.io](https://duncan-clark.github.io), built with [Beautiful Jekyll](https://github.com/daattali/beautiful-jekyll) and extended with R Markdown for research and project pages.

## Site structure

- `index.html` — homepage
- `_pages/research.MD` — publications (source: `_pages/research.Rmd`)
- `_pages/CV.MD` — CV download page
- `_pages/*.md` — older project write-ups (not linked from the navbar)
- `_config.yml` — site title, navigation, social links, colors
- `deprecated/` — archived blog, comments, and duplicate pages (not published; see `deprecated/README.md`)

## Updating research pages from R Markdown

Some pages are generated from `.Rmd` files in `_pages/`. After editing an Rmd source:

```r
source("R/build.R")
```

This knits Rmd files to Markdown. Check that YAML front matter (title, permalink, subtitle) is preserved in the output — `research.Rmd` includes front matter that should carry through to `research.MD`.

## Local preview

```sh
bundle install
bundle exec jekyll serve
```

Then open http://localhost:4000

## Deployment

Push to the `main` branch on GitHub. GitHub Pages builds and publishes the site automatically using its own Jekyll environment (newer than the local `github-pages` gem in `Gemfile`).

To re-enable analytics, add a GA4 measurement ID to `_config.yml`:

```yaml
gtag: "G-XXXXXXXXXX"
```

---

The remainder of this file is the upstream Beautiful Jekyll documentation.
