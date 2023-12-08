#Instalacion de las librerias
install.packages('caret')
library(caret)
#Que modelos tenemos para operar
modelos <- getModelInfo()
names(modelos)
#Vercinos cercanos
modelLookup('knn')
#Redes neuronales - ¿Que podemos tocar? Las capas
modelLookup('neuralnet')
getModelInfo('neuralnet')

#¿Como ajustamos los parametros?
trainControl('knn')

#Ejemplo 1 de regresion sobre el modelo mtcars
head(mtcars)
data("mtcars")


#Particionamos los datos del dataset mtcars en 2 conjuntos
#Conjunto 1 - Datos de entreno
#Conjunto 2 - Datos de testeo 

#Definimos una semilla que nos permitira generar el indice
set.seed(123)

# Generamos el indice con el metodo del paquete caret
# 70% datos entreno. Mantenemos la estructura original diciendole que no
# lo devuelva en modo lista
index <- createDataPartition(mtcars$mpg,
                             p=0.7,
                             list=FALSE)
#Le metemos un set de entreneamiento, todas las filas del indice 70%
train_set <- mtcars[index,]
#Todas las filas desde el fin del indice que hemos creado 71% en adelante
test_set <- mtcars[-index,]

#Entrenamos el modelo
head(test_set)

# Podemos generar una regresion lineal porque intentamos predecir un valor
# numerico
modelLookup('lm')
modelLookup('neuralnet')
modelLookup('knn')

#Funcion de control: Objetivo: Testear todos los modelos con diferentes
#parametros hasta encontrar el mas optimo de todos
#Cv - Cross Variation , 10 veces, muestra los parametros usados
ctrl <- trainControl(method = 'cv', number = 10, verboseIter = TRUE)

#-------------
#Primer algoritmo
#Regresion lineal
#Objetivo: predecir las millas por galon de gasolina
#Recuerda: ~ se usa para decir "en funcion de "  y  . = todos los valores
lr_model <- train(mpg ~ .,
                  data = train_set,
                  method = 'lm',
                  trControl = ctrl
                  )

lr_model
#Predecimos. Pasandole el modelo y los datos

lr_predic <- predict(lr_model, test_set)

lr_rmse <- sqrt(mean((lr_predic-test_set$mpg)^2))

lr_rmse

#-------------
#Segundo algoritmo
#KNN - Añadimos la lista de valores de K de 1 a 20 con pasos de 1 en 1.
knn_model <- train(mpg ~ .,
                  data = train_set,
                  method = 'knn',
                  trControl = ctrl,
                  tuneGrid = expand.grid(k = seq(1,20,1))
)

knn_model
knn_predict <- predict(knn_model, test_set)
knn_rmse <- sqrt(mean((knn_predict-test_set$mpg)^2))
knn_rmse

#-------------
#Tercer algoritmo
#Neural network
#¿Que aprametros necesita el modelo? usa:
modelLookup('neuralnet')
#Para este modelo me ha pedido instalar el paquete Deriv
nn_model <- train(mpg ~ .,
                   data = train_set,
                   method = 'neuralnet',
                   trControl = ctrl,
                   tuneGrid = expand.grid(layer1 = c(1:3), layer2 = c(1:3), layer3 = c(1:3))
)
#A diferencia del profesor, en mi modelo, lo mas optimo es este Nº de neuronas:
# layer1 = 1, layer2 = 1, layer3 = 3
nn_model
nn_predict <- predict(nn_model, test_set)
nn_rmse <- sqrt(mean((nn_predict-test_set$mpg)^2))
nn_rmse


#Comparacion de algoritmos

cat('Regresion lineal',  lr_rmse, "\n")
cat('Knn',   knn_rmse, "\n")
cat('Red neuronal',  nn_rmse, "\n")


#El mejor modelo es el KNN porque da un valor de 3.60 a diferencia de los otros
# mas altos

#SEGUNDO EJEMPLO DE MODELOS usando dataset de IRIS
head(iris)
summary(iris)

data(iris)

set.seed(568)

index <-  createDataPartition(iris$Species,
                              p = 0.8,
                              list = FALSE)
#Division de sets
iris_train_set <- iris[index,]
iris_test_set <- iris[-index,]

#Funcion de control: Objetivo: Testear todos los modelos con diferentes
#parametros hasta encontrar el mas optimo de todos
#Cv - Cross Variation , 10 veces, muestra los parametros usados
ctrl <- trainControl(method = 'cv', number = 10, verboseIter = TRUE)

knn_iris_model <- train(Species ~ .,
                        data = iris_train_set,
                        method = 'knn',
                        trControl = ctrl,
                        tuneGrid = expand.grid(k = seq(2,15,1))
                        )
# El modelo estima que mira los 7 vecinos mas cercanos
knn_iris_model
knn_iris_predict <- predict(knn_iris_model, iris_test_set)

#Comparamos casos indentificados y nos diga si están bien
confusionMatrix(knn_iris_predict, iris_test_set$Species)


