


#' Download datasets
#'
#' @param pkgname a string; R package name
#' @param dataset a string; dataset name
#' @param source a string; package location (address)
#'
#' @return A data frame
#' @export
#'
#' @examples
#'
#' df <- mlsauce::download(pkgname="MASS", dataset="Boston", source="https://cran.r-universe.dev/")
#' print(df)
#'
download <-
  function(pkgname = "MASS",
           dataset = "Boston",
           source = "https://cran.r-universe.dev/",
           venv_path = "./venv",
           ...) {
    
    # Lazy load sklearn only when needed
    ms <- get_mlsauce(venv_path)
    
    as.data.frame(ms$download(
      pkgname = pkgname,
      dataset = dataset,
      source = source
    ))
  }
