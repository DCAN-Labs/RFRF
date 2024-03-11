test_that("holdout", {

  library(RFRF)
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

  #randomize data
  randomized_data <- randomize(data=data,seed=seed)

  #set rule to stratify data
  stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)

  #produce the split dataset into train and test
  train_and_test <- split_data(stratified_data=stratified_data, holdout_fraction=holdout_fraction)

  #incorporate groups check in expect_
  expect_type(train_and_test$training_dataset, "list")
  expect_type(train_and_test$testing_dataset, "list")
  expect_length(train_and_test, 2)
  expect_equal(nrow(train_and_test$training_dataset) + nrow(train_and_test$testing_dataset), nrow(stratified_data))
  expect_true(file.exists("holdout.txt"), info = "holdout.txt file should be created")
  #check if the file contains the correct number of lines
  file_contents <- readLines("holdout.txt")
  expected_lines <- 2
  expect_length(file_contents, expected_lines, info = "holdout.txt should have the correct number of lines")
  unlink("holdout.txt")
  #checks to see if training dataset is larger for now
  ratio <- round(nrow(train_and_test$training_dataset)/nrow(stratified_data))
  expect_equal(ratio, 1)
  #expect_true(file.exists(groups), info = "Groups information should exist as a file")
})
