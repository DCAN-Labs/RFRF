library(dplyr)

getAllData <- function(csvInputFileName) {
  data <- read.csv(file = csvInputFileName)

  return(data)
}

trainTestSplit <- function(df) {
  #make this example reproducible
  set.seed(1)

  #create ID column
  df$id <- 1:nrow(df)

  #use 70% of dataset as training set and 30% as test set
  train <- df %>% dplyr::sample_frac(0.70)
  test  <- dplyr::anti_join(df, train, by = 'id')

  results <- list(train, test)

  return(results)
}

main <- function(inputFileName, outputFileName) {
  allData <- getAllData(inputFileName)
}
