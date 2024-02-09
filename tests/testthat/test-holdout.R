test_that("holdout", {

  library("RFRF")
  #declare our expected input variables
  number_of_participants <- 12
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  seed <- set.seed(7)
  groups <- rep(1:2, each = 6) #information on how the stratified data will be grouped
  holdout_fraction <- 0.8

  #create simulated dataset for input data, should we be adding a test for the read_file function??
  data <- simulate_data(number_of_participants,covariance_matrix,outcome_column,means)
  randomized_data <- randomize(data=data,seed=seed)
  #set rule to stratify data
  stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)
  # incorporate groups check in expect_

  #produce the split dataset into train and test
  train_and_test <- split_data(stratified_data=stratified_data, holdout_fraction=holdout_fraction)

  expect_type(train_and_test$training_dataset, "list")
  expect_type(train_and_test$testing_dataset, "list")
  expect_length(train_and_test, 2)
  expect_equal(nrow(train_and_test$training_dataset) + nrow(train_and_test$testing_dataset), nrow(stratified_data))
  # checks to see if training dataset is larger
  ratio <- round(nrow(train_and_test$training_dataset)/nrow(stratified_data))
  expect_equal(ratio, 1)
  #expect_true(file.exists(groups), info = "Groups information should exist as a file")
})
