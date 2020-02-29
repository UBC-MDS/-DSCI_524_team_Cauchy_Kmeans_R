#' Assigns new data points to clusters based on closest centroid. 
#' 
#' @param X_new data.frame, new data to assign to clusters
#' @param centroids : data.frame, containing centroid coordinates
#' @param distance_metric : string, distance metric to measure proximity of data to cluster centers.
#'        Can take on values: "euclidean" (default), "manhattan", "mahalanobis"
#'
#' @return vector, assigned clusters for each point in X_new
#'
#' @examples
#' library(KMeans)
#' X = data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' kmeans_results = fit(X, 2)
#' X_new = data.frame(x1 = c(1, 4),
#'                    x2 = c(3, 2))
#' predict(X_new, kmeans_results[1])
predict <- function(X_new, centroids, distance_metric = "euclidean") {

}