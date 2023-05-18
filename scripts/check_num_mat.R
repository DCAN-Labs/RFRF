#' check_num_mat
#' Checks that all elements in a matrix are numeric
#' @return Returns TRUE for yes, FALSE for no
#'
#' @param mat2check The matrix to check for solely numbers
#'
#' @return TRUE if and only if all the elements in the matrix are numeric
#'
#' @examples
#' check_num_mat(matrix(c(3:14), nrow = 4, byrow = TRUE)
check_num_mat = function(mat2check) {
  
  ans = sum(sapply(as.matrix(mat2check), is.numeric)) / length(sapply(as.matrix(mat2check), is.numeric))
  out = ifelse(ans == 1, TRUE, FALSE)
  
  return(out)
}