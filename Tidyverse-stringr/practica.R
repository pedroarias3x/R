install.packages("stringr")
library(stringr)

data(package = "stringr")
head(sentences)

frutas <- c("pera","banana","kiwi","manzana","paraguayo","fresa","pera")
meses <- c("enero","febrero","marzo","abril")
#Coincidencias
str_detect(sentences,"sad")
str_count(sentences,"sad")
head(sentences, n=1)

str_which(frutas,"pera")
#Localiza un substring en el vector
str_locate(frutas, "ana")

#subconjuntos
str_subset(sentences,"sad")
str_subset(frutas,"ana")

#Sacar abreviaturas - ejemplo
str_sub(frutas,1,4)
str_sub(meses,1,3)

#Longitud de cada  string
str_length(frutas)
#Reemplazar cadena de caracteres
str_sub(frutas[3],1,-1) <- "mango"
#Replace, necesita guardar en el propio vector
frutas <- str_replace(frutas,"paraguayo","naranja")
frutas





