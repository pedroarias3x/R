#Machine Learning - Reto
#Cargamos los paquetes
library(caret)
library(dplyr)

data(package = 'mlbench', PimaIndiansDiabetes2)
#Que tenemos en los datos
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)

#Limpiamos los datos. Hay muchos valores con N/A! y columnas que no necesitamos
#Muy importante, na.omit es una llamada a funcion. Me la habia cogido como
# otra cosa
data_fix <- PimaIndiansDiabetes2 %>% 
        select( pregnant, glucose, pressure,mass,pedigree, age, diabetes)%>% 
        na.omit()

data_fix
summary(data_fix)
summary(PimaIndiansDiabetes2)
#Construimos los dos conjuntos de datos para crear modelos de ML
#Semilla
set.seed(478)
index <- createDataPartition(data$diabetes,
                             p=0.7,
                             list = FALSE)
#Sets
train_set <- data_fix[index,]
test_set <- data_fix[-index,]

#Definimos funcion de control
ctrl = trainControl(method = 'cv', number = 8, verboseIter = TRUE)
knn_parrams = expand.grid(k = c(2:20))

#¿Que parametros necesitabamos?
modelLookup('knn')

#Entrenamos el modelo
knn_model <- train(diabetes ~ .,
                   data = train_set,
                   method = 'knn',
                   trControl = ctrl,
                   tuneGrid = knn_parrams)
#El mejor valor es K=7
knn_model
#Vamos a representarlo para ver la acccuracy del modelo
plot(knn_model)
#Predecimos el resto del dataset
knn_predict <- predict(knn_model, test_set)
#Analizamos la matriz de confusion para las preducciones y la variable que analizamos
confusionMatrix(knn_predict, test_set$diabetes)

#Analisis
summary(test_set$diabetes)
#Nos da 142 positivos + 74 negativos. Valores que coinciden al 100% 
#con los datos predecidos, segun la matriz de confusion
#Los modelos trabajan con dos clases (A y B)
#Sensitividad - Cuantos elementos de la clase A ha detectado
#Specificidad - cuantos elementos de la clase B ha detectado

#--------------------
#Segundo modelo
modelLookup('glm')
#modelo de regresion logistica
glm_model <- train(diabetes ~ .,
                     data = train_set,
                     method = 'glm',
                     trControl = ctrl)
glm_model

glm_predict <- predict(glm_model, test_set)

confusionMatrix(glm_predict, test_set$diabetes)


#Resumen - El modelo de regresion logistica tiene un 56% y el knn 54% de 
# probabilidades de acertar en un caso de diabetes


