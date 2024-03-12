#!/usr/bin/env Rscript

library(RFRF)

#load input data
input_data_path <- INPUT_DATA_PATH_VAR
input_data_ext <- INPUT_DATA_EXT_VAR
input_data_file <- INPUT_DATA_FILE_VAR
input_data <- read_file(input_data_path, input_data_ext, input_data_file)

#split data into train and test sets
train_data <- input_data[TRAIN_INDICES, ]
test_data <- input_data[TEST_INDICES, ]

#train the model
model_type <- MODEL_TYPE_VAR
random_forest <- RF_train(data=train_data,formula=y~x,mtry=NULL,nodesize=NULL,model_type=model_type)

#test the model
Optimal_RF_Parameters <- RF_test(object=random_forest,newdata=test_data,proximity=TRUE)

# Save the model and parameters
save(random_forest, paste0("model_", model_type, "_fold_", fold_number, ".rds"))
save(Optimal_RF_Parameters, paste0("parameters_", model_type, "_fold_", fold_number, ".rds"))
