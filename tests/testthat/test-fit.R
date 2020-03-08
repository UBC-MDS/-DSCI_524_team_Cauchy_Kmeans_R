library(testthat)

tests <- function() {
  
  #helper data
  
  test_df1 <- data.frame("x1" = c(1, 4, 3, 5, 1, 6, 1, 4, 15, 14, 6, 3),
                     "x2" = c(1, 2, 3, 5, 1, 6, 8, 4, 15, 2,  6, 3))
  test_df2 <- "This a R package"
  K <- -3
  n <- 0.5
  iter <- 6.3
  
  #tests for exception handling

  test_that("The input of samples must be in a list", {
    expect_error(fit(test_df2, 2))
  })
  
  test_that("The given number of clusters must be a positive integer >= 1", {
    expect_error(fit(test_df1, K))
  })
  
  test_that("The number of initialization of the centroids must be an integer >=1", {
    expect_error(fit(test_df1, 2, n_iter = n))
  })
  
  test_that("The number of iterations must be an integer >=1", {
    expect_error(fit(test_df1, 2, max_iter = iter))
  })
  
  #tests for output evaluations
  #... to do
  
}
  