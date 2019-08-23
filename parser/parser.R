#' Parse input data and return user params, datatype, unformatted data
#' @return Returns missing data info, unformatted data, user inputs, data type in a list
#' @keywords 

source(paste(dirname(rstudioapi::getSourceEditorContext()$path), "check_num_mat.R", sep="/"))
parse.rf.dat = function(data.path,
                       dat.type = c("ds", "pm"),
                       outcome.var = NULL) {
  dat.type = match.arg(dat.type)
  if (dat.type == "ds") {
    
    input.dat = readr::read_csv(data.path, col_names = TRUE, col_types = cols())
    input.dat[,sapply(input.dat, is.character)] = lapply(input.dat[,sapply(input.dat, is.character)], factor)
    format.dat = data.frame(input.dat)
    outcome.var = ifelse(is.null(outcome.var), 
                         names(format.dat)[1],
                         outcome.var)
    
  } else if (dat.type == "pm") {
    
    input.dat = readr::read_csv(data.path, col_names = FALSE, col_types = cols())
    if (check_num_mat(input.dat)) {
      
      format.dat = data.frame(input.dat)
      names(format.dat) = paste("sub", sprintf("%04d", c(1:ncol(format.dat))),sep="")
      
    } else {
      
      stop("Data type does not conform to package requirements - double check that data are numeric")
    }
    
  } else {
    
    stop("unspecified input data type ('ds' or 'pm')")
    
  }

  ## check for missing data
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}