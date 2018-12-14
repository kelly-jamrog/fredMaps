context("mergeOnState function")

test_that("errors generated for bad input", {
  library(dplyr)
  data(bingedrinking)
  data(gdp)

  expect_error(mergeOnState(123, LocationAbbr, gdp, X), "must be data.frame")
  expect_error(mergeOnState(bingedrinking, potato, gdp, X), "must be a column in")
})


test_that("output is correct", {
  library(dplyr)
  data(bingedrinking)
  data(gdp)

  expect_is(mergeOnState(bingedrinking, LocationAbbr, gdp, X, merge = "left"), "data.frame")
})
