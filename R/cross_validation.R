#' cross_validation
#'
#' this function is used to create folds of the training data for training the model
#' @param input_data the input data
#' @param seed initialize a random number generator with a specific seed value
#' @param groups information on how the stratified data will be grouped (name of column, index of column, vector)
#' @param nfolds number of folds in the data if using split_data for cross validation
#' @param holdout_file_path path to the holdout.txt containing train and test indicies information
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

cross_validation <- function(input_data, seed=seed, groups=groups, nfolds=nfolds, holdout_file_path){
  library(RFRF)

  holdout_data <- read.table(holdout_file_path, header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
  train_indices <- as.numeric(unlist(strsplit(holdout_data[1, 1], ", ")))
  training_dataset <- input_data[train_indices, ]

  randomized_data = randomize(training_dataset, seed)
  stratified_data = stratify_data(randomized_data, groups)
  folded_data = split_data(stratified_data, nfolds)

  file_name <- "nfolds.txt"
  file_conn <- file(file_name, "w")

  for (i in 1:nfolds) {
    train_indices <- unlist(folded_data$train[i])
    test_indices <- unlist(folded_data$test[i])

    cat(paste0("Fold ", i, ":\n"), file = file_conn, append = TRUE)
    cat("Train indices: ", paste(train_indices, collapse = ", "), "\n", file = file_conn, append = TRUE)
    cat("Test indices: ", paste(test_indices, collapse = ", "), "\n\n", file = file_conn, append = TRUE)
  }

  close(file_conn)

  return(folded_data)
}
