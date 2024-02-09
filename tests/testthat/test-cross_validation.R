test_that("cross_validation_folds", {

  library("RFRF")
  #declare our expected input variables
  number_of_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)
  seed <- set.seed(7)
  groups <- rep(1:2, each = 5) #information on how the stratified data will be grouped
  nfolds <- 5

  #create simulated dataset for input data, should we be adding a test for the read_file function??
  data <- simulate_data(number_of_participants,covariance_matrix,outcome_column,means)
  randomized_data <- randomize(data=data,seed=seed)
  #set rule to stratify data
  stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)
  # incorporate groups check in expect_

  #produce the split dataset into number of folds
  folded_data <- split_data(stratified_data=stratified_data, nfolds=nfolds)

  expect_type(folded_data[[1]], "list")
  #expect_true(file.exists(groups), info = "Groups information should exist as a file")
  expect_length(folded_data, nfolds)
})
