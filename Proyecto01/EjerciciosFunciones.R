#1: Define una función llamada saludo que imprima en la consola el
#mensaje "Hola, bienvenido a R".

saludo <- function(){
  print("Hola, bienvenido a R")
}
saludo()

#2: Crea una función llamada calificar_edad que tome un parámetro
#numérico llamado edad y muestre en la consola si la persona es "menor de
#edad" o "mayor de edad".

calificar_edad <- function(edad){

  if(edad>=18){
    print ("mayor de edad")
  }else{
    print ("menor de edad")
  }
}

calificar_edad(19)

#3: Define una función llamada tabla_multiplicar que tome un
#parámetro numérico n e imprima la tabla de multiplicar del 1 al 10 de ese
#número.


tabla_multiplicar <- function(n) {
  for (i in 1:10) {
    resultado <- n * i
    cat(paste(n, "x", i, "=", resultado, "\n"))
  }
}

# Llamada a la función
tabla_multiplicar(5)


#4: Crea una función llamada numeros_pares que tome un parámetro
#numérico limite e imprima los números pares hasta ese límite

numeros_pares <- function(limite) {
  for (i in 1:limite) {
    if (i %% 2 == 0) {
      print(i)
    }
  }
}

# Llamada a la función
numeros_pares(10)

#5:  Define una función llamada matriz_cuadrada que tome un parámetro
#numérico n e imprima una matriz cuadrada de tamaño n x n donde los
#elementos son el resultado de la suma de sus índices de fila y columna.


matriz_cuadrada <- function(n) {
  for (i in 1:n) {
    fila <- numeric(n)
    for (j in 1:n) {
      fila[j] <- i + j
    }
    print(fila)
  }
}

# Llamada a la función
matriz_cuadrada(4)


