#' @title State Names Function
#'
#' @description \code{stateNames} converts U.S. state names to a user specified normalized
#' format.  By default, \code{stateNames} outputs results as lowercase full state names. The user
#' can specify if the output should be full names or abbreviation and lowercase or proper case
#' (first letter in the word capitalized).  If a string is not one of the 50 U.S. states,
#' that string will be returned unchanged, however, the
#' user can specifiy if it should be replaced with an \code{NA}.
#'
#' @param state a string containing a state name or abbreviation
#' @param tolower TRUE if state names should be outputted in lowercase,
#' FALSE if state names should be outputted in proper case
#' @param abb TRUE if state abbreviation is to be returned, FALSE if full name is to be returned
#' @param replace.na TRUE if non-states are to be replaced with \code{NA}s,
#' FALSE if non-states are to be returned unchanged
#'
#' @return a named character containing normalized state name(s) or abbreviation(s).
#'
#' @import datasets
#'
#' @export
#'
#' @examples
#' stateNames("NY")
#' stateNames("new york", abb = TRUE)
#' stateNames(c("New york", "ca", "ct"), tolower = FALSE)
#' stateNames(c("New york", "ca", "ct"), tolower = FALSE, abb = TRUE)
#' stateNames(c("New york", "Boston", "ct"), tolower = FALSE, abb = TRUE, replace.na = TRUE)


stateNames <- function(state, tolower = TRUE, abb = FALSE, replace.na = FALSE){
  if (!is.character(state) & !is.factor(state)) {stop("state must be a character or factor")}

  if (!(toupper(state) %in% state.abb) & !(toupper(state) %in% toupper(state.name))) {
    warning(paste0(state, " is not a state"), call. = FALSE)
    if (replace.na == TRUE) {
      return (NA)
    } else {
      return(state)
    }
  }

  # if state is already an abbreviation
  if(toupper(state) %in% state.abb) {
    state <- toupper(state)

    # if abbrevation == TRUE
    if (abb == TRUE){
      # if to lower == TRUE
      if (tolower == TRUE) {
        return (tolower(state))
      } else if (tolower == FALSE) {
        return (state)
      }
    } else if (abb == FALSE) { # if abbrevation == FALSE
      if (tolower == TRUE){
        return(tolower(state.name[which(state.abb==state)]))
      } else if (tolower == FALSE) {
        return(state.name[which(state.abb==state)])
      }
    }

  } else { ## if state is full name
    state <- properCase(state)
    # if abbrevation == FALSE
    if (abb == FALSE) {
      # if tolower == TRUE
      if (tolower == TRUE){
        return(tolower(state))
      } else if (tolower == FALSE) {
        return(state)
      }
    } else if (abb == TRUE) { # if abbreviation == TRUE
      if (tolower == TRUE){
        return(tolower(state.abb[which(state.name==state)]))
      } else if (tolower == FALSE) {
        return(state.abb[which(state.name==state)])
      }
    }
  }
}

stateNames <- Vectorize(stateNames, USE.NAMES = FALSE)
