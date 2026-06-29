#' RVFL Jackknife+ Regressor
#'
#' Random Vector Functional Link (RVFL) regressor with closed-form
#' Jackknife+ prediction intervals.
#'
#' @param n_hidden int. Number of random hidden features.
#'   Set to 0 for ridge regression.
#' @param lambda numeric. Ridge regularization parameter.
#' @param activation character. Activation function for the random hidden
#'   layer. One of `"tanh"`, `"relu"`, or `"sigmoid"`.
#' @param random_state integer. Random seed used to generate the hidden layer.
#' @param symmetric logical. If `TRUE`, symmetric Jackknife+ intervals are
#'   returned. Otherwise, asymmetric Jackknife+ intervals are used.
#' @param venv_path character. Path to the Python virtual environment.
#'
#' @return An object of class RVFLJackknifePlus.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(datasets)
#'
#' X <- as.matrix(mtcars[, -1])
#' y <- mtcars[, 1]
#'
#' n <- nrow(X)
#' set.seed(123)
#' train_index <- sample(seq_len(n), floor(0.8 * n))
#'
#' X_train <- X[train_index, ]
#' y_train <- y[train_index]
#'
#' X_test <- X[-train_index, ]
#'
#' obj <- mlsauce::RVFLJackknifePlus()
#'
#' obj$fit(as.matrix(X_train), as.double(y_train))
#'
#' pred <- obj$predict(as.matrix(X_test))
#'
#' pred_pi <- obj$predict(
#'   X_test,
#'   alpha = 0.05,
#'   return_pi = TRUE
#' )
#'
#' print(pred)
#' print(pred_pi$lower)
#' print(pred_pi$upper)
#' }
#'
RVFLJackknifePlus <- function(
    n_hidden = 200L,
    lambda = 1,
    activation = c("tanh", "relu", "sigmoid"),
    random_state = 0L,
    symmetric = FALSE,
    venv_path = "./venv",
    ...
) {
  
  ms <- get_mlsauce(venv_path)
  
  ms$RVFLJackknifePlus(
    n_hidden = as.integer(n_hidden),
    lambda_ = lambda,
    activation = match.arg(activation),
    random_state = as.integer(random_state),
    symmetric = symmetric
  )
}