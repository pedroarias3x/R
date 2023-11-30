#-------------------------------
#Leer el dataframe y construir el fichero origen
data(mtcars)

#Obtenemos el dataframe por defecto 
df <- mtcars
#Cogemos el indice del dataframe y lo transformamos en una columna normal
nuevo_df <- data.frame(model = rownames(df), df)
rownames(nuevo_df) <- NULL
nuevo_df
#Cargamos la libreria (previamente descargada)
if (!requireNamespace("openxlsx", quietly = TRUE)) {
  install.packages("openxlsx")
}
library(openxlsx)
#Nombre del fichero
nombre_fichero <- "mtcars.xlsx"
#Cambiar al directorio de trabajo
getwd()
setwd("C:/Users/pedro/Documents/Git/R/R/Proyecto02/")
#Almacenamos el fichero
write.xlsx(nuevo_df,nombre_fichero,)
#-------------------------------
#Reto
# Instala y carga la biblioteca readxl si aún no está instalada
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
library(readxl)
#Lectura del fichero
#Primero defines la ruta
ruta_fichero <- "C:/Users/pedro/Documents/Git/R/R/Proyecto02/mtcars.xlsx"
excel_sheets(ruta_fichero)
datos <- read_excel(path = ruta, sheet = "cars")
head(datos)

?mtcars
#Nos quedamos con las filas cuya columna am sea 0
automaticos <- datos[datos$am == 0,]
#cribamos las columnas que tenemos en el df de automaticos
resumen_automaticos <- automaticos[,c("model","mpg","cyl","hp","gear")]
resumen_automaticos

#Leer datos de una web
# Instala y carga la biblioteca rvest si aún no está instalada
if (!requireNamespace("rvest", quietly = TRUE)) {
  install.packages("rvest")
}
library(rvest)

url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
#Guardamos la pagina
page <- read_html(url)
#Almacenamos todas las tablas de la pagina
tables <- html_table(html_elements(page,"table"))
#Guardamos la tabla de atletas y sus marcas
table_athletes <- tables[[3]]
#visualizamos
head(table_athletes,n=6)
table_athletes$Athlete
#cribamos la tabla atletas para quedarnos con todas las columnas cuyo origen
#sea NY
ny_data = table_athletes[table_athletes$Venue == "New York",]
ny_data



