#' holdout
#'
#' this function is used to holdout input data from being trained on the model
#' @param file_path path to the input dataframe
#' @param seed initialize a random number generator with a specific seed value
#' @param groups information on how the stratified data will be grouped (name of column, index of column, vector)
#' @param holdout_fraction fraction of data that will be heldout for training the model
#' @keywords holdout
#' @export
#' @examples
#' number_of_participants <- 10
#' covariance_matrix <- diag(2)
#' outcome_column <- 1
#' means <- c(0,0)
#' seed <- set.seed(7)
#' groups <- rep(1:2, each = 5) #information on how the stratified data will be grouped
#' holdout_fraction <- 0.8
#' data <- simulate_data(number_of_participants,covariance_matrix,outcome_column,means)
#' randomized_data <- randomize(data=data,seed=seed)
#' stratified_data <- stratify_data(randomized_data=randomized_data, groups=groups)
#' train_and_test <- split_data(stratified_data=stratified_data, holdout_fraction=holdout_fraction)

holdout <- function(file_path=file_path, seed=seed, groups=groups, holdout_fraction=holdout_fraction){
  library(RFRF)
  data = read_file(file_path)
  randomized_data = randomize(data, seed)
  stratified_data = stratify_data(randomized_data, groups)
  train_and_test = split_data(stratified_data, holdout_fraction)

  file_name <- "holdout.txt"
  file_conn <- file(file_name, "w")

  train_indices <- unlist(train_and_test$train)
  test_indices <- unlist(train_and_test$test)

  cat("Train indices: ", paste(train_indices, collapse = ", "), "\n", file = file_conn, append = TRUE)
  cat("Test indices: ", paste(test_indices, collapse = ", "), "\n", file = file_conn, append = TRUE)

  close(file_conn)

  return(train_and_test)
}
