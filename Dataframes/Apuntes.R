
#-----------------------
#crear un data frame
df <- data.frame(id = 1:4,
                 nombres = c("Ana","Belen","Carlos","Daniel"),
                 notas = c(8.5,7,4,9.2))

df

#-----------------------
#propiedades
class(df)
dim(df)
length(df)
ncol(df)
nrow(df)

#-----------------------
#funciones utiles
names(df) #Nombres columnas
head(df, n=2) #Primeros
tail(df, n=3) #Ultimos
summary(df) #Info
str(df) #Info

#-----------------------
#Acceder a elementos
df$nombres
df[[3]]
df[1,] #Fila
df[,2] #Columna
df[3,3]


#-----------------------
#Add
df$edad <- c(20,32,28,40)
dim(df)
#No se pueden pasar columnas de tamaños diferentes - Test
df$aprobado <- c(TRUE,TRUE,FALSE)
cbind(df,aprobado = c(TRUE,TRUE,FALSE,TRUE)) #Añade a un df una columna = rbind
#OJO! la añade pero no la has guardado aun en el df
df <- cbind(df,aprobado = c(TRUE,TRUE,FALSE,TRUE)) #Añade a un df una columna = rbind
dim(df)


#-----------------------
#Eliminar elementos
df$aprobado <- NULL
dim(df)

names(df)
names(df)[2]<- "Nombre y apellido"
names(df)
names(df)[2]<- "Nombre"
names(df)


#-----------------------
#Coercion
df_numeros <- data.frame(A=1:10, B=11:20)
mat <- as.matrix(df_numeros)
mat
class(mat)

#Convertir df a matriz
mat2 <- as.matrix(df)
mat2
#Todo se ha transformado a character (casting de numeros)

df_numeros2 <- as.data.frame(mat)
df_numeros2



