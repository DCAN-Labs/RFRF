#' Parse input data and return user params, datatype, unformatted data
#' @return Returns missing data info, unformatted data, user inputs, data type in a list
#' @keywords 

read_in_dat = function(data.path,
                       long.data = FALSE,
                       outcome.var = NULL) {
  input.dat = readr::read_csv(data.path, col_names = FALSE, col_types = cols())
  
  if (is.character(input.dat[[1,1]])) {
    
        data.type = "ds" #"df" for dataset, "pm" for proximity matrix
        format.dat = data.frame(input.dat[-1,])  
        names(format.dat) = input.dat[1,]
        outcome.var = ifelse(is.null(outcome.var), 
               names(format.dat)[1],
               outcome.var)
        
  } else if (is.numeric(input.dat[[1]])) {
    
        data.type = "pm"
        format.dat = data.frame(input.dat)
        names(format.dat) = paste("sub", sprintf("%04d", c(1:ncol(format.dat))),sep="")
    
  } else {
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}