#' extract_ageb
#'
#' This function extract the AGEB of the locality.
#'
#' @param locality locality target.
#' @param cve_edo is a string of the state id.
#'
#' @return a list with two sf objects: a locality limit and the agebs of locality target
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' x <- rgeomex::extract_ageb(cve_edo = "31", locality = "Merida")
#' mapview::mapview(x$ageb)
#' mapview::mapview(x$locality)
extract_ageb <- function(locality, cve_edo){

    loc <- rgeomex::extract_locality(cve_edo = cve_edo,
                                     locality = locality)

    cve_edo <- as.numeric(cve_edo)

    if(cve_edo %in% c(1:16)){
        y <- rgeomex::AGEB_inegi_2019_a |>
            sf::st_make_valid()}
    if(cve_edo %in% c(17:32)){y <- rgeomex::AGEB_inegi_2019_a |>
        sf::st_make_valid()}


    y <- y[loc,]

    multi_return <- function() {
        my_list <- list("locality" = x,
                        "ageb" = y)
        return(my_list)
    }
    multi_return()

}
