setwd(dir)
# required packages of the project
packages <- c("mclust", "cluster", "plyr", "dplyr", "ggplot2", "factoextra", 
              "magrittr", "dendextend", "igraph", "RColorBrewer", "clValid",
              "NbClust", "tidyr", "reshape", "reshape2", "data.table", 
              "plotly", "randomForest", "shiny", "shinythemes", 
              "shinydashboard", "partykit", "rpart", "ggmap", "ffbase2")


# function of installing the uninstalled required packages
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))
} 
# loading the required packages/libraries
lapply(packages, require, character.only = TRUE)
