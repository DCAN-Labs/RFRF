#' Checks whether certain subjects or variables are missing more than 15% of their data
#` @param frmtdat formatted data object
#' @return Returns TRUE for yes, FALSE for no, as well as a mask of the subs/vars > 15% missing data
flag_missing_grtr_15per = function(frmtdat, dim = c("subs", "vars")) {
  
  #frmtdat = match.arg(frmtdat)
  #dim = match.arg(dim)
  
  if (is.null(frmtdat)) {
    stop("must provide formatted data object")
  }
  
  if (dim == "subs") {
    
    mask = rowSums(is.na(frmtdat)) > (.15*ncol(frmtdat))
    flag = ifelse(sum(ans) > 0, TRUE, FALSE)
    out = list(flag, mask)
    
  } else if (dim == "vars") {
    
    mask = colSums(is.na(frmtdat)) > (.15*nrow(frmtdat))
    flag = ifelse(sum(ans) > 0, TRUE, FALSE)
    out = list(flag, mask)
    
  } else {
    
    stop("must specify whether to check variables or subjects")
    
  }
  
  return(out)
  
}