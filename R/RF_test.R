#' RF_test
#'
#' this function trains a random forest model with training data folds
#' @param random_forest
#' @param testing_dataset
#' @param proximity_flag
#' @keywords RF_test
#' @export
#' @examples
#' number_of_training_participants <- 10
#' number_of_testing_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' mtry <- 1
#' nodesize <- 1
#' training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#' model_type <- rfsrc()
#' random_forest <- RF_Train(training_dataset,formula,mtry,nodesize,model_type)
#' testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)
#' Optimal_RF_Parameters <- RF_Test(object=random_forest,newdata=testing_dataset,proximity=TRUE)

RF_test <- function(object=random_forest,newdata=testing_dataset,proximity_flag=TRUE){
  library(randomForestSRC)
  Optimal_RF_Parameters = predict(object=object,newdata=newdata,proximity=proximity_flag)
  return(Optimal_RF_Parameters)
}