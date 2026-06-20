# Retired blog, comments, and duplicate pages

These files were removed from the live site during the 2026 audit but kept here so they can be restored later. The folder is excluded from the Jekyll build (see `_config.yml`).

## Contents

| Path | What it was |
|------|-------------|
| `_posts/` | Three blog posts (September 2019) |
| `blog/` | Paginated blog index |
| `blog.html` | Alternate blog listing page |
| `tags.html` | Tag index for posts |
| `feed.xml` | RSS feed |
| `_includes/disqus.html` | Disqus comment embed |
| `_includes/staticman-*.html` | Staticman comment templates |
| `css/staticman.css` | Staticman styles |
| `js/staticman.js` | Staticman form handler |
| `staticman.yml` | Staticman config |
| `_pages/resume.MD` | Duplicate CV page |
| `_pages/ODI Cricket App.md` | Duplicate ODI app page |
| `_layouts/page.html`, `post.html` | Layouts with comment blocks |
| `_includes/head-with-rss.html` | Head template with RSS link |
| `_config-retired-settings.yml` | Blog/comments config snippets for `_config.yml` |

## Restoring the blog

1. Copy files back to their original locations (mirror the directory structure under `deprecated/`):

   ```sh
   cp deprecated/_posts/* _posts/
   cp deprecated/blog/index.html blog/index.html
   cp deprecated/blog.html deprecated/tags.html deprecated/feed.xml .
   cp deprecated/_includes/disqus.html _includes/
   cp deprecated/_includes/staticman-*.html _includes/
   cp deprecated/css/staticman.css css/
   cp deprecated/js/staticman.js js/
   cp deprecated/staticman.yml .
   ```

2. Merge settings from `_config-retired-settings.yml` into `_config.yml` (disqus, paginate, post defaults, link-tags, prose block).

3. Restore comment blocks in `_layouts/page.html` and `_layouts/post.html` from `deprecated/_layouts/`, or re-add the `{% include disqus.html %}` sections manually.

4. Re-add the RSS `<link>` in `_includes/head.html` from `deprecated/_includes/head-with-rss.html`.

5. Add `jekyll-paginate` back to `plugins` and `Gemfile` if using local builds.

## Restoring a single page

Copy the file from `deprecated/` to the matching path at the repo root, e.g.:

```sh
cp "deprecated/_pages/ODI Cricket App.md" "_pages/ODI Cricket App.md"
```

Ensure the page has appropriate front matter and is not a duplicate of an existing page.
