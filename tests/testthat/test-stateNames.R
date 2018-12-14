context("stateNames function")

test_that("errors generated for bad input", {
  expect_error(stateNames(1), "must be a character")
  expect_warning(stateNames("kelly"), "is not a state")
})


test_that("output is correct", {
  expect_equal(stateNames("NY"), "new york")
  expect_equal(stateNames("new york", abb = TRUE), "ny")
  expect_equal(stateNames(c("New york", "ca", "ct"), tolower = FALSE),
               c("New York", "California", "Connecticut"))
  expect_equal(stateNames(c("New york", "ca", "ct"), tolower = FALSE, abb = TRUE),
               c("NY", "CA", "CT"))
  expect_equal(stateNames(c("tx", "dc", "ca")),
               c("texas", "dc", "california"))
  expect_equal(stateNames(c("tx", "dc", "ca"), replace.na = TRUE),
               c("texas", NA, "california"))
})
