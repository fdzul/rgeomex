#' Extract the AGEB of a locality
#'
#' Extracts the urban AGEB (INEGI 2019) that intersect the boundary of a
#' locality.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   locality) and `ageb` (its AGEB).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_ageb(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$ageb))
#' }
extract_ageb <- function(locality, cve_edo){
    .extract("AGEB_inegi_2019", locality, cve_edo, "ageb")
}
