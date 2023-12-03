
#Cargamos la libreria (previamente descargada)
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
#Cargamos la libreria (previamente descargada)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
#Cargamos la libreria (previamente descargada)
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(readr)
library(ggplot2)

#Para poder leer el dataset de diamantes necesitas ggplot2
df <- data.frame(diamonds)
cortes <- unique(diamonds$cut)

