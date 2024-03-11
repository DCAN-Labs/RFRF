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

  #randomize data
  randomized_data <- randomize(data=data,seed=seed)

  #set rule to stratify data
  stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)

  #produce the split dataset into number of folds
  folded_data <- split_data(stratified_data=stratified_data, nfolds=nfolds)

  #test the cross_validation function
  cv_result <- cross_validation(training_dataset = data, seed = seed, groups = groups, nfolds = nfolds)

  expect_type(folded_data[[1]], "list")
  expect_type(cv_result, "list")
  expect_length(folded_data, nfolds)
  expect_length(result, nfolds)
  expect_true(file.exists("nfolds.txt"), info = "nfolds.txt file should be created")
  #check if the file contains the correct number of lines
  file_contents <- readLines("nfolds.txt")
  expected_lines <- nfolds * 4  # (Fold N: + Train indices: + Test indices: + blank line) * nfolds
  expect_length(file_contents, expected_lines, info = "nfolds.txt should have the correct number of lines")
  #check if the file contains the expected information
  for (i in 1:nfolds) {
    fold_line <- grep(paste0("Fold ", i, ":"), file_contents, value = TRUE)
    expect_true(length(fold_line) == 1, info = paste0("Fold ", i, " information should be present"))
  }
  unlink("nfolds.txt")
})
