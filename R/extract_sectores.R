#' Extract the electoral sections of one or several localities
#'
#' Extracts the electoral sections (secciones, INE 2020) that intersect the
#' boundary of one or several localities.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   localities) and `sectores` (its sections).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_sectores(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$sectores))
#'
#' # several localities: metropolitan area of Guadalajara
#' gdl <- extract_sectores(cve_edo = "14",
#'     locality = c("Guadalajara", "Zapopan", "Tonala", "Tlaquepaque"))
#' }
extract_sectores <- function(locality, cve_edo){
    .extract("sectores_ine20_mx", locality, cve_edo, "sectores")
}
