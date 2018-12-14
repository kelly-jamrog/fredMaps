#' @title FredMaps
#'
#' @description \code{fredMaps} creates a chloropleth map of the continental United States.
#' The color and intensity of the fill are based on the values of a user specified variable.
#'
#' @param data A dataframe containing a variable to plot and a variable of state names
#' @param x A variable in \code{data} to plot
#' @param state_col The variable in \code{data} of state names
#' @param low Color of lower values of \code{x}
#' @param high Color of higher values of \code{x}
#' @param states If specified, plots list of states provided
#'
#' @return A ggplot2 object
#'
#' @import dplyr
#' @import maps
#' @import ggplot2
#'
#' @export
#'
#' @examples
#' fredMaps(data = obese, x = AdultsObese, state_col = State)
#' fredMaps(obese, AdultsObese, State, low = "blue", high = "purple",
#' states = c("illinois", "indiana", "iowa", "kentucky", "michigan", "minnesota","missouri", "north dakota", "ohio", "south dakota", "wisconsin"))
#' fredMaps(data = college_enrollment, x = undergrad, state_col = state)

fredMaps <- function(data, x, state_col, low = "yellow", high = "red", states = NULL){
  library(maps)
  library(ggplot2)

  if (!is.data.frame(data))
    stop("data must be a data.frame!")

  if (!is.numeric(data[[deparse(substitute(x))]]) & !is.integer(data[[deparse(substitute(x))]]))
    stop("variable to map must be integer or numeric!")

  if (!is.null(states) & !is.character(states))
    stop("states subset must be a character vector!")

  if (!is.character(low) | (!is.character(high)))
    stop("low and high color variables must be characters!")

  state_col <- enquo(state_col)
  x <- enquo(x)

  # df1 <- mutate(df1, XXXstateXXX = state_names(!!col1))

  data <- mutate(data, region = stateNames(!!state_col))
  all_states <- map_data("state")

  if (is.null(states) == FALSE) {

    states_subset <- filter(all_states, region %in% states)

    ggplot()+
      geom_map(data=states_subset, aes(map_id=region), map=states_subset)+
      geom_map(data=data, aes(map_id=region, fill=!!x), map=states_subset) +
      expand_limits(x=states_subset$long, y=states_subset$lat)+
      scale_fill_gradient(low=low, high=high) +
      xlab("Longitude") +
      ylab("Latitude")
  } else {
    ggplot()+
      geom_map(data=all_states, aes(map_id=region), map=all_states)+
      geom_map(data=data, aes(map_id=region, fill = !!x), map = all_states) +
      expand_limits(x=all_states$long, y=all_states$lat) +
      scale_fill_gradient(low=low, high=high) +
      xlab("Longitude") +
      ylab("Latitude")
  }
}
