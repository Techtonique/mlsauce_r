.onLoad <- function(libname, pkgname) {
  venv_path <- Sys.getenv("YOURPACKAGE_VENV", "venv")
  
  if (dir.exists(venv_path)) {
    packageStartupMessage("Python environment detected: ", venv_path)
  } else {
    packageStartupMessage(
      "To use this package:\n",
      "  1. Create venv: uv venv venv\n",
      "  2. Activate: source venv/bin/activate\n"
    )
  }
}