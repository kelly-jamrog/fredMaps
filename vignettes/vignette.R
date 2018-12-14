## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)



## ---- message=FALSE, warning=FALSE---------------------------------------
library(fredMaps)
# on a single observation
stateNames("NY")

# on a vector containing state names
stateNames(c("New york", "Boston", "ct"), tolower = FALSE, abb = TRUE, replace.na = TRUE)

## ------------------------------------------------------------------------
library(fredMaps)

head(gdp)

head(bingedrinking)


## ------------------------------------------------------------------------
drinking_GDP <- mergeOnState(bingedrinking, LocationAbbr, gdp, X, merge = "inner")
head(drinking_GDP)

## ------------------------------------------------------------------------
cor(drinking_GDP$BingeDrinking, drinking_GDP$gdpPerCap)

## ---- message=FALSE, warning=FALSE, fig.align= 'center', dpi = 72, fig.width= 9, fig.height= 7----
fredMaps(obese, AdultsObese, State, low="pink", high="red")

## ---- message=FALSE, warning=FALSE, fig.align= 'center', dpi = 72, fig.width= 9, fig.height= 7----
fredMaps(obese, Children, State, low = "pink", high = "purple",
         states = c("illinois", "indiana", "iowa", "kentucky",
                                           "michigan", "minnesota","missouri",
                                           "north dakota", "ohio", "south dakota",
                                           "wisconsin"))

## ---- message=FALSE, warning=FALSE, fig.align= 'center', dpi = 72, fig.width= 9, fig.height= 7----
fredMapsPoint(college_enrollment, size=enrollment, color=label, long=long, lat=lat)

## ----fig.align= 'center', dpi = 72, fig.width= 7, fig.height= 7----------
shapeToMap("nynta_18d", "nynta")

## ------------------------------------------------------------------------
ny <- shapeToDF("nynta_18d", "nynta")
names(ny)

## ----fig.align= 'center', dpi = 72, fig.width= 7, fig.height= 7----------
library(ggplot2)

dfToMap(ny, ny$BoroName) +
  labs(title = "New York City", fill = "Borough") 

