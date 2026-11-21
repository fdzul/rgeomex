#' Extract the electoral sections of a locality
#'
#' Extracts the electoral sections (secciones, INE 2020) that intersect the
#' boundary of a locality.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   locality) and `sectores` (its sections).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_sectores(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$sectores))
#' }
extract_sectores <- function(locality, cve_edo){
    .extract("sectores_ine20_mx", locality, cve_edo, "sectores")
}
