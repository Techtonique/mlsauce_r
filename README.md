# mlsauce 

**Miscellaneous Statistical/Machine learning stuff.**

[![r-universe](https://r-packages.techtonique.net/badges/mlsauce)](https://r-packages.techtonique.net/mlsauce) [![Documentation](https://img.shields.io/badge/documentation-is_here-green)](https://techtonique.github.io/mlsauce_r/)

R version of the Python package [mlsauce](https://github.com/Techtonique/mlsauce).

Only for Linux, for now. Windows users can envisage using [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10), the **Windows Subsystem for Linux**.

**Install from GitHub**

```bash
remotes::install_github("Techtonique/mlsauce_r") # the repo is in this organization
```

**Install from R-universe**

```bash
install.packages('mlsauce', repos = c('https://r-packages.techtonique.net',
'https://cloud.r-project.org'))
```

__General rule for using the package in R__:  object accesses with `.`'s are replaced by `$`'s. R Examples can be found in the package, once installed, by typing (in R console):

```R
?mlsauce::AdaOpt
```

For a list of available models, visit [https://techtonique.github.io/mlsauce/](https://techtonique.github.io/mlsauce/).

