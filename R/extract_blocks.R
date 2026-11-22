#' Extract the blocks of one or several localities
#'
#' Extracts the blocks (manzanas, INE 2020) that intersect the boundary of one or
#' several localities.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   localities) and `block` (its blocks).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_blocks(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$block))
#'
#' # several localities: metropolitan area of Guadalajara
#' gdl <- extract_blocks(cve_edo = "14",
#'     locality = c("Guadalajara", "Zapopan", "Tonala", "Tlaquepaque"))
#' }
extract_blocks <- function(locality, cve_edo){
    .extract("blocks_ine20_mx", locality, cve_edo, "block")
}
