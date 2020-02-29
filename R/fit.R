#' This takes non-labeled data to perform unsupervised classification
#' using kmeans algorithm into k clusters.
#' It returns labels for each data point according to the cluster it belong and also cluster centers
#'
#' @param X_train : dataframe, the non-labeled data to be clustered.
#' @param k : integer vector, single number mentioning the number of clusters the data is to be classified.
#'
#' @return indexed list, containing 2 vectors, one with cluster centers coordinates and other with cluster labels for each sample .
#'
#' @examples
#' 
#' X_train <- data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' k <- c(4)
#' kmeans <- fit(X_train, k)
#' kmeans['centers']
#' kmeans['labels']

fit <- function(X_train, k) {

}