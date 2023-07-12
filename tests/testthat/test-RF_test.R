  #This script is a unit test to ensure that RF_Test produces expected outputs

test_that("RF_Test", {

  # declare remaing expected input variables for RF_Test
  model.type <- rfsrc()
  # file.name <- "example_name.tsv"
  file_path = "./R/RF_train_unit_test.R"
  source(file_path)
  number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)

  # create simulated dataset for RF_Test
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #test the RF_Test function
  Optimal_RF_Parameters <- RF_Test(random_forest, testing_dataset, proximity_flag)


  #check the outputs, 'expect_' should have two main arguments, which 'expect_' function do we want?
  expect_equal(Optimal_RF_Parameters$call)
  expect_equal(Optimal_RF_Parameters$mtry)
  expect_equal(Optimal_RF_Parameters$nodesize)
  expect_equal(Optimal_RF_Parameters$err.rate)
  expect_equal(Optimal_RF_Parameters$proximity)
  expect_equal(Optimal_RF_Parameters$yvar)
  expect_equal(Optimal_RF_Parameters$yvar.names)
  expect_equal(Optimal_RF_Parameters$xvar)
  expect_equal(Optimal_RF_Parameters$xvar.names)
  # expect_equal(2 * 2, 4)

})

