  #This script is a unit test to ensure that RF_Test produces expected outputs

  #loads neccessary environment, packages, and dependencies
  library(RFRF)

  # declare remaing expected input variables for RF_Test
  hyperparameter <- rfsrc()
  file.name <- "example_name.tsv"
  file_path = "./R/RF_train_unit_test.R"
  source(file_path)
  number_of_testing_participants <- 10
  covariance_matrix <- diag(2)
  outcome_column <- 1
  means <- c(0,0)

  # create simulated dataset for RF_Test
  testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

  #test the RF_Test function
  Optimal_RF_Parameters <- RF_test(object=random_forest, newdata=testing_dataset)

  #check the outputs
  print(Optimal_RF_Parameters$call)
  print(Optimal_RF_Parameters$mtry)
  print(Optimal_RF_Parameters$nodesize)
  print(Optimal_RF_Parameters$err.rate)
  print(Optimal_RF_Parameters$proximity)
  print(Optimal_RF_Parameters$yvar)
  print(Optimal_RF_Parameters$yvar.names)
  print(Optimal_RF_Parameters$xvar)
  print(Optimal_RF_Parameters$xvar.names)




