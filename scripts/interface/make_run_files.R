#!/usr/bin/env Rscript

# read in input data and fold information from cross_validation.R
input_data_path <- "input_data_path"
input_data_ext <- "input_data_ext"
input_data_file <- "input_data_file"
nfolds_info <- "nfolds.txt"

input_data = read_file(input_data_path,input_data_ext,input_data_file)