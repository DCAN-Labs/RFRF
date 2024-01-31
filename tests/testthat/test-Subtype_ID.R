#This script is a unit test to ensure that RF_Prediction produces expected outputs

test_that("Subtype_ID", {
  #loads neccessary environment, packages, and dependencies
  library(RFRF)

  # do we need to combine RF_Optimal_Test and RF_Prediction?

  # declare the expected input variables for simulate_data
  number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  # declare the expected input variables for creating the test forest
  formula = y~x
  mtry <- 1
  nodesize <- 1
  # declare the expected input variables for RF_prediction
  proximity <- array()
  yvar <- data.frame # "numeric", is.matrix(yvar)
  yvar.names <- string # "character"
  xvar <- data.frame # is.data.frame(xvar)
  xvar.names <- string # "character"
  err.rate <- float

  # create simulated dataset for RF_prediction
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #create test forest
  test_random_forest <- RF_train(training_dataset,formula,mtry,nodesize)

  #determine RF_prediction values

  # create matrix_to_graph
  matrix_to_graph <- RF_Prediction(proximity, yvar, yvar.names, xvar, xvar.names, err.rate, testing_dataset) # does testing_dataset need to be included here, or is it satisfied with xvar and yvar?

  # check the outputs of matrix_to_graph
  # needs a lot more review
  expect_true(matrix_to_graph$adjmatrix)
  expect_true(matrix_to_graph$mode)
  expect_true(matrix_to_graph$weighted)
  expect_true(matrix_to_graph$diag)
  #print(matrix_to_graph.graph_from_adjacency_mattrix())

  # create proximity_graph

  # check community detection function
})
