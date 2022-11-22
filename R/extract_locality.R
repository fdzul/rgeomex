#' extract the locality
#'
#' @param cve_edo is the id of state.
#' @param locality is the target locality.
#'
#' @return a sf object of the locality boundary.
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#' @examples rgeomex::extract_locality(cve_edo = "31", locality = "Merida")
extract_locality <- function(cve_edo, locality){
    rgeomex::loc_inegi19_mx |>
        dplyr::filter(CVE_ENT %in% c(cve_edo)) |>
        dplyr::filter(NOMGEO %in% c(rgeomex::find_most_similar_string(locality, unique(NOMGEO)))) |>
        sf::st_make_valid()
}
