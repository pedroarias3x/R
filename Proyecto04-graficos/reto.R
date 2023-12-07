install.packages("mlbench")

library(ggplot2)
#Dataset
library(mlbench)
#Manipular datos
library(stringr)
library(dplyr)

?mpg

#histograma
head(mpg)

 ggplot(data = mpg, aes(x=cyl)) + 
    geom_histogram(binwidth = 0.8, color = "red", fill = "blue") + 
   labs(title = "Coches por cilindrada",
        x = "Cilindros",
        y = "Nº coches")
#Graficos de barras
 ggplot(mpg, aes(x=class))+
   geom_bar(aes(fill=manufacturer)) + 
   labs(title = "Coches por clase",
        x = "clase",
        y = "Nº coches") + 
   theme(panel.background = element_blank())+
   theme(plot.title = element_text(color = "red"))
 
 #Boxplot
 mpg$trans <- mpg$trans %>% str_sub(1,-5)
 
 
 ggplot(mpg, aes(x=trans, y=cty))+
   geom_boxplot(aes(fill = trans)) +
   labs(title = "Consumo por tipo de transmision",
        x = "Transmision",
        y = "Consumo urbano") +
   theme(panel.background = element_blank())

 #Grafico de dispersion
 #Cómo se comportan dos variables
 ggplot(mpg, aes(x=cty,y=hwy))+
   geom_point(aes(color=trans, size = cyl))
 
 #Facetado

 #Division automatica por clase
 #Color dado por el tipo de transmision (manual/automatica)
 ggplot(mpg, aes(x=cty,y=hwy))+
   geom_point(aes(color=trans, size = cyl))+
   facet_wrap(~class)
 #Division por tipo de transmision
 #Color dado por la clase de coche
 ggplot(mpg, aes(x=cty,y=hwy))+
   geom_point(aes(color=class, size = cyl))+
   facet_wrap(~trans)
 
  