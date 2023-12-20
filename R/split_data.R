#' split_data
#'
#' this function provides a split dataset to be used by the cross_validation function.
#' @param stratified_data dataframe of the stratified data returned by the stratify_by function
#' @param holdout_fraction fraction of data that will be heldout for training the model
#' @keywords split
#' @export
#' @examples
#' simulate_data(number_of_participants=10, covariance_matrix=diag(2), outcome_column=1, means=c(0,0))
#' randomized_data <- randomize(data=data, seed = 7)
#' stratified_data <- stratify_by(randomized_data=randomized_data,groups=groups)
#' train_and_test <- split_data(stratified_data=stratified_data,holdout_fraction=0.8)

split_data <- function(stratified_data, holdout_fraction){
  n = length(stratified_data)
  train_size = round(holdout_fraction * n)

  train_set = stratified_data[seq_len(train_size)]
  test_set = stratified_data[-seq_len(train_size)]

  training_dataset = relist(train = train_set)
  testing_dataset = relist(test = test_set)
  return(data.frame(training_dataset),data.frame(testing_dataset))
}
