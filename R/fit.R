library(tidyverse)

#' This takes all the samples points and the center coordinates to compute the distance of all the samples from the center.
#'
#' @param X : dataframe, all the samples points for which distance needs to be computed
#' @param center : integer vector, coordinates of the center from which the distnace of each point needs to be computed
#'
#' @return a list of distances of each for each sample point fomr the center.
#'
compute_distance <- function(x, center){
  dist <- sum((x - center)^2)
  dist
}



#' This takes a list of distances of each samples from each center and returns the index of the center which is at closest distance.
#'
#' @param x : dataframe, distance of each point from all the cluster centers
#'
#' @return a list of column index of the center which is closest for each sample point.
#'
argmin <- function(x){
  ind <- which.min(x)
  ind
}

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

fit <- function(x, k, n_init=10, max_iter=100){

  # initialize inertia to infinity
  inertia <- 1/0
  count <- 0
  
  if (k <= 0 || k%%1!=0 )
    stop("The number of clusters has to be a positive integer >= 1: ", k)
  
  if (n_init <= 0 ||  n_init%%1!=0 )
    stop("The n_init is out of range. Should be an integer >=1 : ", n_init)
  
  if (max_iter <= 0 ||  max_iter%%1!=0 )
    stop("The max_iter is out of range. Should be an integer >=1 : ", max_iter)
  
  if (typeof(x) != "list")
    stop("The input samples should be in a list with each feature in a column")

 
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
    
    if (inertia == 0){
      break
    }
  }

  # Return labels and centers
  list("labels" = labels_final, "centers" = centers_final)
}

