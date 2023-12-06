coste <- 1:15
precio <- coste * 2

#Llamamos al grafico
plot(coste, precio, type = "l",
     main = "Relacion entre coste y precio",
     xlab = "Coste de producto",
     ylab = "Precio"
     )

#Grafico de barras

vendedores <- c("Juan","Silvia","Fernando","Pedro")
ventas <- c(10000,15000,60000,90000)

barplot(ventas, names.arg = vendedores,
        main = "Ventas por comercial",
        xlab = "Comerciales",
        ylab = "Importe",
        horiz = FALSE,
        space = 5,
        width = 10
        )
