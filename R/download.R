# Download (once) and read the rgeomex datasets ------------------------------
#
# The datasets are GeoParquet files published in the release "data-v1" of
# https://github.com/fdzul/rgeomex-py (the same files are used by the Python
# version). Each file is downloaded the first time it is used, verified with
# its SHA-256 and kept in a local cache.

.data_tag <- "data-v1"
.base_url <- "https://github.com/fdzul/rgeomex-py/releases/download/"

# datasets split by state (one file per state, "01".."32")
.by_state <- c("AGEB_inegi_2019", "blocks_ine20_mx", "blocks_ine20_mx_centroid",
               "sectores_ine20_mx")
# whole datasets
.whole <- c("AGEE_inegi19_mx", "AGEM_inegi19_mx", "AGEM_inegi25_mx",
            "loc_inegi19_mx", "hrl_mx", "pua_mx", "ua_mx", "iter_2020_loc")

# datasets already read in this session
.mem <- new.env(parent = emptyenv())

.registry <- function() {
    f <- system.file("extdata", "registry.txt", package = "rgeomex")
    x <- utils::read.table(f, col.names = c("file", "sha256"),
                           stringsAsFactors = FALSE)
    stats::setNames(sub("^sha256:", "", x$sha256), x$file)
}

#' Folder of the downloaded datasets
#'
#' The datasets of rgeomex are downloaded the first time they are used and
#' kept in this folder. By default it is the user cache folder of R
#' (`tools::R_user_dir("rgeomex", "cache")`). Set the environment variable
#' `RGEOMEX_DATA_DIR` (or the option `rgeomex.data_dir`) to use another
#' folder, for example a shared folder or a folder that already has the files
#' (offline use).
#'
#' @return the path of the folder.
#' @export
#' @examples
#' rgeomex_cache_dir()
rgeomex_cache_dir <- function() {
    d <- getOption("rgeomex.data_dir", Sys.getenv("RGEOMEX_DATA_DIR"))
    if (!nzchar(d)) d <- tools::R_user_dir("rgeomex", which = "cache")
    d
}

#' Delete the downloaded datasets
#'
#' Deletes the GeoParquet files of the cache folder. They are downloaded
#' again when they are needed.
#'
#' @return the number of deleted files, invisibly.
#' @export
#' @examples
#' \dontrun{
#' rgeomex_clear_cache()
#' }
rgeomex_clear_cache <- function() {
    f <- list.files(rgeomex_cache_dir(), pattern = "\\.parquet$",
                    full.names = TRUE)
    unlink(f)
    rm(list = ls(.mem), envir = .mem)
    invisible(length(f))
}

.sha256 <- function(path) {
    if (exists("sha256sum", envir = asNamespace("tools"), inherits = FALSE)) {
        return(unname(get("sha256sum", envir = asNamespace("tools"))(path)))
    }
    if (requireNamespace("openssl", quietly = TRUE)) {
        con <- file(path, "rb")
        on.exit(close(con))
        h <- openssl::sha256(con)
        h <- as.character(h)
        attributes(h) <- NULL
        return(gsub(":", "", h, fixed = TRUE))
    }
    NA_character_
}

.fetch <- function(file) {
    reg <- .registry()
    if (!file %in% names(reg)) stop("unknown file ", file, call. = FALSE)
    dir <- rgeomex_cache_dir()
    path <- file.path(dir, file)
    if (file.exists(path)) return(path)
    dir.create(dir, recursive = TRUE, showWarnings = FALSE)
    url <- paste0(.base_url, .data_tag, "/", file)
    message("Downloading ", file, " (first use only)")
    tmp <- tempfile(fileext = ".parquet", tmpdir = dir)
    on.exit(unlink(tmp))
    old <- options(timeout = max(600, getOption("timeout")))
    on.exit(options(old), add = TRUE)
    ok <- tryCatch(utils::download.file(url, tmp, mode = "wb", quiet = TRUE),
                   error = function(e) 1L)
    if (!identical(ok, 0L)) {
        stop("could not download ", url,
             "\nCheck the internet connection, or put the file in ", dir,
             call. = FALSE)
    }
    sha <- .sha256(tmp)
    if (!is.na(sha) && !identical(as.vector(sha), reg[[file]])) {
        stop("the downloaded file ", file, " is corrupted (SHA-256 does not match)",
             call. = FALSE)
    }
    file.copy(tmp, path, overwrite = TRUE)
    path
}

