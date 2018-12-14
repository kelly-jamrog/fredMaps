#' @title Shape File to Data Frame
#'
#' @description \code{shapeToDF} reads in a shapefile and converts it into a
#' dataframe to allow for easy plotting in \code{ggplot2}.
#'
#' \code{shapeToDF}
#' converts a \code{SpatialPolygonsDataFrame} to a \code{data.frame}, however is not built to
#' handle a \code{SpatialLinesDataFrame} or a \code{SpatialPointaDataFrame}.
#'
#' @param dir The directory containing the shapefile
#' @param file The name of the shapefile without extension
#'
#' @return A map.df object
#'
#' @import sp
#' @import rgdal
#' @import ggplot2
#' @importFrom maptools gpclibPermit
#' @importFrom plyr join
#' @import tools
#'
#' @export
#'
#' @details See vignette for examples on how to use this function.

shapeToDF <- function(dir, file) {

  suppressWarnings(gpclibPermit())

  if(length(dir(dir)) == 0) {stop(paste0("Directory '", dir, "' does not exist"))}
  # if (!(file %in% file_path_sans_ext(dir))) {stop(paste0(file, " must be in directory ", dir))}


  map <- readOGR(dir, file)

  if(class(map)[1] != "SpatialPolygonsDataFrame") {
    stop(paste0("Output is class ", class(map),". Not a SpatialPolygonsDataFrame. Check input files."))}

  #create an id
  map@data$id <- rownames(map@data)
  map.points <- fortify(map, region = "id")
  map.df <- join(map.points, map@data, by = "id")

  class(map.df) <- c("map.df", "data.frame")

  return(map.df)

}
