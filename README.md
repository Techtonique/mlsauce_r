# mlsauce 

**Miscellaneous Statistical/Machine learning stuff.**

[![Documentation](https://img.shields.io/badge/documentation-is_here-green)](https://techtonique.github.io/mlsauce_r/)
![Downloads](https://r-packages.techtonique.net/badges/downloads/last-month/mlsauce.svg)
![Total Downloads](https://r-packages.techtonique.net/badges/downloads/grand-total/mlsauce.svg?color=brightgreen)


R version of the Python package [mlsauce](https://github.com/Techtonique/mlsauce).

**Install from Techtonique**

```bash
install.packages('mlsauce', repos = c('https://r-packages.techtonique.net',
'https://cloud.r-project.org'))
```

```
# pip install uv # if necessary
uv venv venv
source venv/bin/activate
uv pip install pip scikit-learn mlsauce
```


**Install from GitHub**

```bash
remotes::install_github("Techtonique/mlsauce_r") # the repo is in this organization
```

```
# pip install uv # if necessary
uv venv venv
source venv/bin/activate
uv pip install pip scikit-learn mlsauce
```

__General rule for using the package in R__:  object accesses with `.`'s are replaced by `$`'s. R Examples can be found in the package, once installed, by typing (in R console):

```R
?mlsauce::AdaOpt
```

For a list of available models, visit [https://techtonique.github.io/mlsauce/](https://techtonique.github.io/mlsauce/).

