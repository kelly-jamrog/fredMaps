#' @title FredMapsPoint
#'
#' @description \code{fredMapsPoint} creates a chloropleth map of the continental United States.
#' The color and size of the points are based on the values of two user specified variables.
#'
#' @param data A dataframe containing two variables to plot and a variable of state names
#' @param size_var A variable in \code{data} which determines size of points
#' @param color_var A variable in \code{data} which determines color of points
#' @param lat The variable in \code{data} containing latitude values
#' @param long The variable in \code{data} containing longitude values
#'
#' @return A ggplot2 object
#'
#' @import dplyr
#' @import maps
#' @import ggplot2
#'
#' @export
#'
#'@examples
#'fredMapsPoint(college_enrollment, size=enrollment, color=label, long=long, lat=lat)
#'fredMapsPoint(college_enrollment, size=enrollment, color=undergrad, long=long, lat=lat)


fredMapsPoint <- function(data, size_var, color_var, long, lat){

  if (!is.data.frame(data))
    stop("data must be a data.frame!")

  if (!is.numeric(data[[deparse(substitute(long))]]) | !is.numeric(data[[deparse(substitute(lat))]]))
    stop("latitudes and longitdues must be numeric!")

  if (!is.numeric(data[[deparse(substitute(size_var))]]) & !is.integer(data[[deparse(substitute(size_var))]]))
    stop("point size variable must be integer or numeric!")

  size_var <- enquo(size_var)
  long <- enquo(long)
  lat <- enquo(lat)

  all_states <- map_data("state")

  if (is.numeric(data[[deparse(substitute(color_var))]]) & is.integer(data[[deparse(substitute(color_var))]])) { # if color var is continuous
    color_var <- enquo(color_var)
    ggplot()+
      geom_map(data=all_states, aes(map_id=region),
               map=all_states, fill="grey", color="black")+
      expand_limits(x=all_states$long, y=all_states$lat)+
      geom_point(data=data, aes(x=!!long, y=!!lat, size = !!size_var, col = !!color_var)) +
      scale_fill_continuous(type = "gradient")
  }
  else { # if color var is discrete
    color_var <- enquo(color_var)
    ggplot()+
      geom_map(data=all_states, aes(map_id=region),
               map=all_states, fill="grey", color="black")+
      expand_limits(x=all_states$long, y=all_states$lat)+
      geom_point(data=data, aes(x=!!long, y=!!lat, size = !!size_var, col = !!color_var))
  }
}
