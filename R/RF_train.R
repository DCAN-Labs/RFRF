#' RF_train
#'
#' this function trains a random forest model with training data folds
#' @param ntrain_folds
#' @param data
#' @param formula
#' @param mtry
#' @param nodesize
#' @param model_type
#' @keywords RF_train
#' @export
#' @examples
#' number_of_training_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' training_dataset <- simulate_data(number_of_training_participants,covariance_matrix,outcome_column,means)
#' random_forest <- RF_Train(ntrain_folds=10,data=training_dataset,formula=y~x,mtry=NULL,nodesize=NULL,model_type="rfsrc")


RF_train <- function(ntrain_folds=10,data=training_dataset,formula=y~x,mtry=NULL,nodesize=NULL,model_type="rfsrc"){
  library(randomForestSRC)
  if (model_type=="rfsrc"){
    random_forest = rfsrc(formula=formula,data=data,mtry=mtry,nodesize=nodesize)
  } else if (model_type=="rfsrc.fast"){
    random_forest = rfsrc.fast(formula=formula,data=data,mtry=mtry,nodesize=nodesize)
  } else if (model_type=="sidClustering.rfsrc"){
    random_forest = sidClustering.rfsrc(formula=formula,data=data,mtry=mtry,nodesize=nodesize)
  } else if (model_type=="imbalanced.rfsrc"){
    random_forest = imbalanced.rfsrc(formula=formula,data=data,mtry=mtry,nodesize=nodesize)
  } else if (model_type=="quantreg.rfsrc"){
    random_forest = quantreg.rfsrc(formula=formula,data=data,mtry=mtry,nodesize=nodesize)
  }
  return(random_forest)
}
