#' Extract the AGEB of one or several localities
#'
#' Extracts the urban AGEB (INEGI 2019) that intersect the boundary of one or
#' several localities.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   localities) and `ageb` (its AGEB).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_ageb(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$ageb))
#'
#' # several localities: metropolitan area of Guadalajara
#' gdl <- extract_ageb(cve_edo = "14",
#'     locality = c("Guadalajara", "Zapopan", "Tonala", "Tlaquepaque"))
#' }
extract_ageb <- function(locality, cve_edo){
    .extract("AGEB_inegi_2019", locality, cve_edo, "ageb")
}
