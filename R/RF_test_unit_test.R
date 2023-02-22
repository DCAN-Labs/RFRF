#This script is a unit test to ensure that Predict_RFSRC produces expected outputs

#loads neccessary environment, packages, and dependencies
library(RFRF)

# declare remaing expected input variables for Predict_RFSRC
hyperparameter <- rfsrc()
file.name <- "example_name.tsv"
file_path = "/Users/lundq163/Desktop/RFRF/R/RF_train_unit_test.R"
source(file_path)
number_of_testing_participants <- 10
covariance_matrix <- diag(2)
outcome_column <- 1
means <- c(0,0)

# create simulated dataset for Predict_RFSRC
testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

#test the Predict_RFSRC function
Optimal_RF_Parameters <- Predict_RFSRF(hyperparameter, file.name, random_forest, testing_dataset)

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




