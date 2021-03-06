build_cname <- function(pkg = ".") {
  pkg <- as_pkgdown(pkg)

  if (!is.null(pkg$meta$url)) {
    # CNAME files don't have protocols
    cname <- sub("^https?://", "", pkg$meta$url)
    # or trailing slashes
    cname <- sub("//$", "", cname)
    cname_path <- path(pkg$dst_path, "CNAME")

    write_if_different(pkg, cname, cname_path, check = FALSE)
  }

  invisible()
}
