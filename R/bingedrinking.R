#'@title Binge Drinking Prevalence Data
#'
#'@description A data frame containing information on the prevalence of binge drinking
#'in adults aged 18 and older in the United States by state and gender.
#'
#'@docType data
#'@keywords datasets
#'@name bingedrinking
#'@usage bingedrinking
#'
#'@format A data frame with 153 rows and three variables.
#'The variables are as follows:
#'\describe{
#'    \item{LocationAbbr}{State abbreviation}
#'    \item{BingeDrinking}{Binge drinking prevalence among adults aged >= 18 years }
#'    \item{Group}{Subset of population}
#'}
#'
#'@source This data is a subset of the Center for Disease Control and Prevention data on
#'U.S. Chronic Disease Indicator (CDI).  The full data set can be found \href{https://catalog.data.gov/dataset/u-s-chronic-disease-indicators-cdi/resource/f21d6667-9a21-4a17-a5d7-fabfdedc3d6d}{here}.
#'
#'@examples
#'boxplot(BingeDrinking~Group,data=bingedrinking, main="Average Binge Drinking Prevalence by Group",ylab = "Percentage of Adults Binge Drinking")



NULL
