#' model_select
#'
#' this function takes in a string hyperparameter to determine which random forest model to produce optimal parameters.
#' @param hyperparameter string hyperparameter defining model type. Options include 'classification', 'fast_classification', 'clustering', 'imbalanced', or 'quantile_regression'
#' @return a model type defined for RF_train and RF_test to produce optimal RF parameters
#' @keywords model_select
#' @export
#' @examples
#' hyperparameter = "classification"
#' model_type <- model_select(hyperparameter)

model_select <- function(hyperparameter) {
  hyperparameter <- tolower(hyperparameter)

  if (hyperparameter == "classification") {
    model_type <- rfsrc
  } else if (hyperparameter == "fast_classification") {
    model_type <- rfsrc.fast
  } else if (hyperparameter == "clustering") {
    model_type <- sidClustering.rfsrc
  } else if (hyperparameter == "imbalanced") {
    model_type <- imbalanced.rfsrc
  } else if (hyperparameter == "quantile_regression") {
    model_type <- quantreg.rfsrc
  } else {
    stop("Invalid hyperparameter value. Please enter 'classification', 'fast_classification', 'clustering', 'imbalanced', or 'quantile_regression'.")
  }

  return(model_type)
}
