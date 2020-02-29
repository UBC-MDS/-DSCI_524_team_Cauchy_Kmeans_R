
<!-- README.md is generated from README.Rmd. Please edit that file -->

# KmeansR

<!-- badges: start -->

<!-- badges: end -->

## Mileston 1 README

For this project, we will be creating R packages that implement k-means
clustering from scratch. This will work on any dataset with valid
numerical features and includes fit, predict, and summarize functions,
as well as elbow and silhouette methods for hyperparameter “k”
optimization.

  - fit: Outputs a list of cluster centers based on the inputted dataset
    and number of clusters. Only clustered based on valid numerical
    features.

  - predict: Assigns each point in a dataset to a cluster. Dataset has
    to be in the same format as the original dataset the model was fit
    on.

  - cluster\_summary: Outputs a summary of clusters created including
    centroid coordinates, number of data points in training data
    assigned to each cluster, and within-cluster distance metrics.

  - elbow: Plots the number of clusters vs inertia. It helps to choose
    the optimal number of clusters.

  - silhouette: Plots the number of clusters vs Silhouette score. It
    helps to choose the optimal number of clusters.

There is a built-in k-means function in R. This package is not meant to
add to the existing ecosystem; it is rather intended to deepen our
fundamental understanding of these algorithms.

## Installation

You can install the released version of Kmeans from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Kmeans")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Kmeans")
```

## Example

Fitting and predicting:

``` r
library(KMeans)
X = data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
               x2 = c(1, 2, 3, 5, 53, 21, 43))
kmeans_results = fit(X, 2)
X_new = data.frame(x1 = c(1, 4),
                   x2 = c(3, 2))
predict(X_new, kmeans_results[1])
```
