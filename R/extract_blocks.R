#' Extract the blocks of a locality
#'
#' Extracts the blocks (manzanas, INE 2020) that intersect the boundary of a
#' locality.
#'
#' @inheritParams extract_locality
#'
#' @return a list with two sf objects: `locality` (the boundary of the
#'   locality) and `block` (its blocks).
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' \donttest{
#' x <- extract_blocks(cve_edo = "31", locality = "Merida")
#' plot(sf::st_geometry(x$block))
#' }
extract_blocks <- function(locality, cve_edo){
    .extract("blocks_ine20_mx", locality, cve_edo, "block")
}
