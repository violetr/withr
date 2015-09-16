# locale ---------------------------------------------------------------------

set_locale <- function(cats) {
  stopifnot(is.named(cats), is.character(cats))

  old <- vapply(names(cats), Sys.getlocale, character(1))

  mapply(Sys.setlocale, names(cats), cats)
  invisible(old)
}

#' Locale settings
#'
#' Temporarily change locale settings.
#'
#' @template with
#' @param new \code{[named character]}\cr New locale settings
#' @seealso \code{\link{Sys.setlocale}}
#' @export
with_locale <- with_something(set_locale)