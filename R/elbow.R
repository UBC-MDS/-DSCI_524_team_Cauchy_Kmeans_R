#' Creates a plot of inertia vs number of cluster centers
#' as per the elbow method. Calculates and returns the inertia
#' values for all cluster centers. Useful for identifying the optimal
#' number of clusters while using the k-means clustering algorithm.
#'
#' @param x data.frame, Input data that is to be clustered
#' @param centers : vector, containing all the first `n` numbers of
#' cluster centers #' that are to be tried.
#'
#' @return list, containing inertia values for all numbers of cluster centers
#' and a ggplot object of number of clusters vs inertia.
#'
#' @examples
#' library(KMeans)
#' X <- data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' centers <- c(2, 3, 4, 5)
#' elbow(X, centers)
library(tidyverse)
elbow <- function(x, centers){

  # Check if type of data is valid
  if ((!is_tibble(x)) & (!is.data.frame(x))) {
    stop("'Data shoud be a tibble or data.frame")
  }

  # Check if type of centers is valid
  if (!is.vector(centers)) {
    stop("'Centers shoud be a vector")
  }

  # Check if the values in the number of centers are valid
  if ((min(centers) < 1) | (max(centers) > dim(x)[1])) {
    stop("Invalid values in list of numbers of clusters,
                        Number of clusters should be between 1 and number of samples")
  }

  if (!all(centers == floor(centers))){
    stop("Number of centers should be integer")

  }

  j <- 1
  inertia <- c()
  for (k in centers){
    # Fit kmeans for nuber of centers k
    km <- fit(x, k, n_init = 1, max_iter = 10)
    labels <- km$labels
    centroids <- km$centers

    # Calucate the inertia
    inertia_m <- 0
    for (m in seq(k)){
      cluster_m <- x[labels==m, ]
      center <- centroids[m, ]
      inertia_m <- inertia_m + sum(apply(cluster_m, 1,
                                         FUN = compute_distance,
                                         center = center))



    }
    inertia[j] <- inertia_m
    j <- j + 1

  }

  # Plot the results
  results <- data.frame("k" = centers, "inertia" = inertia)

  p <- ggplot(results, aes(x = k, y = inertia)) +
    geom_line() +
    scale_x_continuous(breaks = seq(length(centers))) +
    xlab("k") +
    ylab("Inertia") +
    ggtitle("k vs Inertia Using Elbow Method")

  list("inertia" = inertia, "plot" = p)

}

