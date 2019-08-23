#' Checks whether certain variables are missing more than 15% of their data
#' @return Returns TRUE for yes, FALSE for no, as well as a mask of the vars > 15% missing data

flag_var_missing_grtr_15per = function(frmtdat){
  
  if (is.null(frmtdat)) {
    stop("must provide formatted data object")
  }
  
  mask = colSums(is.na(frmtdat)) > (.15*nrow(frmtdat))
  flag = ifelse(sum(ans) > 0, TRUE, FALSE)
  out = list(flag, mask)
  
  return(out)
  
}