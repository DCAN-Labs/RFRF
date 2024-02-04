#' RF_optimal_train
#'
#' this function trains the optimal random forest parameters with training folds
#' @param training_dataset the training data
#' @param formula formula describing the model fit
#' @param Optimal_RF_Parameters returned from RF_test function
#' @param model_type which type of rfsrc to use
#' @keywords RF_optimal_train
#' @export
#' @examples
#' number_of_training_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#' optimal_random_forest <- RF_optimal_train(data=training_dataset,formula=y~x,Optimal_RF_Parameters=NULL,model_type="rfsrc")


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
