# TODO RFSRC

library(dplyr)

# Questions:
# * What does stratify_data() do?  Should it do this kind of thing:
#     https://www.rdocumentation.org/packages/splitstackshape/versions/1.4.8/topics/stratified

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

stratify_data <- function(df, stratify_by, even_stratification) {

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
