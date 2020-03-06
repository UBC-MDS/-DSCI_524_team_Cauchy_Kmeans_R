#' Creates a plot of inertia vs number of cluster centers
#' as per the elbow method. Calculates and returns the inertia
#' values for all cluster centers. Useful for identifying the optimal
#' number of clusters while using the k-means clustering algorithm.
#'
#' @param X data.frame, Input data that is to be clustered
#' @param centers : vector, containing all numbers of cluster centers
#' that are to be tried.
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

elbow <- function(x, centers){

  inertia <- c()
  for (k in centers){
    # Fit kmeans for nuber of centers k
    km <- fit(df, k, n_init = 1, max_iter = 10)
    labels <- km$labels
    centroids <- km$centers

    # Calucate the inertia
    inertia_m <- 0
    for (m in seq(k)){
      cluster_m <- df[labels==m, ]
      center <- centroids[m, ]
      inertia_m <- inertia_m + sum(apply(cluster_m, 1,
                                         FUN = compute_distance,
                                         center = center))

      inertia[k] <- inertia_m

    }

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