.read_parquet <- function(path) {
    x <- as.data.frame(nanoparquet::read_parquet(path))
    kv <- nanoparquet::read_parquet_metadata(path)$file_meta_data$key_value_metadata[[1]]
    geo <- kv$value[kv$key == "geo"]
    if (length(geo) == 0) return(x)
    geo <- jsonlite::fromJSON(geo, simplifyVector = FALSE)
    col <- geo$primary_column
    crs <- geo$columns[[col]]$crs
    crs <- if (is.null(crs)) sf::st_crs(4326) else
        sf::st_crs(as.character(jsonlite::toJSON(crs, auto_unbox = TRUE,
                                                 digits = NA)))
    g <- sf::st_as_sfc(structure(lapply(x[[col]], as.raw), class = "WKB"),
                       crs = crs)
    x[[col]] <- NULL
    x$geometry <- g
    sf::st_sf(x, sf_column_name = "geometry")
}

.read <- function(file) {
    if (!exists(file, envir = .mem, inherits = FALSE)) {
        assign(file, .read_parquet(.fetch(file)), envir = .mem)
    }
    get(file, envir = .mem)
}

.state_code <- function(cve_edo) {
    n <- suppressWarnings(as.integer(trimws(as.character(cve_edo))))
    if (any(is.na(n) | n < 1 | n > 32)) {
        stop("cve_edo must be state keys from 01 to 32", call. = FALSE)
    }
    sprintf("%02d", n)
}

.rbind <- function(parts) {
    if (length(parts) == 1) return(parts[[1]])
    do.call(rbind, parts)
}

#' Table of the available datasets
#'
#' @return a data.frame with the name of each dataset, whether it is split by
#'   state and whether it has geometry.
#' @export
#' @examples
#' rgeomex_datasets()
rgeomex_datasets <- function() {
    data.frame(dataset = c(.whole, .by_state),
               by_state = c(rep(FALSE, length(.whole)), rep(TRUE, length(.by_state))),
               geometry = c(.whole, .by_state) != "iter_2020_loc")
}

#' Load a dataset
#'
#' Reads a dataset of rgeomex. The file is downloaded the first time it is
#' used (see [rgeomex_cache_dir()]); later it is read from the cache.
#'
#' @param dataset name of the dataset (see [rgeomex_datasets()]), for example
#'   `"AGEM_inegi19_mx"` or `"blocks_ine20_mx"`.
#' @param cve_edo INEGI state key(s), from `"01"` to `"32"` (numbers are also
#'   accepted). It is required for the datasets split by state
#'   (`"AGEB_inegi_2019"`, `"blocks_ine20_mx"`, `"blocks_ine20_mx_centroid"`,
#'   `"sectores_ine20_mx"`); for the other datasets it filters the rows of the
#'   state(s).
#'
#' @return a sf object (a data.frame for `"iter_2020_loc"`).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#' @examples
#' \donttest{
#' yuc <- rgeomex_load("AGEM_inegi19_mx", cve_edo = "31")
#' blocks <- rgeomex_load("blocks_ine20_mx", cve_edo = "31")
#' }
rgeomex_load <- function(dataset, cve_edo = NULL) {
    if (dataset %in% .by_state) {
        if (is.null(cve_edo)) {
            stop(dataset, " is split by state: give cve_edo (01 to 32)",
                 call. = FALSE)
        }
        keys <- unique(.state_code(cve_edo))
        return(.rbind(lapply(keys, function(k) .read(paste0(dataset, "_", k, ".parquet")))))
    }
    if (dataset %in% .whole) {
        x <- .read(paste0(dataset, ".parquet"))
        if (!is.null(cve_edo)) {
            col <- intersect(c("CVE_ENT", "entidad"), names(x))[1]
            if (is.na(col)) {
                stop(dataset, " has no state column to filter by cve_edo",
                     call. = FALSE)
            }
            x <- x[sprintf("%02d", as.integer(x[[col]])) %in% .state_code(cve_edo), ]
            row.names(x) <- NULL
        }
        return(x)
    }
    stop("unknown dataset '", dataset, "'; see rgeomex_datasets()", call. = FALSE)
}
