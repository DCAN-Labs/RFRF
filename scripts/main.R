source("parse_rf_dat.R")

main <- function() {
  data_path <- "../data/raw/predictions/prediction_toy_data.csv"
  parsed_rf_dat <- parse_rf_dat(data_path)
  print(parsed_rf_dat)
}



