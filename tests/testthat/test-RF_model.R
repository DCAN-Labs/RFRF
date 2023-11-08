#This script is a unit test to ensure that RF_model produces expected outputs

test_that("RF_model", {

  library("RFRF")
  #declare our expected input variables
  number_of_training_participants <- 10
  #number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  mtry <- 1
  nodesize <- 1
  proximity_flag = TRUE

  #create simulated data for the RF_train
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #train the RF model
  random_forest <- RF_Train(training_dataset,formula,mtry,nodesize)

  #test the RF_Test function
  Optimal_RF_Parameters <- RF_test(random_forest, testing_dataset, proximity_flag)

  #check the outputs, 'expect_' should have two main arguments, which 'expect_' function do we want?
  expect_type(Optimal_RF_Parameters$call, "language")
  expect_type(Optimal_RF_Parameters$mtry, "numeric")
  expect_true(Optimal_RF_Parameters$mtry >= 0)
  expect_type(Optimal_RF_Parameters$nodesize, "numeric")
  expect_true(Optimal_RF_Parameters$nodesize >= 0)
  expect_type(Optimal_RF_Parameters$err.rate, "numeric")
  expect_type(Optimal_RF_Parameters$proximity, "numeric")
  expect_type(Optimal_RF_Parameters$yvar, "numeric")
  expect_true(Optimal_RF_Parameters$yvar, is.matrix(yvar))
  expect_type(Optimal_RF_Parameters$yvar.names, "character")
  expect_true(Optimal_RF_Parameters$xvar, is.data.frame(xvar))
  expect_type(Optimal_RF_Parameters$xvar.names, "character")
  # expect_equal(2 * 2, 4)

})
