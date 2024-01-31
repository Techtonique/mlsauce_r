# global reference to scipy (will be initialized in .onLoad)
ms <- NULL
sklearn <- NULL

.onLoad <- function(libname, pkgname) {
  utils::install.packages("reticulate",
                          repos = list(CRAN = "https://cloud.r-project.org"))
  
  envs <- c("./r-reticulate", ".", NULL)
  lapply(envs, function(env)
  {
    try(reticulate::virtualenv_create(env), silent = TRUE)
    try(reticulate::use_virtualenv(env), silent = TRUE)
    try(reticulate::py_install(
      "Cython",
      envname = env,
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE), silent = TRUE)
    try(reticulate::py_install("numpy",
                              envname = env,
                              pip = TRUE), silent = TRUE)
    try(reticulate::py_install("pandas",
                              envname = env,
                              pip = TRUE), silent = TRUE)
    try(reticulate::py_install("requests",
                              envname = env,
                              pip = TRUE), silent = TRUE)                           
    try(reticulate::py_install("scipy",
                              envname = env,
                              pip = TRUE), silent = TRUE)
    try(reticulate::py_install("scikit-learn",
                              envname = env,
                              pip = TRUE), silent = TRUE)
    try(reticulate::py_install(
      "scikit-learn",
      envname = env,
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE
    ), silent = TRUE)
    try(reticulate::py_install(
      "mlsauce",
      envname = env,
      pip = TRUE,
      pip_options = c("--upgrade", "--verbose"),
      pip_ignore_installed = TRUE
    ), silent = TRUE)
  })

  # use superassignment to update global reference to package
  ms <<- reticulate::import("mlsauce", delay_load = TRUE)
  sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
}
.onLoad <- memoise::memoise(.onLoad)
