# global reference to scipy (will be initialized in .onLoad)
ms <- NULL
sklearn <- NULL

.onLoad <- function(libname, pkgname) {
  utils::install.packages("reticulate",
                          repos = list(CRAN = "https://cloud.r-project.org"))

    try(reticulate::virtualenv_create(env), silent = TRUE)
    try(reticulate::use_virtualenv(env), silent = TRUE)
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

  # use superassignment to update global reference to package
  sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
  ms <<- reticulate::import("mlsauce", delay_load = TRUE)
}
