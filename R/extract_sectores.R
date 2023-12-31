#' extract_sectores
#'
#' This function extract the sectores of the locality.
#'
#' @param locality locality target.
#' @param cve_edo is a string of the state id.
#'
#' @return a list with two sf objects: a boundary of locality and the sectores of locality target
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' x <- rgeomex::extract_sectores(cve_edo = "31", locality = "Merida")
#' mapview::mapview(x$sectores)
#' mapview::mapview(x$locality)
extract_sectores <- function(locality, cve_edo){

    loc <- rgeomex::extract_locality(cve_edo = cve_edo,
                                     locality = locality)
    cve_edo <- as.numeric(cve_edo)

    if(cve_edo %in% c(1:10)){y <- rgeomex::sectores_ine20_mx_a}
    if(cve_edo %in% c(11:20)){y <- rgeomex::sectores_ine20_mx_b}
    if(cve_edo %in% c(21:32)){y <- rgeomex::sectores_ine20_mx_c}

    y <- y[loc,]

    multi_return <- function() {
        my_list <- list("locality" = loc,
                        "sectores" = y)
        return(my_list)
    }
    multi_return()

}
