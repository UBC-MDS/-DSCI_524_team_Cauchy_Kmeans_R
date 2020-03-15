library(testthat)
library(tidyverse)

# Helper data
X <- data.frame(x1 = c(1, 2, 3, 10, 11, 12), x2 = c(1, 2, 3, 10, 11, 12))
X2 <- data.frame(x1 = c(1, 2, 3, 10, 11, 12), x2 = c(1, 2, 3, "sdafda", 11, 12))
labels1 <- c(1,1,1,1,1,2)
labels2 <- c(1,1,1,2,2,2)
k_vector <- c(2,3,4,5)
k_vector2 <- c("!23213", "sad")

#tests
test_that("sil_score should return the correct number", {
  expect_equal(sil_score(X, labels1), -0.002023809523809539)
})

test_that("sil_score should return the correct number again", {
  expect_equal(sil_score(X, labels2), 0.850462962962963)
})

test_that("Silhouette should return list type", {
  expect_equal(typeof(silhouette(X, k_vector)), "list")
})

test_that("Length of scores vector from silhouette should match the k vector length", {
  expect_equal(length(silhouette(X, k_vector)$scores), length(k_vector))
})

test_that("k_vector must be numeric", {
  expect_error(silhouette(X, k_vector2))
})

test_that("X must be numeric", {
  expect_error(silhouette(X2, k_vector1))
})
