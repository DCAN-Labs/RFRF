#' Checks whether certain subjects are missing more than 15% of their data
#' @return Returns TRUE for yes, FALSE for no, as well as a mask of the subs > 15% missing data

flag_sub_missing_grtr_15per = function(frmtdat) {
  
  if (is.null(frmtdat)) {
    stop("must provide formatted data object")
  }
  
  mask = rowSums(is.na(frmtdat)) > (.15*ncol(frmtdat))
  flag = ifelse(sum(ans) > 0, TRUE, FALSE)
  out = list(flag, mask)
  
  return(out)
  
}