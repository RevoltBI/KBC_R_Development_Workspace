
# Load a sample library into docker. 
withCallingHandlers(install.packages(
  c('tidyverse','httr'), 
  lib = "/usr/local/lib/R/site-library/"), warning = function(w) stop(w))

# install the Keboola R application
devtools::install_github('keboola/r-docker-application', ref = "2.0.2")
devtools::install_github('keboola/r-application', ref = "master", force = TRUE)