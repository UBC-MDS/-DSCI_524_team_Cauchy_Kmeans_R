library(testthat)
library(tidyverse)

context("elbow")

tests <- function() {
  x1 <- rnorm(5, 1, 0.2)
  x2 <- rnorm(5, 2, 0.2)
  x3 <- rnorm(5, 3, 0.2)
  x <- c(x1, x2, x3)
  y <- c(x2, x1, x1)

  df <- data.frame(x, y)
  df2 <- c("Aaaa")

  centers <- c( 2, 3, 4, 5)
  centers2 <- c(0, 100000, 2, 2)
  centers3 <- c(2.1, 3, 4, 5)

  #tests
  test_that("Function should return a list with 2 objects", {
    expect_equal(length(elbow(df, centers)), 2)
  })

  test_that("Length of inertia and number of centers should match", {
    expect_equal(length(elbow(df, centers)$inertia), length(centers))
  })

  test_that("Plot object returned should be of type list", {
    expect_equal(typeof(elbow(df, centers)$plot), "list")
  })

  test_that("Second object in the list should be a ggplot object", {
    expect_equal(class(elbow(df, centers)$plot)[2], "ggplot")
  })
  
  test_that("X must be a tibble or a dataframe", {
    expect_error(elbow(df2, centers))
  })
  
  test_that("Centers must be a vector", {
    expect_error(elbow(df, data.frame(centers)))
  })
  
  test_that("Center labels must be valid", {
    expect_error(elbow(df, centers2))
  })
  
  test_that("Center labels must be numeric", {
    expect_error(elbow(df, centers3))
  })
  
}
tests()
