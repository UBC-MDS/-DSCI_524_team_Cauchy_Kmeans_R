#' Plots a graph of silhouette scores for each k value
#' in the given array using fit. Returns a list of each k value
#' in k_array paired with its corresponding silhouette score.
#'
#' @param X : dataframe, the data to be clustered.
#' @param k_vector : vector, An array of all contending k values.
#'
#' @return vector, containing silhouette scores in the same order as k_vector.
#' @return ggplot chart object, the graph of the silhouette scores
#'
#' @examples
#' 
#' X <- data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
#'                x2 = c(1, 2, 3, 5, 53, 21, 43))
#' k_vector <- c(2, 3, 4, 5)
#' silhouette(X, k_vector)
silhouette <- function(X, k_vector) {
  scores = rep(0, length(k_vector))
  for (i in 1:length(k_vector)){
    score = sil_score(X, fit(X, k_vector[i])$labels)
    scores[i] = score
  }
  plot <- ggplot(data.frame(scores, k_vector)) +
    geom_line(aes(x = k_vector, y = scores)) + 
    ggtitle("Silhouette score vs k")
  
  list("scores" = scores, "plot" = plot)
}

#' Returns the average silhouette score of each sample
#' in a given 2-d array and clustering labels.
#'
#' @param X : dataframe, the data to be clustered.
#' @param labels : vector, An array of all the labels
#'
#' @return float, The average silhouette score of all points
#'
#' @examples
#' 
#' X <- data.frame(x1 = c(1, 2, 3, 10, 11, 12),
#'                x2 = c(1, 2, 3, 10, 11, 12))
#' labels <- c(1,1,1,1,1,2)
#' sil_score(X, labels)
sil_score <- function(X, labels) {
  score <- rep(0, length(labels))
  for (i in 1:length(labels)) {
    clusterdist <- rep(0, length(unique(labels)))
    for (j in 1:length(labels)) {
      distance <- sqrt(sum((X[i,] - X[j,])^2))
      clusterdist[labels[j]] <- clusterdist[labels[j]] + distance
    }
    for (j in 1:length(clusterdist)) {
      if (j == labels[i]) {
        clusterdist[j] = clusterdist[j] / max(sum(labels == j)-1, 1)
      } else {
        clusterdist[j] = clusterdist[j] / sum(labels == j)
      }
    }
    incluster <- clusterdist[labels[i]]
    clusterdist[labels[i]] <- Inf
    closest <- min(clusterdist)
    temp_score <- (closest - incluster) / max(incluster, closest)
    if (sum(labels == labels[i]) == 1) {
      temp_score <- 0
    }
    score[i] <- temp_score
  }
  mean(score)
}

