#This script is a unit test to ensure that RF_Prediction produces expected outputs

test_that("Subtype_ID", {
  #loads neccessary environment, packages, and dependencies
  library(RFRF)
  # declare the expected input variables for simulate_data
  number_of_training_participants <- 10
  number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  # declare the expected input variables for creating the test forest
  formula = y~x
  mtry <- 1
  nodesize <- 1
  proximity_flag = TRUE
  # declare the expected input variables for Subtype_ID
  mode = "undirected"
  weighted = TRUE
  diag = FALSE

  # create simulated dataset for RF_prediction
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #create test forest
  test_random_forest <- RF_train(training_dataset,formula,mtry,nodesize)

  #determine RF_prediction values
  RF_prediction_test <- RF_optimal_test(test_random_forest,testing_dataset,proximity_flag)

  # create subtypes
  subtypes <- Subtype_ID(proximity_matrix=RF_prediction_test$proximity, mode=mode, weighted=weighted, diag=diag)

  # check the outputs of Subtype_ID
  # need to build out expects
  expect_true(is.vector(subtypes$membership))
  expect_type(subtypes$codelength, "double")
})
