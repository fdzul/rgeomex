# Datasets of the previous versions of rgeomex (0.1.x), which were shipped in
# the package. They are kept with the same names (for example
# rgeomex::AGEM_inegi19_mx) so that the code that uses them keeps working: the
# first time one is used, its files are downloaded and read.
.legacy <- list(
    AGEE_inegi19_mx  = list("AGEE_inegi19_mx", NULL),
    AGEM_inegi19_mx  = list("AGEM_inegi19_mx", NULL),
    AGEM_inegi25_mx  = list("AGEM_inegi25_mx", NULL),
    loc_inegi19_mx   = list("loc_inegi19_mx", NULL),
    hrl_mx           = list("hrl_mx", NULL),
    pua_mx           = list("pua_mx", NULL),
    ua_mx            = list("ua_mx", NULL),
    iter_2020_loc    = list("iter_2020_loc", NULL),
    AGEB_inegi_2019_a = list("AGEB_inegi_2019", 1:16),
    AGEB_inegi_2019_b = list("AGEB_inegi_2019", 17:32),
    blocks_ine20_mx_a = list("blocks_ine20_mx", 1:10),
    blocks_ine20_mx_b = list("blocks_ine20_mx", 11:14),
    blocks_ine20_mx_c = list("blocks_ine20_mx", 15:19),
    blocks_ine20_mx_d = list("blocks_ine20_mx", 20:25),
    blocks_ine20_mx_e = list("blocks_ine20_mx", 26:32),
    blocks_ine20_mx_centroid = list("blocks_ine20_mx_centroid", 1:32),
    sectores_ine20_mx_a = list("sectores_ine20_mx", 1:10),
    sectores_ine20_mx_b = list("sectores_ine20_mx", 11:20),
    sectores_ine20_mx_c = list("sectores_ine20_mx", 21:32)
)

.bulk_access <- function() {
    if (identical(Sys.getenv("_R_CHECK_PACKAGE_NAME_"), "rgeomex") ||
        identical(Sys.getenv("DEVTOOLS_LOAD"), "rgeomex")) return(TRUE)
    fns <- vapply(sys.calls(), function(cl) {
        f <- cl[[1]]
        if (is.name(f)) as.character(f) else paste(deparse(f), collapse = "")
    }, character(1))
    any(fns %in% c("as.list.environment", "as.list", "mget", "eapply",
                   "roxygenise", "roxygen2::roxygenise", "load_all",
                   "pkgload::load_all", "devtools::load_all"))
}

.legacy_value <- function(name) {
    # tools that read every object of the namespace (R CMD check,
    # roxygen2, devtools::load_all()) must not download the data
    if (.bulk_access()) return(NULL)
    def <- .legacy[[name]]
    x <- rgeomex_load(def[[1]], def[[2]])
    if (name == "blocks_ine20_mx_centroid") x <- sf::st_drop_geometry(x)
    if (name == "iter_2020_loc") class(x) <- c("tbl_df", "tbl", "data.frame")
    x
}

.onLoad <- function(libname, pkgname) {
    ns <- asNamespace(pkgname)
    for (nm in names(.legacy)) {
        if (exists(nm, envir = ns, inherits = FALSE)) rm(list = nm, envir = ns)
        local({
            n <- nm
            makeActiveBinding(n, function() .legacy_value(n), ns)
        })
    }
}

#' @rawNamespace export(AGEE_inegi19_mx, AGEM_inegi19_mx, AGEM_inegi25_mx, loc_inegi19_mx, hrl_mx, pua_mx, ua_mx, iter_2020_loc, AGEB_inegi_2019_a, AGEB_inegi_2019_b, blocks_ine20_mx_a, blocks_ine20_mx_b, blocks_ine20_mx_c, blocks_ine20_mx_d, blocks_ine20_mx_e, blocks_ine20_mx_centroid, sectores_ine20_mx_a, sectores_ine20_mx_b, sectores_ine20_mx_c)
NULL

# placeholders so that the names exist when the namespace is exported; they
# are replaced by active bindings in .onLoad()
AGEE_inegi19_mx <- AGEM_inegi19_mx <- AGEM_inegi25_mx <- loc_inegi19_mx <-
    hrl_mx <- pua_mx <- ua_mx <- iter_2020_loc <- AGEB_inegi_2019_a <-
    AGEB_inegi_2019_b <- blocks_ine20_mx_a <- blocks_ine20_mx_b <-
    blocks_ine20_mx_c <- blocks_ine20_mx_d <- blocks_ine20_mx_e <-
    blocks_ine20_mx_centroid <- sectores_ine20_mx_a <- sectores_ine20_mx_b <-
    sectores_ine20_mx_c <- NULL
