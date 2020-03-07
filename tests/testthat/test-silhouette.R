library(testthat)

X <- data.frame(x1 = c(1, 2, 3, 10, 11, 12), x2 = c(1, 2, 3, 10, 11, 12))
labels1 <- c(1,1,1,1,1,2)
labels2 <- c(1,1,1,2,2,2)
k_vector <- c(2,3,4,5)

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

test_that("Silhouette list plot object should a ggplot", {
  expect_equal(length(silhouette(X, k_vector)$scores), length(k_vector))
})
