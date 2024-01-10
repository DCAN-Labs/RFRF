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


# how do we potentially incorporate stratify_by and even_stratification??
split_data <- function(stratified_data, holdout_fraction, nfolds){
  if (holdout_fraction > 0){ #may need to edit this condition
    n = length(stratified_data)
    train_size = round(holdout_fraction * n)

    train_set = stratified_data[seq_len(train_size)]
    test_set = stratified_data[-seq_len(train_size)]

    training_dataset <- data.frame(train = train_set)
    testing_dataset <- data.frame(test = test_set)

    return(list(training_dataset = training_dataset, testing_dataset = testing_dataset))
  }else{
    n = length(stratified_data)
    train_fold_size = round(n/nfolds)

    train_fold = stratified_data[seq_len(train_fold_size)]
    test_fold = stratified_data[-seq_len(train_fold_size)]

    training_fold <- data.frame(train = train_fold)
    testing_fold <- data.frame(test = test_fold)
    #needs to return a dataframe for each fold instead of train and test
    return(list(training_fold = training_fold, testing_fold = testing_fold))
  }
}
