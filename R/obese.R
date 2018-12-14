#'@title Obesity Rates by State
#'
#'@description A dataset containing childhood and adult obesity rates by state in 2015.
#'
#'@docType data
#'@keywords datasets
#'@name obese
#'@usage obese
#'
#'@format A data frame with 51 rows and four variables.
#'The variables are as follows:
#'\describe{
#'    \item{State}{State}
#'    \item{AdultsObese}{Proportion of adults who are obese}
#'    \item{AdultsOverweight}{Proportion of adults who are overweight}
#'    \item{Children}{Proportion of children who are obese}
#'}
#'
#'@source The data was sourced from QAC251 - Introduction to Data Visualization notes for spatial analysis.
#'
#'@examples
#'summary(obese)
#'cor(obese$AdultsObese, obese$Children)
NULL
