#' Subtype_ID
#'
#' this function takes the proximity matrix from RF_optimal_test and creates a proximity graph, then utilizes infomap for community detection
#' @param proximity_matrix the resulting proximity matrix from RF_prediction
#' @param mode specifies how igraph should interpret the supplied matrix
#' @param weighted whether or not to create a weighted graph from supplied matrix
#' @param diag whether or not to include the diagonal of the supplied matrix in the calculation
#' @keywords Subtype_ID
#' @export
#' @examples
#' proximity_matrix <- RF_prediction$proximity
#' mode = "undirected"
#' weighted = TRUE
#' diag = FALSE
#' subtypes = Subtype_ID(proximity_matrix=proximity_matrix, mode=mode, weighted=weighted, diag=diag)

Subtype_ID <- function(proximity_matrix=proximity_matrix, mode=mode, weighted=weighted, diag=diag){
  library(igraph)
  proximity_graph = graph_from_adjacency_matrix(proximity_matrix, mode=mode, weighted=weighted, diag=diag)
  subtypes = cluster_infomap(proximity_graph)
  return(subtypes)
}
