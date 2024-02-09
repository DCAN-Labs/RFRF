#This script is a unit test to ensure that RF_Test produces expected outputs

test_that("RF_test", {

  library("RFRF")
  # declare remaing expected input variables for RF_Test
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

  # create simulated dataset for RF_Train and RF_Test
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #create test random forest
  test_random_forest <- RF_train(training_dataset,formula,mtry,nodesize,model_type)

  #test the RF_Test function
  Optimal_RF_Parameters <- RF_test(test_random_forest, testing_dataset, proximity_flag)

  #check the outputs
  expect_type(Optimal_RF_Parameters$call, "language")
  #expect_type(Optimal_RF_Parameters$mtry, "double")
  #expect_true(Optimal_RF_Parameters$mtry >= 0)
  expect_type(Optimal_RF_Parameters$forest$nodesize, "double")
  expect_true(Optimal_RF_Parameters$forest$nodesize >= 0)
  expect_type(Optimal_RF_Parameters$err.rate, "double")
  expect_type(Optimal_RF_Parameters$proximity, "double")
  expect_type(Optimal_RF_Parameters$yvar, "double")
  expect_true(is.vector(Optimal_RF_Parameters$yvar))
  expect_type(Optimal_RF_Parameters$yvar.names, "character")
  expect_true(is.data.frame(Optimal_RF_Parameters$xvar))
  expect_type(Optimal_RF_Parameters$xvar.names, "character")
})

