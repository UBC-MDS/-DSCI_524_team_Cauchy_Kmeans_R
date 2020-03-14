library(testthat)

test_fun <- function(){
#helper data

test_df1 <- data.frame("x1" = seq_along(14),
                   "x2" = seq_along(14))
test_df2 <- "This a R package"

K <- -3
n <- 0.5
iter <- 6.3

test_df3 <- data.frame('X1' = c(0,0,0,0,0,0,0,0,0,0), 'X2' = c(1,1,1,1,1,1,1,1,1,1))

km1 <- fit(test_d3, 1)
km2 <- fit(test_d1, 2)
label2 <- c(0,0,0,0,0,0,0, 1,1,1,1,1,1,1)
center2 <- list(c(4,4), c(11,11))

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

# edge case
test_that("Centers should match", {
  expect_equal(km1$centers, c(0,1))
})

# checking centers
test_that("Centers should match", {
  expect_equal(km2$centers, center2)
})

# checking labels
test_that("Labels should match", {
  expect_equal(km2$labels, label2)
})

}

test_fun()
