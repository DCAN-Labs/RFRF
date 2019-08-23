#' Checks that all elements in a matrix are numeric
#' @return Returns TRUE for yes, FALSE for no

check_num_mat = function(mat2check) {
  
  ans = sum(sapply(as.matrix(mat2check), is.numeric))/length(sapply(as.matrix(mat2check), is.numeric))
  out = ifelse(ans == 1, TRUE, FALSE)
  return(out)
  
}