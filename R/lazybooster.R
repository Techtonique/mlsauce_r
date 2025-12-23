
#' @title LazyBoostingClassifier
#' 
#' @description
#' Lazy Generic Boosting Classifier (AutoML Hold-out set validation)
#' 
#' @param verbose: int, progress bar (yes = 1) or not (no = 0) (currently).
#' @param ignore_warnings: bool, ignore warnings.
#' @param custom_metric: function, custom metric.
#' @param predictions: bool, return predictions.
#' @param sort_by: str, sort by metric.
#' @param random_state: int, random state.
#' @param estimators: str, estimators to use. List of names for custom, or just 'all'.
#' @param preprocess: bool, preprocess data or not.
#' @param n_jobs: int, number of jobs.
#' 
#' @return
#' LazyBoostingClassifier object
#' 
#' @examples
#' 
#' # See https://thierrymoudiki.github.io/blog/2024/10/14/r/genericboosting-r for advanced examples
#' 
#' library(mlsauce)
#' library(datasets)
#' 
#' data(iris)
#' 
#' X <- as.matrix(iris[, 1:4])
#' y <- as.integer(iris[, 5]) - 1L
#' 
#' n <- dim(X)[1]
#' p <- dim(X)[2]
#' 
#' set.seed(21341)
#' train_index <- sample(x = 1:n, size = floor(0.8*n), replace = TRUE)
#' test_index <- -train_index
#' 
#' X_train <- as.matrix(X[train_index, ])
#' y_train <- as.integer(y[train_index])
#' X_test <- as.matrix(X[test_index, ])
#' y_test <- as.integer(y[test_index])
#' 
#' obj <- LazyBoostingClassifier(verbose=0, ignore_warnings=TRUE,
#'                               custom_metric=NULL, preprocess=FALSE)
#' 
#' obj$fit(X_train, X_test, y_train, y_test)
#' 
#' @export
LazyBoostingClassifier <- function(verbose=0,
        ignore_warnings=TRUE,
        custom_metric=NULL,
        predictions=FALSE,
        sort_by="Accuracy",
        random_state=42L,
        estimators="all",
        preprocess=FALSE,
        n_jobs=NULL,
        venv_path = "./venv",
        ...) {
  
  # Lazy load sklearn only when needed
  ms <- get_mlsauce(venv_path)
  
    ms$LazyBoostingClassifier(verbose=verbose,
        ignore_warnings=ignore_warnings,
        custom_metric=custom_metric,
        predictions=predictions,
        sort_by=sort_by,
        random_state=random_state,
        estimators=estimators,
        preprocess=preprocess,
        n_jobs=n_jobs)
}


#' @title LazyBoostingRegressor
#' 
#' @description
#' Lazy Generic Boosting Regressor (AutoML Hold-out set validation)
#' 
#' @param verbose: int, progress bar (yes = 1) or not (no = 0) (currently).
#' @param ignore_warnings: bool, ignore warnings.
#' @param custom_metric: function, custom metric.
#' @param predictions: bool, return predictions.
#' @param sort_by: str, sort by metric.
#' @param random_state: int, random state.
#' @param estimators: str, estimators to use. List of names for custom, or just 'all'.
#' @param preprocess: bool, preprocess data or not.
#' @param n_jobs: int, number of jobs.
#' 
#' @return
#' LazyBoostingRegressor object
#' 
#' @examples
#' 
#' # See https://thierrymoudiki.github.io/blog/2024/10/14/r/genericboosting-r for advanced examples
#' 
#' library(mlsauce)
#' library(datasets)
#' 
#' data(mtcars)
#'
#' X <- as.matrix(mtcars[, -1])
#' y <- as.integer(mtcars[, 1]) 
#' 
#' n <- dim(X)[1]
#' p <- dim(X)[2]
#' 
#' set.seed(21341)
#' train_index <- sample(x = 1:n, size = floor(0.8*n), replace = TRUE)
#' test_index <- -train_index
#' 
#' X_train <- as.matrix(X[train_index, ])
#' y_train <- as.integer(y[train_index])
#' X_test <- as.matrix(X[test_index, ])
#' y_test <- as.integer(y[test_index])
#' 
#' obj <- LazyBoostingRegressor(verbose=0, ignore_warnings=TRUE,
#'                               custom_metric=NULL, preprocess=FALSE)
#' 
#' obj$fit(X_train, X_test, y_train, y_test)
#' 
#' @export 
LazyBoostingRegressor <- function(verbose=0,
        ignore_warnings=TRUE,
        custom_metric=NULL,
        predictions=FALSE,
        sort_by="RMSE",
        random_state=42L,
        estimators="all",
        preprocess=FALSE,
        n_jobs=NULL,
        venv_path = "./venv",
...) {
  
  # Lazy load sklearn only when needed
  ms <- get_mlsauce(venv_path)
  
    ms$LazyBoostingRegressor(verbose=verbose,
        ignore_warnings=ignore_warnings,
        custom_metric=custom_metric,
        predictions=predictions,
        sort_by=sort_by,
        random_state=random_state,
        estimators=estimators,
        preprocess=preprocess,
        n_jobs=n_jobs)
}