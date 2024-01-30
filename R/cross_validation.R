#' cross_validation
#'
#' this function is used to create folds of the training data for training the model
#' @param training_dataset the training data
#' @param seed initialize a random number generator with a specific seed value
#' @param groups information on how the stratified data will be grouped (name of column, index of column, vector)
#' @param nfolds number of folds in the data if using split_data for cross validation
#' @keywords cross_validation
#' @export
#' @examples
#' number_of_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' seed <- set.seed(7)
#' groups <- rep(1:2, each = 5) #information on how the stratified data will be grouped
#' nfolds <- 5
#' data <- simulate_data(number_of_participants,covariance_matrix,outcome_column,means)
#' randomized_data <- randomize(training_dataset=data,seed=seed)
#' stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)
#' folded_data <- split_data(stratified_data=stratified_data, nfolds=nfolds)

cross_validation <- function(training_dataset=training_dataset, seed=seed, groups=groups, nfolds=nfolds){
  library(RFRF)
  randomized_data = randomize(training_dataset, seed)
  stratified_data = stratify_data(randomized_data, groups)
  folded_data = split_data(stratified_data, nfolds)
  return(folded_data)
}
