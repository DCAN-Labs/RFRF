#' stratify_by
#'
#' this function provides a stratified dataset to be used by the split_data function.
#' @param randomized_data dataframe of the randomized data returned by the randomize function
#' @param groups information on how the stratified data will be grouped
#' @keywords stratify
#' @export
#' @examples
#' simulate_data(number_of_participants=10, covariance_matrix=diag(2), outcome_column=1, means=c(0,0))
#' randomized_data <- randomize(data=data, seed = 7)
#' stratified_data <- stratify_by(randomized_data=randomized_data,groups=groups)

stratify_data <- function(randomized_data, groups){
  grouped_data <- split(randomized_data, groups, drop=FALSE)
  stratified_data = unlist(grouped_data, recursive = FALSE)
  return(data.frame(stratified_data))
}
