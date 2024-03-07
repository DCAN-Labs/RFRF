#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 4) {
  stop("Usage: Rscript script.R input_data_path input_data_ext input_data_file nfolds_info")
}

# read in input data and fold information from cross_validation.R
input_data_path <- args[1]
input_data_ext <- args[2]
input_data_file <- args[3]
nfolds_info <- args[4]

input_data = read_file(input_data_path,input_data_ext,input_data_file)
