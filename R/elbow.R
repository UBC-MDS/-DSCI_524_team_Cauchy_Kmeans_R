#' Creates a plot of inertia vs number of cluster centers
#' as per the elbow method. Calculates and returns the inertia
#' values for all cluster centers. Useful for identifying the optimal
#' number of clusters while using the k-means clustering algorithm.
#'
#' @param X data.frame, Input data that is to be clustered
#' @param centers : array, containing all numbers of cluster centers
#' that are to be tried.
#'
#' @return array, containing inertia values for all numbers of cluster centers
#'
#' @examples
#' library(KMeans)
#' X <- data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' centers <- c(2, 3, 4, 5)
#' elbow(X, centers)

elbow <- function(X, centers, distance_metric = "euclidean") {

}
