#' RF_model
#'
#' this function trains then tests a random forest model with training and testing data folds
#' @param training_dataset the training data
#' @param formula
#' @param Optimal_RF_Parameters returned from RF_test function
#' @param model_type
#' @param optimal_random_forest the resulting object from RF_optimal_train function
#' @param testing_dataset the heldout data from holdout function
#' @param proximity_flag boolean; whether or not proximity should be calculated
#' @keywords RF_optimal_train, RF_optimal_test
#' @export
#' @examples
#' number_of_training_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#' testing_dataset <- simulate_data(number_of_testing_participants,covariance_matrix,outcome_column,means)
#' optimal_random_forest <- RF_optimal_train(data=training_dataset,formula=y~x,Optimal_RF_Parameters=NULL,model_type="rfsrc")
#' RF_prediction <- RF_optimal_test(object=optimal_random_forest,newdata=testing_dataset,proximity_flag=TRUE)


RF_optimal_train <- function(data=training_dataset,formula=y~x,Optimal_RF_Parameters=NULL,model_type="rfsrc"){
  library(randomForestSRC)
  if (model_type=="rfsrc"){
    optimal_random_forest = rfsrc(formula=formula,data=data,Optimal_RF_Parameters=Optimal_RF_Parameters)
  } else if (model_type=="rfsrc.fast"){
    optimal_random_forest = rfsrc.fast(formula=formula,data=data,Optimal_RF_Parameters=Optimal_RF_Parameters)
  } else if (model_type=="sidClustering.rfsrc"){
    optimal_random_forest = sidClustering.rfsrc(formula=formula,Optimal_RF_Parameters=Optimal_RF_Parameters)
  } else if (model_type=="imbalanced.rfsrc"){
    optimal_random_forest = imbalanced.rfsrc(formula=formula,data=data,Optimal_RF_Parameters=Optimal_RF_Parameters)
  } else if (model_type=="quantreg.rfsrc"){
    optimal_random_forest = quantreg.rfsrc(formula=formula,data=data,Optimal_RF_Parameters=Optimal_RF_Parameters)
  }
  return(optimal_random_forest)
}

RF_optimal_test <- function(object=optimal_random_forest,newdata=testing_dataset,proximity_flag=TRUE){
  library(randomForestSRC)
  Optimal_RF_Parameters = predict(object=object,newdata=newdata,proximity=proximity_flag)
  return(RF_prediction)
}
