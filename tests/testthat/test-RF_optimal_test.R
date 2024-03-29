#This script is a unit test to ensure that RF_optimal_test produces expected outputs

test_that("RF_optimal_test", {

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

  #test optimal random forest using testing dataset to return RF prediction (proximity matrix)
  RF_prediction <- RF_optimal_test(optimal_random_forest,testing_dataset,proximity_flag)

  expect_type(RF_prediction$err.rate, "double")
  expect_type(RF_prediction$proximity, "double")
  expect_type(RF_prediction$yvar, "double")
  expect_true(is.vector(RF_prediction$yvar))
  expect_type(RF_prediction$yvar.names, "character")
  expect_true(is.data.frame(RF_prediction$xvar))
  expect_type(RF_prediction$xvar.names, "character")
})
