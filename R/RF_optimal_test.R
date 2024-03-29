#' RF_optimal_test
#'
#' this function tests the optimal random forest model from RF_optimal_train with testing data folds
#' @param optimal_random_forest the resulting object from RF_optimal_train function
#' @param testing_dataset the heldout data from holdout function
#' @param proximity_flag boolean; whether or not proximity should be calculated
#' @keywords RF_optimal_test
#' @export
#' @examples
#' number_of_training_participants <- 10
#' number_of_testing_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#' mtry <- 1
#' nodesize <- 1
#' formula <- y~x
#' model_type <- rfsrc()
#' random_forest <- RF_Train(training_dataset,formula,mtry,nodesize,model_type)
#' testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)
#' proximity <- TRUE
#' Optimal_RF_Parameters <- RF_Test(object=random_forest,newdata=testing_dataset,proximity=proximity)
#' optimal_random_forest <- RF_optimal_train(data=training_dataset,formula=y~x,Optimal_RF_Parameters=NULL,model_type="rfsrc")
#' RF_prediction <- RF_optimal_test(object=optimal_random_forest,newdata=testing_dataset,proximity_flag=TRUE)

RF_optimal_test <- function(object=optimal_random_forest,newdata=testing_dataset,proximity_flag=TRUE){
  library(randomForestSRC)
  RF_prediction = predict(object=object,newdata=newdata,proximity=proximity_flag)
  return(RF_prediction)
}
