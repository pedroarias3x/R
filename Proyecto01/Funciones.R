#Contruir una funcion que, al indicarle el salario por hora
# el numero de horas trabajadas durante la semana de un trabajador y la retencion
# en decimales. Calcule y devuelva el salario neto, salraio bruto
#Considerando que si las horas trabajadas son superiores a 45, son horas extra
# y debe pagarse a un 50% mas. Por defecto las horas son 40 y retencion 2%


salario <- function(costehora, horas = 40, retenciones = 0.02){
  if (horas > 45){
    horasextra = horas - 45
    costextra = costehora * 1.5
    bruto = 45 * costehora + horasextra * costextra
    neto = bruto * (1-retenciones )
  }else{
    bruto = horas * costehora
    neto = bruto * (1-retenciones ) 
  }
  
  return (list("Salario bruto" = bruto, "Salario neto" = neto))
}


salario(20,50,0.2)

# Calcular la media d eun vector numerico, sumando todos los elementos
# y dividiendo entre el numero de elementos. Sin usar funciones predefinidas

media <- function(vector){
  resultado <- 0
  for (i in 1:length(vector)) {
    resultado <- resultado  + vector[i]
  }  
  resultado / length(vector)
}


#Bucle while
media1 <- function(vector){
  resultado <- 0
  i <- 1
  while(i<=length(vector)){
    resultado <- resultado  + vector[i]
    i <- i+1
  }
  
  resultado / length(vector)
}

#Vectorizacion
media2 <-  function(vector){
  sum(vector) / length(vector)
}


#Test
media(1:11)
media1(1:11)
media2(1:11)

mean(1:11)


