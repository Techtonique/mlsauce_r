

# 1 - Classifier ----------------------------------------------------------

#' GenericBoosting classifier
#'
#' @param base_model: object, base model to be boosted.
#' @param n_estimators: int, number of boosting iterations.
#' @param learning_rate: float, controls the learning speed at training time.
#' @param n_hidden_features: int
#' @param number of nodes in successive hidden layers.
#' @param reg_lambda: float, L2 regularization parameter for successive errors in the optimizer (at training time).
#' @param row_sample: float, percentage of rows chosen from the training set.
#' @param col_sample: float, percentage of columns chosen from the training set.
#' @param dropout: float, percentage of nodes dropped from the training set.
#' @param tolerance: float, controls early stopping in gradient descent (at training time).
#' @param direct_link: bool, indicates whether the original features are included (True) in model's fitting or not (False).
#' @param verbose: int, progress bar (yes = 1) or not (no = 0) (currently).
#' @param seed: int, reproducibility seed for nodes_sim=='uniform', clustering and dropout.
#' @param activation: str, activation function: currently 'relu', 'relu6', 'sigmoid', 'tanh'
#' @param n_clusters: int, number of clusters for clustering.
#' @param clustering_method: str, clustering method: currently 'kmeans', 'gmm' (Gaussian Mixture Model)
#' @param cluster_scaling: str, scaling method for clustering: currently 'standard', 'minmax', 'robust'
#' @param degree: int, degree of polynomial interactions features.
#' @param weights_distr: str, distribution of weights for the hidden layer currently 'uniform', 'gaussian'
#'
#' @return An object of class GenericBoostingClassifier
#' @export
#'
#' @examples
#'
#' library(datasets)
#'
#' X <- as.matrix(iris[, 1:4])
#' y <- as.integer(iris[, 5]) - 1L
#'
#' n <- dim(X)[1]
#' p <- dim(X)[2]
#' set.seed(21341)
#' train_index <- sample(x = 1:n, size = floor(0.8*n), replace = TRUE)
#' test_index <- -train_index
#' X_train <- as.matrix(X[train_index, ])
#' y_train <- as.integer(y[train_index])
#' X_test <- as.matrix(X[test_index, ])
#' y_test <- as.integer(y[test_index])
#'
#' obj <- mlsauce::GenericBoostingClassifier()
#'
#' print(obj$get_params())
#'
#' obj$fit(X_train, y_train)
#'
#' print(obj$score(X_test, y_test))
#'
GenericBoostingClassifier <- function(base_model=NULL, n_estimators=100L,
                              learning_rate=0.1,
                              n_hidden_features=5L,
                              reg_lambda=0.1,
                              row_sample=1,
                              col_sample=1,
                              dropout=0,
                              tolerance=1e-4,
                              direct_link=1L,
                              verbose=1L,
                              seed=123L,
                              activation="relu",
                              n_clusters=0,
                              clustering_method="kmeans",
                              cluster_scaling="standard",
                              degree=0,
                              weights_distr="uniform")
{

  ms$GenericBoostingClassifier(base_model, n_estimators=n_estimators,
                       learning_rate=learning_rate,
                       n_hidden_features=n_hidden_features,
                       reg_lambda=reg_lambda,
                       row_sample=row_sample,
                       col_sample=col_sample,
                       dropout=dropout,
                       tolerance=tolerance,
                       direct_link=direct_link,
                       verbose=verbose,
                       seed=seed,
                       activation=activation,
                       n_clusters=n_clusters,
                       clustering_method=clustering_method,
                       cluster_scaling=cluster_scaling,
                       degree=degree,
                       weights_distr=weights_distr)
}


# 2 - Regressor ----------------------------------------------------------


