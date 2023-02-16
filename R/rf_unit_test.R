#' random forest unit test
#'
#' this is a unit test for the random forest module
#' @param data output of simulate_data.R
#' @param train_data_folds the number of training folds to be used to train the RF model. Default is 1
#' @param formula what data we are using to predict the outcome. Default is 'y ~ .'
#' @param mtry optimal desired mtry. Default is 0
#' @param nodesize optimal desired nodesize. Default is 0
#' @keywords random forest unit test
#' @export
#' @example rfsrc(formula, data, mtry=0, nodesize=0)
