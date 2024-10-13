# global reference to scipy (will be initialized in .onLoad)
ms <- NULL
sklearn <- NULL

ensure_python_dependencies <- function() {
  py <- reticulate::py_available()
  if (py) {
    reticulate::py_install(c("scikit-learn", "numpy", "scipy", "pandas"))
  }
}

.onLoad <- function(libname, pkgname) {
  utils::install.packages("reticulate",
                          repos = list(CRAN = "https://cloud.r-project.org"))
  py <- reticulate::py_available()
  if (py) {
    try(reticulate::py_install(
    "setuptools",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE), silent = TRUE)
    try(reticulate::py_install(
    "wheel",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE), silent = TRUE)
    try(reticulate::py_install(
      "Cython",
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE), silent = TRUE)
    try(reticulate::py_install(
      "scikit-learn",
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE
    ), silent = TRUE)
    try(reticulate::py_install(
      "git+https://github.com/Techtonique/mlsauce.git",
      pip = TRUE,
      pip_options = c("--upgrade", "--verbose"),
      pip_ignore_installed = TRUE
    ), silent = TRUE)
  }

  # use superassignment to update global reference to package
  #' @export
  sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
  assign("sklearn", sklearn, envir = globalenv())
  #' @export
  ms <<- reticulate::import("mlsauce", delay_load = TRUE)
  assign("ms", ms, envir = globalenv())
}
