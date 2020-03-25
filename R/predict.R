library(tidyverse)

#' Assigns new data points to clusters based on closest centroid. 
#' 
#' @param X_new data.frame, new data to assign to clusters
#' @param centroids : data.frame, containing centroid coordinates
#'
#' @return vector, assigned clusters for each point in X_new
#'
#' @examples
#' library(KMeans)
#' library(tidyverse)
#' X = data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' kmeans_results = fit(X, 2)
#' X_new = data.frame(x1 = c(1, 4),
#'                    x2 = c(3, 2))
#' predict(X_new, kmeans_results$centers)
predict <- function(X_new, centroids) {
  
  if (class(centroids) == "data.frame") {
    centroids2 <- list()
    for (i in seq(1:nrow(centroids))) {
      centroids2[[i]] <- c(t(centroids[i, ]))
    }
    centroids <- centroids2
  }
  
  for (i in seq(1:length(centroids))) {
    if(length(centroids[[i]]) != ncol(X_new)) {
      stop("Centroids and data must have dimensions (k,m), (n, m)")
    }
  }
  for (i in seq(1:length(centroids))) {
    if(!is.numeric(centroids[[i]])) {
      stop("Centroid coordinates must be numeric")
    }
  }
  
  for (i in seq(1:ncol(X_new))) {
    if(!is.numeric(X_new[[i]])) {
      stop("Data must be numeric")
    }
  }
  centroid_df <- as.data.frame(Reduce(rbind, centroids))
  n_examples <- nrow(X_new)
  assignments <- seq(1:n_examples)
  for (i in seq(1:n_examples)) {
    assignments[[i]] <- which.min(as.vector(colSums((t(centroid_df) - t(X_new)[, i])^2)))
  }
  assignments
}


