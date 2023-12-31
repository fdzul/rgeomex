#' extract_blocks
#'
#' This function extract the blocks of the locality.
#'
#' @param locality locality target.
#' @param cve_edo is a string of the state id.
#'
#' @return a list with two sf objects: a locality limit and the blocks of locality target
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples
#' x <- rgeomex::extract_blocks(cve_edo = "31", locality = "Merida")
#' mapview::mapview(x$block)
#' mapview::mapview(x$locality)
extract_blocks <- function(locality, cve_edo){

    loc <- rgeomex::extract_locality(cve_edo = cve_edo,
                                     locality = locality)
    cve_edo <- as.numeric(cve_edo)

    if(cve_edo %in% c(1:10)){
        y <- rgeomex::blocks_ine20_mx_a |>
            sf::st_make_valid()}
    if(cve_edo %in% c(11:14)){y <- rgeomex::blocks_ine20_mx_b |>
        sf::st_make_valid()}
    if(cve_edo %in% c(15:19)){y <- rgeomex::blocks_ine20_mx_c |>
        sf::st_make_valid()}
    if(cve_edo %in% c(20:25)){y <- rgeomex::blocks_ine20_mx_d |>
        sf::st_make_valid()}
    if(cve_edo %in% c(26:32)){y <- rgeomex::blocks_ine20_mx_e |>
        sf::st_make_valid()}

    y <- y[loc,]

    multi_return <- function() {
        my_list <- list("locality" = loc,
                        "block" = y)
        return(my_list)
    }
    multi_return()

}
