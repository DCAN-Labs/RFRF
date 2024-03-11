#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 5) {
  stop("Usage: Rscript make_run_files.R input_data_path input_data_ext input_data_file nfolds_info model_type")
}

# read in input data and fold information from cross_validation.R
input_data_path = args[1]
input_data_ext = args[2]
input_data_file = args[3]
nfolds_info = args[4]
model_type = args[5]

input_data <- read_file(input_data_path,input_data_ext,input_data_file)

nfolds_data <- read.table(nfolds_info, header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

model_type <- model_select(model_type)


run_files_dir <- "fold_run_files"
if (!dir.exists(run_files_dir)) {
  dir.create(run_files_dir)
}

template_script <- readLines("call_script.R")

#iterate over each fold and create a run file
for (i in seq_len(nrow(nfolds_data))) {
  fold_number <- i
  train_indices <- as.numeric(unlist(strsplit(nfolds_data[i, 2], ", ")))
  test_indices <- as.numeric(unlist(strsplit(nfolds_data[i, 3], ", ")))

  #modify the template script with the appropriate train and test indices
  modified_script <- template_script
  modified_script <- gsub("TRAIN_INDICES_PLACEHOLDER", paste(train_indices, collapse = ", "), modified_script)
  modified_script <- gsub("TEST_INDICES_PLACEHOLDER", paste(test_indices, collapse = ", "), modified_script)

  #write the modified script to a new file in the run_files directory
  run_file_name <- file.path(run_files_dir, paste0("run_file_fold", fold_number, ".R"))
  writeLines(modified_script, run_file_name)
}
