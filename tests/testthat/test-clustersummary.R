library(testthat)
tests <- function() {
  #helper data
  data <- data.frame("x1" = c(1, 4, 3, 5, 1, 6, 1, 4, 15, 14, 6, 3),
                     "x2" = c(1, 2, 3, 5, 1, 6, 8, 4, 15, 2,  6, 3),
                     "x3" = c(1, 2, 3, 5, 7, 6, 3, 4, 15, 2,  6, 3))
  centroids <- list(c(1,2,3), c(1,6,10), c(15,2,6), c(1,10,11), c(3,10,11))
  centroids2 <- list(c(1,2,3), c(1,6,10), c(15,2,6), c(1,10,11), c(3,10,11, 12))
  cluster_assignments <- c(1, 2, 3, 2, 2, 3, 1, 1, 1, 1, 2, 5)
  cluster_assignments2 <- c(1, 2, 3, 2, 2, 3, 1, 1, 1, 1, 2, 15)
  cluster_assignments3 <- c(1)
  
  #tests
  test_that("Total of 'Num assigned training points' should be equal to number of examples in data", {
    expect_equal(sum(clustersummary(data, centroids, cluster_assignments)[4]), nrow(data))
  })
  
  test_that("Number of rows in data frame returned by clustersummary should be equal to number of centroids", {
    expect_equal(nrow(clustersummary(data, centroids, cluster_assignments)), length(centroids))
  })
  
  test_that("First three columns in data frame returned by clustersummary should be the centroid coordinates", {
    expect_true(all(clustersummary(data, centroids, cluster_assignments)[1:3] == as.data.frame(Reduce(rbind, centroids))))
  })
  
  test_that("clustersummary should throw error for invalid centroid input", {
    expect_error(clustersummary(data, centroids2, cluster_assignments))
  })
  
  test_that("clustersummary should throw error for invalid centroid input", {
    expect_error(clustersummary(data, centroids2, cluster_assignments))
  })
  
  test_that("clustersummary should throw error if a cluster assignment is greater than number of clusters", {
    expect_error(clustersummary(data, centroids, cluster_assignments2))
  })
    
  test_that("Length of cluster assignments must be the same as the number of examples in the data", {
    expect_error(clustersummary(data, centroids, cluster_assignments3))
  })
  
}

tests()
