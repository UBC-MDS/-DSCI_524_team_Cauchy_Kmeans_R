library(tidyverse)

#' Provides summary of groups created from Kmeans clustering, including centroid coordinates,
#' number of data points in training data assigned to each cluster, and within-cluster distance metrics.
#' 
#' @param X: data.frame, data which was clustered with KMeans::fit
#' @param centroids : list of vectors, containing centroid coordinates
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
#' cluster_summary(X, kmeans_results[1], kmeans_results[2])
clustersummary <- function(X, centroids, cluster_assignments) {
  
  if (max(cluster_assignments) > length(centroids)){
    stop("Cannot have a cluster assignment greater than the total number of clusters")
  }
  
  for (i in seq(1:length(centroids))) {
    if(length(centroids[[i]]) != ncol(X) || (nrow(X) != length(cluster_assignments))) {
      stop("Centroids, data and cluster assignments must have dimensions (k,m), (n, m), (n, )")
    }
  }
  
  centroid_df <- as.data.frame(Reduce(rbind, centroids))
  n_centroids <- nrow(centroid_df)
  n_assigned <- seq(1:n_centroids)
  inertia_list <- seq(1:n_centroids)
  
  for (i in seq(1:n_centroids)) {
    n_assigned[[i]] <- nrow(filter(X, cluster_assignments == i))
    inertia_list[[i]] <- sum((t(filter(X, cluster_assignments == i)) - t(centroid_df)[, i])^2)
  }
  summary_df <- mutate(centroid_df, "Num assigned training points" = n_assigned,
                                    "Within cluster inertia" = inertia_list)
  summary_df
}

