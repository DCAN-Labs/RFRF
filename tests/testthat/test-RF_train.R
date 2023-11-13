#This script is a unit test to ensure that RF_Train produces expected outputs

test_that("RF_train", {

  library("RFRF")
  #declare our expected input variables
  number_of_training_participants <- 10
  #number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  formula = y~x
  mtry <- 1
  nodesize <- 1
  model_type = "rfsrc"

  #create simulated data for the RF_train
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  #testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #train the RF model
  random_forest <- RF_Train(training_dataset,formula,mtry,nodesize,model_type)

  #check the outputs (TODO: replaced by a search/these things equal, with usethis and testthat )
  expect_type(random_forest$call, "language")
  expect_type(random_forest$mtry, "numeric")
  expect_true(random_forest$mtry >= 0)
  expect_type(random_forest$nodesize, "numeric")
  expect_true(random_forest$nodesize >= 0)
  expect_type(random_forest$yvar, "numeric")
  expect_true(random_forest$yvar, is.matrix(yvar))
  expect_type(random_forest$yvar.names, "character")
  expect_true(random_forest$xvar, is.data.frame(xvar))
  expect_type(random_forest$xvar.names, "character")
  expect_true(random_forest$forest$forest)
  expect_equal(2 * 2, 5)
})
