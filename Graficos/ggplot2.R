#Instalacion de las librerias
install.packages("ggplot2")
install.packages("gapminder")

install.packages("dplryr")
library(ggplot2)
library(gapminder)

library(dplyr)


head(gapminder,n=10)

#Filtramos por pais España
spain <- filter(gapminder, country == "Spain")
head(spain)


ggplot(data = spain,
       aes(x=year, y=lifeExp)) + 
        geom_line(color = "red") + 
        geom_point(size = 3, color = "green")+
        geom_text(aes(label = lifeExp))+
        labs(title = "Evolucion esperanza de vida en España",
             x = "Años",
             y = "Esperanza de vida")

country <- gapminder %>% select(country)