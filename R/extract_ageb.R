#' extract_ageb
#'
#' This function extract the AGEB of the locality.
#'
#' @param locality locality target.
#' @param cve_geo is a string of the state id.
#'
#' @return a list with two sf objects: a locality limit and the agebs of locality target
#' @export
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @examples 1+1
extract_ageb <- function(locality, cve_geo){

    x <- rgeomex::loc_inegi19_mx %>%
        dplyr::filter(NOMGEO %in%
                          c(rgeomex::find_most_similar_string(c(locality),
                                                                unique(NOMGEO))) &
                          CVE_ENT %in% c(cve_geo))
    y <- rbind(rgeomex::AGEB_inegi_2019_a,
               rgeomex::AGEB_inegi_2019_b)

    xy <- y[x,]

    multi_return <- function() {
        my_list <- list("locality" = x,
                        "ageb" = xy)
        return(my_list)
    }
    multi_return()

}
