#' split_data
#'
#' this function provides a split dataset to be used by the cross_validation function.
#' @param stratified_data dataframe of the stratified data returned by the stratify_by function
#' @param holdout_fraction fraction of data that will be heldout for training the model, if using split_data for holdout
#' @param nfolds number of folds in the data if using split_data for cross validation
#' @keywords split
#' @export
#' @examples
#' simulate_data(number_of_participants=10, covariance_matrix=diag(2), outcome_column=1, means=c(0,0))
#' randomized_data <- randomize(data=data, seed = 7)
#' stratified_data <- stratify_data(randomized_data=randomized_data,groups=groups)
#' train_and_test <- split_data(stratified_data=stratified_data,holdout_fraction=0.8)
#' folded_data <- split_data(stratified_data=train_and_test$training_dataset,nfolds=5)

split_data <- function(stratified_data, holdout_fraction=0, nfolds=0){
  if (holdout_fraction > 0){
    n = nrow(stratified_data)
    train_size = round(holdout_fraction * n)

    training_dataset <- stratified_data[1:train_size, ]
    testing_dataset <- stratified_data[(train_size + 1):nrow(stratified_data), ]

    return(list(training_dataset = training_dataset, testing_dataset = testing_dataset))
  }else{
    n = nrow(stratified_data)
    train_fold_size = round(n/nfolds)
    fold_list <- list()

    for (fold in 1:nfolds)
    {
      indices <- seq(from = train_fold_size*fold+1-train_fold_size, to = train_fold_size*fold)
      fold_list[[fold]] <- stratified_data[indices, ]
    }
    return(fold_list)
  }
}
