source("./scripts/parse_rf_dat.R")

getAllData <- function(csvInputFileName) {
  data <- read.csv(file = csvInputFileName)

  return(data)
}

main <- function(input_file_name, output_file_name) {
}
