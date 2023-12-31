# global reference to scipy (will be initialized in .onLoad)
ms <- NULL
sklearn <- NULL

.onLoad <- function(libname, pkgname) {
  utils::install.packages("reticulate",
                          repos = list(CRAN = "https://cloud.r-project.org"))
  try(reticulate::virtualenv_create('./r-reticulate'),
      silent = TRUE)
  try(reticulate::use_virtualenv('./r-reticulate'),
      silent = TRUE)
  try(reticulate::py_install(
    "Cython",
    envname = "./r-reticulate",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE
  ),
  silent = TRUE)
  try(reticulate::py_install("numpy",
                             envname = "./r-reticulate",
                             pip = TRUE),
      silent = TRUE)
  try(reticulate::py_install("pandas",
                             envname = "./r-reticulate",
                             pip = TRUE),
      silent = TRUE)
  try(reticulate::py_install("scipy",
                             envname = "./r-reticulate",
                             pip = TRUE, ),
      silent = TRUE)
  try(reticulate::py_install("scikit-learn",
                             envname = "./r-reticulate",
                             pip = TRUE),
      silent = TRUE)
  try(reticulate::py_install(
    "scikit-learn",
    envname = "./r-reticulate",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE
  ),
  silent = TRUE)
  try(reticulate::py_install(
    "git+https://github.com/Techtonique/mlsauce.git@feature-branch",
    envname = "./r-reticulate",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE
  ),
  silent = TRUE)
  # use superassignment to update global reference to package
  ms <<- reticulate::import("mlsauce", delay_load = TRUE)
  sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
}
.onLoad <- memoise::memoise(.onLoad)
