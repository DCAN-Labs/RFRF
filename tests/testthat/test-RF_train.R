#This script is a unit test to ensure that RF_Train produces expected outputs

test_that("RF_train", {

  #declare our expected input variables
  number_of_training_participants <- 10
  #number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)

  #create simulated data for the RF_train
  training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
  #testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #train the RF model
  random_forest <- RF_Train(ntrain_folds,training_dataset,formula,mtry,nodesize)

  #check the outputs (TODO: replaced by a search/these things equal, with usethis and testthat )
  expect_equal(random_forest$call)
  expect_equal(random_forest$mtry)
  expect_equal(random_forest$nodesize)
  expect_equal(random_forest$yvar)
  expect_equal(random_forest$yvar_names)
  expect_equal(random_forest$xvar)
  expect_equal(random_forest$xvar_names)
  expect_equal(random_forest$forest)
  #expect_equal(2 * 2, 4)
})
