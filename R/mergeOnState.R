#' @title Merge on State Function
#'
#' @description \code{mergeOnState} merges two dataframe on state names. The columns
#' containing state names in the two dataframes do not have to have the same format.
#'
#' @param df1 A dataframe containing a column with state names
#' @param col1 The column within \code{df1} containing state names
#' @param df2 A dataframe containing a column with state names
#' @param col2 The column within \code{df2} containing state names
#' @param merge The type of merge ("left", "right", "inner", "full") that should
#' be used to merge the two dataframes
#'
#' @return A dataframe
#'
#' @import dplyr
#' @export
#'
#' @examples
#' data(bingedrinking)
#' data(gdp)
#' mergeOnState(bingedrinking, LocationAbbr, gdp, X, merge = "inner")


mergeOnState <- function(df1, col1, df2, col2, merge = "left") {
  test1 <- deparse(substitute(col1))
  test2 <- deparse(substitute(col2))
  col1 <- enquo(col1)
  col2 <- enquo(col2)

  if (!is.data.frame(df1)) {stop("df1 must be data.frame")}
  if (!is.data.frame(df2)) {stop("df2 must be data.frame")}
  if (!(test1 %in% names(df1))) {stop(paste0(test1, " must be a column in df1"))}
  if (!(test2 %in% names(df2))) {stop(paste0(test2, " must be a column in df2"))}
  if (!(merge %in% c("left", "right", "inner", "full"))) {stop('merge must be
                                                               either "left", "right", "inner", "full"')}



  df1 <- mutate(df1, XXXstateXXX = stateNames(!!col1))

  df2 <- mutate(df2, XXXstateXXX = stateNames(!!col2))

  if (merge == "left"){
    merged_data <- df1 %>%
      left_join(df2, by = "XXXstateXXX") %>%
      dplyr::select(-c("XXXstateXXX"))
  } else if (merge == "right") {
    merged_data <- df1 %>%
      right_join(df2, by = "XXXstateXXX") %>%
      dplyr::select(-c("XXXstateXXX"))
  } else if (merge == "inner") {
    merged_data <- df1 %>%
      inner_join(df2, by = "XXXstateXXX") %>%
      dplyr::select(-c("XXXstateXXX"))
  } else if (merge == "full") {
    merged_data <- df1 %>%
      full_join(df2, by = "XXXstateXXX") %>%
      dplyr::select(-c("XXXstateXXX"))
  }

  return(merged_data)
}
