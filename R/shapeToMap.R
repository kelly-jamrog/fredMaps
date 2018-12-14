#' @title Shape File to Map
#'
#' @description \code{shapeToMap} reads in a shapefile, converts it to a dataframe
#' and plots the resulting dataframe using \code{ggplot2}.
#'
#' \code{shapeToMap}
#' converts a \code{SpatialPolygonsDataFrame} to a \code{data.frame}, however is not built to
#' handle a \code{SpatialLinesDataFrame} or a \code{SpatialPointaDataFrame}.
#'
#' @param dir The directory containing the shapefile
#' @param file The name of the shapefile without extension
#'
#' @return A ggplot2 object
#'
#' @import ggplot2
#'
#' @export
#'
#' @details See vignette for examples on how to use this function.


shapeToMap <- function(dir, file) {

  map.df <- shapeToDF(dir, file)

  ggplot(map.df)+
    aes(long, lat, group = group) +
    geom_polygon() +
    coord_equal() +
    xlab("Longitude") +
    ylab("Latitude")

}
