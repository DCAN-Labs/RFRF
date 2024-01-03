#' randomize
#'
#' this function provides a randomized dataset to be used by the stratify_data function.
#' @param data dataframe of the full data read in by the read_file function
#' @param seed initialize a random number generator with a specific seed value
#' @keywords randomize
#' @export
#' @examples
#' simulate_data(number_of_participants=10, covariance_matrix=diag(2), outcome_column=1, means=c(0,0))
#' randomized_data <- randomize(data=data, seed = 7)

randomize <- function(data, seed = NULL){
  if (!is.null(seed)) set.seed(seed)
  randomized_data = data[sample(nrow(data)), ] # randomly reorders the rows of the data
  return(data.frame(randomized_data))
}
