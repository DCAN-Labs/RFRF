#' Parse input data and return user params, datatype, unformatted data
#' @return Returns missing data info, unformatted data, user inputs, data type
#' @keywords 

read_in_dat = function(data_path,
                       user_input) {
  input.dat = readr::read_csv(data_path, col_names = FALSE, col_types = cols())
  if (is.character(input.dat[[1,1]])) {
    
        data.type = "df" #"df" for dataframe, "pm" for proximity matrix
        format.dat = data.frame(input.dat[-1,])
        names(format.dat) = input.dat[1,]
        
  } else if () {
    
  } else {
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}