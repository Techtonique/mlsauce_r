
#' @export  
get_sklearn <- function(venv_path = "./venv") {
  # Use the specified virtual environment
  reticulate::use_virtualenv(venv_path, 
                             required = TRUE)
  
  # Lazy load sklearn only when needed
  reticulate::import("sklearn", 
                     delay_load = TRUE)
}
get_sklearn <- memoise::memoize(get_sklearn)

#' @export  
get_sklearn_utils <- function(venv_path = "./venv") {
  # Use the specified virtual environment
  reticulate::use_virtualenv(venv_path, 
                             required = TRUE)
  
  # Lazy load sklearn only when needed
  reticulate::import("sklearn.utils", 
                     delay_load = TRUE)
}
get_sklearn_utils <- memoise::memoize(get_sklearn_utils)

#' @export  
get_sklearn_base <- function(venv_path = "./venv") {
  # Use the specified virtual environment
  reticulate::use_virtualenv(venv_path, 
                             required = TRUE)
  
  # Lazy load sklearn only when needed
  reticulate::import("sklearn.base", 
                     delay_load = TRUE)
}
#get_sklearn_base <- memoise::memoize(get_sklearn_base)

#' @export  
get_mlsauce <- function(venv_path = "./venv") {
  # Use the specified virtual environment
  reticulate::use_virtualenv(venv_path, 
                             required = TRUE)
  
  # Lazy load mlsauce only when needed
  reticulate::import("mlsauce", 
                     delay_load = TRUE)
}
#get_mlsauce <- memoise::memoize(get_mlsauce)
