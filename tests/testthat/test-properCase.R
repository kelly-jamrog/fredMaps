context("properCase function")

test_that("errors generated for bad input", {
  expect_error(properCase(1), "must be a character")
  expect_error(properCase(c(1,2,3)), "must be a character")
})


test_that("output is correct", {
  expect_equal(properCase("hello"), "Hello")
  expect_equal(properCase("HELLO"), "Hello")
  expect_equal(properCase("hello world"), "Hello World")
  expect_equal(properCase("HelLO WorLD"), "Hello World")
})
