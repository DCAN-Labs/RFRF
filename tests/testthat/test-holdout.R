test_that("holdout", {

  library("RFRF")
  #declare our expected input variables
  number_of_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  seed <- set.seed(7)
  groups <- rep(1:2, each = 5) #information on how the stratified data will be grouped
  holdout_fraction <- 0.8

  #create simulated dataset for input data
  data <- simulate_data(number_of_participants,covariance_matrix,outcome_column,means)
  randomized_data <- randomize(data=data,seed=seed)
  #set rule to stratify by
  stratified_data <- stratify_by(randomized_data=randomized_data, groups=groups)

  #produce the stratified dataset
  training_dataset,testing_dataset <- split_data(stratified_data=stratified_data, holdout_fraction=holdout_fraction)

  expect_is(training_dataset, "data.frame")
  expect_is(testing_dataset, "data.frame")
  #expect_length(train_and_test, 2)
  #expect_equal(length(train_and_test$train) + length(train_and_test$test), length(data))
  #ratio <- length(train_and_test$train)/length(data)
  #expect_equal(ratio, holdout_fraction)
})
