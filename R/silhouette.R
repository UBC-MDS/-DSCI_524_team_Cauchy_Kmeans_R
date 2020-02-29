#' Plots a graph of silhouette scores for each k value
#' in the given array using fit. Returns a list of each k value
#' in k_array paired with its corresponding silhouette score.
#'
#' @param X : dataframe, the data to be clustered.
#' @param k_vector : vector, An array of all contending k values.
#'
#' @return vector, containing silhouette scores in the same order as k_vector.
#'
#' @examples
#' 
#' X <- data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' k_vector <- c(2, 3, 4, 5)
#' silhouette(X, k_vector)

silhouette <- function(X, k_vector) {

}
