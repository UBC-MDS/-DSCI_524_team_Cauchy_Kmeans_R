compute_distance <- function(samples, centers){
  
#  samples_trans <- as.data.frame(t(samples))
  
  k <- dim(centers)[1]
  num_features <- dim(centers)[2]
  n_samples <- dim(samples)[1]
  
  distance <- data.frame(matrix(0, nrow = n_samples, ncol = k))
  center_diff <- data.frame(matrix(0, nrow = n_samples, ncol = num_features))
  
  for (i in (1:k)){
    
    for (j in (1:n_samples)){
      
      center_diff[j,] <- samples[j,] - centers[i,]
    }
    
    center_diff <- data.frame(center_diff^2)
    
    sum_center_diff_sq <- apply(center_diff, 2, FUN=sum)
    
    sum_center_diff_sq <- data.frame(sum_center_diff_sq^0.5)
    
    distance[, i] = sum_center_diff_sq
    
  }
  
  return(distance)
  
}

random_init <- function(samples, k, n_features){
  
  centers = data.frame(matrix(0, nrow = k, ncol = n_features))
  
  min_feature <- apply(samples, 2, FUN=min)
  
  max_feature <- apply(samples, 2, FUN=max)
  
  for (i in (1:k))
  
    for (j in (1:dim(samples)[1])){
     
      centers[i,j] <- sample(samples[,j], 1) 
    }
    
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

fit <- function(X_train, k) {
  
  

}