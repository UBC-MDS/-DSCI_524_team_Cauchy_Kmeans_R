library(testthat)
#helper data
data <- data.frame("x1" = c(1, 4, 3, 5, 1, 6, 1, 4, 15, 14, 6, 3),
                   "x2" = c(1, 2, 3, 5, 1, 6, 8, 4, 15, 2,  6, 3),
                   "x3" = c(1, 2, 3, 5, 7, 6, 3, 4, 15, 2,  6, 3))
data_new <- data.frame("x1" = c(1, 1,  15, 1,  3),
                       "x2" = c(2, 6,  2,  10, 10),
                       "x3" = c(3, 10, 6,  11, 11))
data_new2 <- data.frame("x1" = c(1, 1,  15, 1,  3, 10, 11, 4, 2),
                        "x2" = c(2, 6,  2,  10, 10, 1, 43, 4, 1),
                        "x3" = c(3, 10, 6,  11, 11, 3, 10, 3, 20))
centroids <- list(c(1,2,3), c(1,6,10), c(15,2,6), c(1,10,11), c(3,10,11))

#tests
test_that("Each points in new data needs to be assigned a centroid", {
  expect_equal(length(predict(data_new2, centroids)), nrow(data_new2))
})

test_that("Points with same coordinates as centroids should be assigned to that centroid", {
  expect_equal(predict(data_new, centroids), c(1, 2, 3, 4, 5))
})

