
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Kmeans

<!-- badges: start -->

<!-- badges: end -->

### Milestone 2 README

This package will include R packages that implement k-means clustering
from scratch. This will work on any dataset with valid numerical
features, and includes fit, predict, and cluster\_summary functions, as
well as as elbow and silhouette methods for hyperparameter “k”
optimization. A high level overview of each function is given below. See
each function’s documentation for more details.

  - fit: This function classifies the non-labeled data into a given
    number of clusters k using simple KMeans algorithm. It returns
    labels for each data point according to the cluster it belongs and
    also cluster centers. This is a type of unsupervised learning method
    to classify data.

  - predict: Assigns each point in a dataset to a cluster. Dataset has
    to be in the same format as the original dataset the model was fit
    on.

  - elbow: Creates a plot of inertia vs number of cluster centers as per
    the elbow method. Calculates and returns the inertia values for all
    cluster centers. Useful for identifying the optimal number of
    clusters while using k-means clustering algorithm.

  - silhouette: Returns the average silhouette score of each sample in a
    given 2-d array and clustering labels.

  - cluster\_summary: Provides summary of groups created from Kmeans
    clustering, including centroid coordinates, number of data points in
    training data assigned to each cluster, and within-cluster distance
    metrics.

There is a python package sklearn.cluster.KMeans that has similar
functions, and a built in k-means function in R. These packages are not
meant to add to the existing ecosystem; they are rather intended to
deepen fundamental understanding of these algorithms.

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

This is a basic example which shows you how to solve a common problem:

``` r
library(Kmeans)
X = data.frame(x1 = c(1, 2, 3, 5, 53, 21, 43),
               x2 = c(1, 2, 3, 5, 53, 21, 43))
kmeans_results = fit(X, 2)
X_new = data.frame(x1 = c(1, 4),
                   x2 = c(3, 2))
predict(X_new, kmeans_results[1])
```

## Tests

To test that the functions work as intended, run `devtools::test()` in
the root of the project repo in an Rconsole.
