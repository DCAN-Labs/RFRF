#This script is a unit test to ensure that RF_Train produces expected outputs

#loads neccessary environment, packages, and dependencies
library(RFRF)

#declare our expected input variables
number_of_training_participants <- 10
#number_of_testing_participants <- 10
covariance_matrix <- diag(2)
outcome_column <- 1
means <- c(0,0)
nodesize <- 1
formula <- y~x
mtry <- 1

#create simulated data for the RF_train
training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)

#train the RF model
random_forest <- RF_train(data=training_dataset,formula=formula,mtry=mtry,nodesize=nodesize)

#check the outputs (TODO: replaced by a search/these things equal, with usethis and testthat )
print(random_forest$call)
print(random_forest$mtry)
print(random_forest$nodesize)
print(random_forest$yvar)
print(random_forest$yvar_names)
print(random_forest$xvar)
print(random_forest$xvar_names)
print(random_forest$forest)
