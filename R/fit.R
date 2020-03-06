library(tidyverse)

compute_distance <- function(x, center){
  dist <- sum((x - center)^2)
  dist
}



argmin <- function(x){
  ind <- which.min(x)
  ind
}




fit <- function(x, k, n_init=10, max_iter=100){

  # initialize inertia to infinity
  inertia <- 1/0
  count <- 0

  while (count <= n_init){
    # initialize k centers
    centers <- sample_n(x, k)

    # Get distance from samples to all centers
    n_rows <- dim(x)[1]
    n_cols <- k
    distances <- data.frame(matrix(nrow=n_rows, ncol=n_cols))

    # Iterate over max_iter
    for (i in seq(max_iter)){
      # Compute distance matrix with current centers
      for (c in seq(k)){
        col <- names(distances)[c]
        center <- centers[c, ]
        distances[col] <- apply(x, 1, FUN = compute_distance, center = center)

      }

      labels <- apply(distances, 1, argmin)

      # Move the centers to mean of the clusters
      prev_centers <- centers
      for (c in seq(k)){
        centers[c, ] <- apply(x[labels==c,], 2, mean)

      }
      # Update the inertia
      updated_inertia <- sum(apply(distances, 1, min))

      # Check if the centers are moving
      diff_centers <- abs(sum(prev_centers - centers))

      if (diff_centers < 1e-6){
        #                 print(paste("Converged in", i, "iterations"))
        break
      }

    }
    count <- count + 1

  }

  # Check if current initialization is better
  if (updated_inertia < inertia){
    inertia = updated_inertia
    centers_final = centers
    labels_final = labels
  }

  # Return labels and centers
  list("labels" = labels_final, "centers" = centers_final)
}

