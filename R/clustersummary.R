#' Provides summary of groups created from Kmeans clustering, including centroid coordinates,
#' number of data points in training data assigned to each cluster, and within-cluster distance metrics.
#' 
#' @param centroids : data.frame, containing centroid coordinates
#' @param cluster_assignments : vector, containing assigned clusters
#'
#' @return data.frame, dataframe displaying, for each cluster: centroid coordinates, 
#'         number of data points in training data assigned to each cluster, 
#'         and within-cluster distance metrics
#'
#'
#' @examples
#' library(KMeans)
#' X = data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' kmeans_results = fit(X, 2)
#' cluster_summary(kmeans_results[1], kmeans_results[2])
clustersummary <- function(centroids, cluster_assignments) {

}