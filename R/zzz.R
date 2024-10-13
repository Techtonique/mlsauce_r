#' Python module numpy
#' 
#' This is the Python `numpy` module imported using reticulate.
#' @export
numpy <- NULL 

#' Python module pandas
#' 
#' This is the Python `pandas` module imported using reticulate.
#'@export
pandas <- NULL 

#' Python module sklearn
#'
#'  This is the Python `sklearn` module imported using reticulate.
#'@export
sklearn <- NULL 

#' Python module mlsauce
#'
#' This is the Python `mlsauce` module imported using reticulate.
#'@export
ms <- NULL 

.onLoad <- function(libname, pkgname) {
  utils::install.packages("reticulate",
                          repos = list(CRAN = "https://cloud.r-project.org"))

    reticulate::py_install(
    "setuptools",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE)
    reticulate::py_install(
    "wheel",
    pip = TRUE,
    pip_options = "--upgrade",
    pip_ignore_installed = TRUE)
    reticulate::py_install(
      "Cython",
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE)
    reticulate::py_install(
      "scikit-learn",
      pip = TRUE,
      pip_options = "--upgrade",
      pip_ignore_installed = TRUE
    )
    reticulate::py_install(
      "git+https://github.com/Techtonique/mlsauce.git",
      pip = TRUE,
      pip_options = c("--upgrade", "--verbose"),
      pip_ignore_installed = TRUE
    ) 

  numpy <<- reticulate::import("numpy", delay_load = TRUE)
  pandas <<- reticulate::import("pandas", delay_load = TRUE)
  sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
  ms <<- reticulate::import("mlsauce", delay_load = TRUE)


  reticulate::use_virtualenv("r-reticulate", required = TRUE)                          

}

