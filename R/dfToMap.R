#' @title Data Frame to Map
#'
#' @description \code{dfToMap} plots dataframes of the class \code{map.df} using \code{ggplot2}.
#'
#' @param map.df The directory containing the shapefile
#' @param fill The column to be used as the fill
#'
#' @return A ggplot2 object
#'
#' @import ggplot2
#'
#' @export
#'
#' @details See vignette for examples on how to use this function.

dfToMap <- function(map.df, fill = NULL) {


  if(!inherits(map.df, "map.df")) {stop("Must be class 'map.df'")}


  if(!is.null(fill)) {

    ggplot(map.df)+
      aes(long, lat, group = group, fill = factor(fill)) +
      geom_polygon () +
      coord_equal()  +
      labs(x = "Longitude", y = "Latitude", fill = "")


  } else {
    ggplot(map.df)+
      aes(long, lat, group = group) +
      geom_polygon() +
      coord_equal() +
      xlab("Longitude") +
      ylab("Latitude")
  }

}
