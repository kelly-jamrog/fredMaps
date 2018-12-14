#' @title Proper Case Function
#'
#' @description \code{properCase} makes the first character in a word uppercase and all
#' other characters lowercase.
#'
#' @details
#' This function capitalizes the first character is a word and makes all subsequent
#' characters lowercase.  This capitalization sequence is often known as proper case.
#'
#' @param x A string
#'
#' @return  A string with the first character capitalized
#'
#' @export
#'
#' @examples
#' properCase("hello")
#' properCase("HELLO")
#' properCase("hello world")
#' properCase("HelLO WorLD")



properCase <- function(x) {
  if (!is.character(x)) {stop("x must be a character") }

  x <- tolower(x)
  x <- strsplit(x, " ")[[1]]
  x <- paste(toupper(substr(x, 1, 1)), substring(x, 2), sep = "", collapse = " ")
  return(x)
}
