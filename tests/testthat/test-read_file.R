test_that("read_file", {
  library("RFRF")
  #file path needs to be updated to be more generalized if cloning repo
  #file_path <- "C:/Users/lundq163/Desktop/RFRF/data/raw/"
  #file_type <- "csv"
  #file_name <- "example_dataset"
  #data <- read_file(file_path, file_type, file_name)

  test_dir <- tempdir()

  csv_file <- file.path(test_dir, "test.csv")
  write.csv(data.frame(x = 1:3, y = letters[1:3]), csv_file, row.names = FALSE)
  csv_data <- read_file(test_dir, "csv", "test")

  tsv_file <- file.path(test_dir, "test.tsv")
  write.table(data.frame(x = 1:3, y = letters[1:3]), tsv_file, sep = "\t", row.names = FALSE)
  tsv_data <- read_file(test_dir, "tsv", "test")

  txt_file <- file.path(test_dir, "test.txt")
  write.table(data.frame(x = 1:3, y = letters[1:3]), txt_file, row.names = FALSE)
  txt_data <- read_file(test_dir, "txt", "test")

  expect_equal(nrow(csv_data), 3)
  expect_equal(ncol(csv_data), 2)
  expect_equal(nrow(tsv_data), 3)
  expect_equal(ncol(tsv_data), 2)
  expect_equal(nrow(txt_data), 3)
  expect_equal(ncol(txt_data), 2)
  expect_error(read_file(test_dir, "csv", "non_existent_file"), "File not found")
  expect_error(read_file(test_dir, "pdf", "test"), "Unsupported file type")

  unlink(test_dir, recursive = TRUE)
})
