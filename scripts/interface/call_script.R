#!/usr/bin/env Rscript

library(RFRF)

#load input data
input_data <- read_file(input_data_path, input_data_ext, input_data_file)

#split data into train and test sets
train_data <- input_data[TRAIN_INDICES_PLACEHOLDER, ]
test_data <- input_data[TEST_INDICES_PLACEHOLDER, ]

# Train the model
model <- train_model(train_data, model_type)

# Evaluate the model
evaluation_metrics <- evaluate_model(model, test_data)

# Save the model and evaluation metrics
save_model(model, paste0("model_", model_type, "_fold_", fold_number, ".rds"))
save_metrics(evaluation_metrics, paste0("metrics_", model_type, "_fold_", fold_number, ".csv"))
