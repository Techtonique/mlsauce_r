# git+https://github.com/Techtonique/mlsauce.git

#' @export
VENV_PATH <- NULL 

#' @export
ms <- NULL  
#' @export
sklearn <- NULL  
#' @export 
numpy <- NULL
#' @export
pandas <- NULL

#' @import reticulate
.onLoad <- function(libname, pkgname) {
  tryCatch({
  # Specify the name of the virtual environment
  env_name <- "mlsauce_env"
  
  # Path to the virtual environment (persistent location)
  VENV_PATH <<- file.path(Sys.getenv("HOME"), ".mlsauce", env_name)
  
  # Create the parent directory if it doesn't exist
  if (!dir.exists(dirname(VENV_PATH))) {
    dir.create(dirname(VENV_PATH), recursive = TRUE, showWarnings = FALSE)
  }
  
  # Check if the virtual environment exists
  if (!dir.exists(VENV_PATH)) {
    message("Creating Python virtual environment...")
    
    # Create the virtual environment
    tryCatch({
      reticulate::virtualenv_create(VENV_PATH, python = "python3")
    }, error = function(e) {
      stop("Failed to create virtual environment: ", e$message)
    })
    
    # install required Python packages
    message("installing Python packages...")
    tryCatch({
      reticulate::virtualenv_install(
        VENV_PATH,
        packages = c("scikit-learn", "git+https://github.com/Techtonique/mlsauce.git",
        "numpy", "pandas"),
        ignore_installed = TRUE
      )
    }, error = function(e) {
      stop("Failed to install Python packages: ", e$message)
    })
  }
  # Use the 'Global', persistent virtual environment
  tryCatch({
    reticulate::use_virtualenv(VENV_PATH, required = TRUE)
    sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
    ms <<- reticulate::import("mlsauce", delay_load = TRUE)
    numpy <<- reticulate::import("numpy", delay_load = TRUE)
    pandas <<- reticulate::import("pandas", delay_load = TRUE)    
  }, error = function(e) {
    message("Failed to use virtual environment: ", e$message)
    # Import sklearn lazily
    tryCatch({
      message("installing sklearn from r-reticulate...")
      reticulate::py_install("scikit-learn")      
      reticulate::py_install("numpy")
      reticulate::py_install("pandas")
      reticulate::py_install("git+https://github.com/Techtonique/mlsauce.git")
      reticulate::use_virtualenv("r-reticulate", required = TRUE)
      message("Importing sklearn...")
      sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
      ms <<- reticulate::import("mlsauce", delay_load = TRUE)
      numpy <<- reticulate::import("numpy", delay_load = TRUE)
      pandas <<- reticulate::import("pandas", delay_load = TRUE)    
    }, error = function(e) {        
      message("Importing sklearn from Global Env...")
      sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
      numpy <<- reticulate::import("numpy", delay_load = TRUE)
      pandas <<- reticulate::import("pandas", delay_load = TRUE)        
      system("pip install git+https://github.com/Techtonique/mlsauce.git")
      ms <<- reticulate::import("mlsauce", delay_load = TRUE)
    })
  })    
 }, error = function(e) { # If using 'Global' virtual environment fails, use  the default local 'r-reticulate'
    tryCatch({
      message("installing sklearn from r-reticulate...")
      reticulate::py_install("scikit-learn")
      reticulate::py_install("git+https://github.com/Techtonique/mlsauce.git")
      reticulate::py_install("numpy")
      reticulate::py_install("pandas")
      reticulate::use_virtualenv("r-reticulate", required = TRUE)
      message("Importing sklearn...")
      sklearn <<- reticulate::import("sklearn", delay_load = TRUE)
      ms <<- reticulate::import("mlsauce", delay_load = TRUE)
      numpy <<- reticulate::import("numpy", delay_load = TRUE)
      pandas <<- reticulate::import("pandas", delay_load = TRUE)    
    }, error = function(e) { # If using 'r-reticulate' fails, use the default local 'Global' virtual environment, e.g in Colab     
      message("Importing sklearn from Global Env...")
      sklearn <<- reticulate::import("sklearn", delay_load = TRUE)      
      numpy <<- reticulate::import("numpy", delay_load = TRUE)
      pandas <<- reticulate::import("pandas", delay_load = TRUE)        
      system("pip install git+https://github.com/Techtonique/mlsauce.git")
      ms <<- reticulate::import("mlsauce", delay_load = TRUE)
    })
  })  
}