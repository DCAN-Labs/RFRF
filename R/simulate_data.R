#' simulate data
#'
#' this function provides a simulated data set for the RF unit test.
#' @param number_of_participants Provide the number of participants in the dataset. Default is 3.
#' @param covariance_matrix Matrix representing the relationship between the variables. Default is an identity matrix with 2 variables.
#' @param outcome_column Indicates what the outcome column is to be specified. Default is first column.
#' @param means Indicates the means of the matrix. Default is c(0,0).
#' @keywords simulate
#' @export
#' @examples
#' simulate_data(number_of_participants=3, covariance_matrix=diag(2), outcome_column=1, means=c(0,0))

simulate_data <- function(number_of_participants=3, covariance_matrix=diag(2), outcome_column=1, means=c(0,0)){
  library(MASS)
  sim_data <- mvrnorm(n=number_of_participants,mu=means,Sigma=covariance_matrix)
  data=list()
  data["y"] <- list(sim_data[,outcome_column])
  data["x"] <- list(sim_data[,outcome_column*-1])
  return(data)
}
