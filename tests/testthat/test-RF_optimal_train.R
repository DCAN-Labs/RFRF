#This script is a unit test to ensure that RF_optimal_train produces expected outputs

test_that("RF_optimal_train", {

  library("RFRF")
  #declare our expected input variables
  number_of_training_participants <- 10
  number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  formula = y~x
  mtry <- 1
  nodesize <- 1
  proximity_flag = TRUE
  model_type = "rfsrc"

  #create simulated data for the RF_train
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #train the RF model
  random_forest <- RF_train(training_dataset,formula,mtry,nodesize)

  #return optimal RF parameters using RF_test
  Optimal_RF_Parameters <- RF_test(random_forest, testing_dataset, proximity_flag)

  #train using optimal RF parameters with RF optimal train
  optimal_random_forest <- RF_optimal_train(training_dataset,formula,Optimal_RF_Parameters,model_type)

  #check the outputs (TODO: replaced by a search/these things equal, with usethis and testthat )
  expect_type(optimal_random_forest$call, "language")
  expect_type(optimal_random_forest$mtry, "numeric")
  expect_true(optimal_random_forest$mtry >= 0)
  expect_type(optimal_random_forest$nodesize, "numeric")
  expect_true(optimal_random_forest$nodesize >= 0)
  expect_type(optimal_random_forest$yvar, "numeric")
  expect_true(optimal_random_forest$yvar, is.matrix(yvar))
  expect_type(optimal_random_forest$yvar.names, "character")
  expect_true(optimal_random_forest$xvar, is.data.frame(xvar))
  expect_type(optimal_random_forest$xvar.names, "character")
  expect_true(optimal_random_forest$forest$forest)
  expect_equal(2 * 2, 5)

})
