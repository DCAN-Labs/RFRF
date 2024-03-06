#' read_file
#'
#' this function reads in an input file to be used to create the input dataframe.
#' @param file_path path to the input file
#' @param file_type the file extension (supported extensions: "csv", "tsv", txt")
#' @param file_name name of the file for the input dataframe
#' @return a dataframe containing the data from the input file
#' @keywords read_file
#' @export
#' @examples
#' file_path = "path/to/file"
#' file_type = "csv"
#' file_name = "test"
#' data = read_file(file_path,file_type,file_name)


read_file <- function(file_path,file_type,file_name){
  full_file_path <- paste0(file_path, "/", file_name, ".", file_type)

  if (!file.exists(full_file_path)){
    stop("Input data file not found")
  }

  if (file_type == "csv"){
    data <- read.csv(full_file_path, na.strings=c("", "NA"))
  } else if (file_type == "tsv"){
    data <- read.delim(full_file_path, na.strings=c("", "NA"))
  } else if (file_type == "txt") {
    data <- read.table(full_file_path)
  } else {
    stop("Unsupported input data file type")
  }

  return(data)
}
