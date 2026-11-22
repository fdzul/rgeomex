#' Extract the boundary of one or several localities
#'
#' @param cve_edo INEGI key of the state, from `"01"` to `"32"`.
#' @param locality name of the locality (INEGI 2019), or a vector of names
#'   for several localities, e.g. a metropolitan area. The most similar name
#'   is used, so accents and capital letters do not matter. For Mexico City
#'   (`cve_edo = "09"`) the whole city is returned.
#'
#' @return a sf object with the boundary of the locality (one row per
#'   locality).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#' @examples
#' \donttest{
#' merida <- extract_locality(cve_edo = "31", locality = "Merida")
#'
#' # metropolitan area of Guadalajara
#' gdl <- extract_locality(cve_edo = "14",
#'                         locality = c("Guadalajara", "Zapopan",
#'                                      "Tonala", "Tlaquepaque"))
#' }
extract_locality <- function(cve_edo, locality){
    cve_edo <- .state_code(cve_edo)
    loc <- rgeomex_load("loc_inegi19_mx", cve_edo = cve_edo)
    if (cve_edo == "09") return(loc)
    nom <- find_most_similar_string(locality, unique(loc$NOMGEO))
    sf::st_make_valid(loc[loc$NOMGEO %in% nom, ])
}

.extract <- function(dataset, locality, cve_edo, name) {
    loc <- extract_locality(cve_edo = cve_edo, locality = locality)
    y <- sf::st_make_valid(rgeomex_load(dataset, cve_edo = cve_edo))
    y <- y[loc, ]
    row.names(y) <- NULL
    stats::setNames(list(loc, y), c("locality", name))
}
