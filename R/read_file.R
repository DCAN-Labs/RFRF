#' read_file
#'
#' this function reads in an input file to be used to create the input dataframe.
#' @param file_path path to the input dataframe
#' @keywords read_file
#' @export
#' @examples
#' file_path = "path/to/file"
#' data = read_file(file_path=file_path)


read_file <- function(file_path=file_path){
  data <- read.csv(file_path, na.strings=c("", "NA"))
  return(data.frame(data))
}
