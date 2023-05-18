test_that("can determine if matrix contains only numbers", {
  library(testthat)
  source("../../R/check_num_mat.R")

  M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
  actSolution = check_num_mat(M)
  expSolution = TRUE
  expect_equal(actSolution, expSolution)
})

test_that("can determine if matrix contains a non-number", {
  library(testthat)
  source("../../R/check_num_mat.R")

  M <- c("Bob", "Carol", "Ted", "Alice")
  actSolution = check_num_mat(M)
  expSolution = FALSE
  expect_equal(actSolution, expSolution)
})
