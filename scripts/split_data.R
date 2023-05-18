#' Split data
#'
#' Split data into training and validation.
#'
#' @import dplyr
#' @export

getAllData <- function(csvInputFileName) {
  data <- read.csv(file = csvInputFileName)

  return(data)
}

split_data <- function(df, holdout_fraction) {
  #create ID column
  df$id <- 1:nrow(df)

  train <- df %>% dplyr::sample_frac(holdout_fraction)
  test  <- dplyr::anti_join(df, train, by = 'id')

  results <- list(train, test)

  return(results)
}

randomize <- function(data) {
  shuffled_data= data[sample(1:nrow(data)), ]

  return(shuffled_data)
}

main <- function(inputFileName, outputFileName) {
  #make this example reproducible
  set.seed(1)

  allData <- getAllData(inputFileName)
}
