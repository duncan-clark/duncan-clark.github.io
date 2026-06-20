# Format bibtex::read.bib entries as clean markdown citations for Jekyll.

normalize_text <- function(x) {
  x <- gsub("[{}]", "", x)
  x <- iconv(x, from = "", to = "UTF-8", sub = "-")
  x <- gsub("\u2010|\u2011|\u2012|\u2013|\u2014|\u2212", "-", x, perl = TRUE)
  x <- gsub("\\s+", " ", x)
  trimws(x)
}

author_string <- function(authors) {
  parts <- vapply(
    seq_along(authors),
    function(i) {
      person <- authors[[i]]
      given_parts <- unlist(strsplit(person$given, "\\s+"))
      given_parts <- gsub("[^A-Za-z]", "", given_parts)
      given_parts <- given_parts[nzchar(given_parts)]
      initials <- paste0(substr(given_parts, 1, 1), collapse = "")
      paste0(person$family, " ", initials)
    },
    character(1)
  )
  paste(parts, collapse = ", ")
}

format_bib_entry <- function(entry) {
  fields <- entry[[1]]
  authors <- author_string(fields$author)
  title <- normalize_text(fields$title)
  year <- fields$year

  if (!is.null(fields$journal)) {
    journal <- normalize_text(fields$journal)
    volume <- fields$volume
    number <- fields$number
    pages <- fields$pages
    doi <- fields$doi

    vol_part <- if (!is.null(volume)) {
      if (!is.null(number)) {
        paste0("*", volume, "*(", number, ")")
      } else {
        paste0("*", volume, "*")
      }
    } else {
      ""
    }

    page_part <- if (!is.null(pages)) paste0(", ", pages) else ""
    doi_part <- if (!is.null(doi)) {
      paste0(" [doi:", doi, "](https://doi.org/", doi, ")")
    } else {
      ""
    }

    paste0(
      authors, " (", year, '). "', title, '." *',
      journal, "*", if (nzchar(vol_part)) paste0(", ", vol_part) else "",
      page_part, ".", doi_part
    )
  } else if (!is.null(fields$eprint)) {
    url <- if (!is.null(fields$url)) fields$url else paste0("https://arxiv.org/abs/", fields$eprint)
    paste0(
      authors, " (", year, '). "', title, '." [arXiv:',
      fields$eprint, "](", url, ")"
    )
  } else if (!is.null(fields$note)) {
    note <- normalize_text(fields$note)
    paste0(authors, " (", year, '). "', title, '." ', note, ".")
  } else {
    paste0(authors, " (", year, '). "', title, '."')
  }
}

format_bib_keys <- function(biblio, keys) {
  lines <- vapply(keys, function(key) format_bib_entry(biblio[key]), character(1))
  paste(lines, collapse = "\n\n")
}