#' GenericBoosting Regressor
#'
#' @param base_model: object, base model to be boosted.
#' @param n_estimators: int, number of boosting iterations.
#' @param learning_rate: float, controls the learning speed at training time.
#' @param n_hidden_features: int
#' @param number of nodes in successive hidden layers.
#' @param reg_lambda: float, L2 regularization parameter for successive errors in the optimizer (at training time).
#' @param row_sample: float, percentage of rows chosen from the training set.
#' @param col_sample: float, percentage of columns chosen from the training set.
#' @param dropout: float, percentage of nodes dropped from the training set.
#' @param tolerance: float, controls early stopping in gradient descent (at training time).
#' @param direct_link: bool, indicates whether the original features are included (True) in model's fitting or not (False).
#' @param verbose: int, progress bar (yes = 1) or not (no = 0) (currently).
#' @param seed: int, reproducibility seed for nodes_sim=='uniform', clustering and dropout.
#' @param activation: str, activation function: currently 'relu', 'relu6', 'sigmoid', 'tanh'
#' @param n_clusters: int, number of clusters for clustering.
#' @param clustering_method: str, clustering method: currently 'kmeans', 'gmm' (Gaussian Mixture Model)
#' @param cluster_scaling: str, scaling method for clustering: currently 'standard', 'minmax', 'robust'
#' @param degree: int, degree of polynomial interactions features.
#' @param weights_distr: str, distribution of weights for the hidden layer currently 'uniform', 'gaussian'

#'
#' @return An object of class GenericBoostingRegressor
#' @export
#'
#' @examples
#'
#' library(datasets)
#'
#' X <- as.matrix(datasets::mtcars[, -1])
#' y <- as.integer(datasets::mtcars[, 1])
#'
#' n <- dim(X)[1]
#' p <- dim(X)[2]
#' set.seed(21341)
#' train_index <- sample(x = 1:n, size = floor(0.8*n), replace = TRUE)
#' test_index <- -train_index
#' X_train <- as.matrix(X[train_index, ])
#' y_train <- as.double(y[train_index])
#' X_test <- as.matrix(X[test_index, ])
#' y_test <- as.double(y[test_index])
#'
#' obj <- mlsauce::GenericBoostingRegressor()
#'
#' print(obj$get_params())
#'
#' obj$fit(X_train, y_train)
#'
#' print(obj$score(X_test, y_test))
#'
GenericBoostingRegressor <- function(base_model, n_estimators=100L,
                              learning_rate=0.1,
                              n_hidden_features=5L,
                              reg_lambda=0.1,
                              row_sample=1,
                              col_sample=1,
                              dropout=0,
                              tolerance=1e-4,
                              direct_link=1L,
                              verbose=1L,
                              seed=123L,
                              activation="relu",
                             n_clusters=0,
                             clustering_method="kmeans",
                             cluster_scaling="standard",
                             degree=0,
                             weights_distr="uniform")
{

if (is.null(base_model)) {
  ms$GenericBoostingRegressor(n_estimators=n_estimators,
                       learning_rate=learning_rate,
                       n_hidden_features=n_hidden_features,
                       reg_lambda=reg_lambda,
                       row_sample=row_sample,
                       col_sample=col_sample,
                       dropout=dropout,
                       tolerance=tolerance,
                       direct_link=direct_link,
                       verbose=verbose,
                       seed=seed,
                       activation=activation,
                       n_clusters=n_clusters,
                       clustering_method=clustering_method,
                       cluster_scaling=cluster_scaling,
                       degree=degree,
                       weights_distr=weights_distr)
} else {
    ms$GenericBoostingRegressor(base_model=base_model, 
    n_estimators=n_estimators,
                         learning_rate=learning_rate,
                         n_hidden_features=n_hidden_features,
                         reg_lambda=reg_lambda,
                         row_sample=row_sample,
                         col_sample=col_sample,
                         dropout=dropout,
                         tolerance=tolerance,
                         direct_link=direct_link,
                         verbose=verbose,
                         seed=seed,
                         activation=activation,
                         n_clusters=n_clusters,
                         clustering_method=clustering_method,
                         cluster_scaling=cluster_scaling,
                         degree=degree,
                         weights_distr=weights_distr)
}

}