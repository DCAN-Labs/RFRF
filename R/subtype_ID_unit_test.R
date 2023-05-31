#This script is a unit test to ensure that RF_Prediction produces expected outputs

#loads neccessary environment, packages, and dependencies
library(RFRF)

# do we need to combine RF_Optimal_Test and RF_Prediction?

# declare the expected input variables
proximity <- array()
yvar <- data.frame
yvar.names <- string
xvar <- data.frame
xvar.names <- string
err.rate <- float

# create matrix to graph
matrix_to_graph <- RF_Prediction(proximity, yvar, yvar.names, xvar, xvar.names, err.rate, testing_dataset) # does testing_dataset need to be included here, or is it satisfied with xvar and yvar?

# check the outputs
print(matrix_to_graph.adjmatrix)
print(matrix_to_graph.mode)
print(matrix_to_graph.weighted)
print(matrix_to_graph.diag)
#print(matrix_to_graph.graph_from_adjacency_mattrix())