#Instalacion de las librerias
install.packages("ggplot2")
install.packages("gapminder")

install.packages("dplyr")
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

country <- gapminder %>% select(country,continent) %>%
            group_by(continent) %>% filter(!duplicated(country))

ggplot(data = country) +
      geom_bar(aes(y = continent), fill = "blue") +
      labs(title = "Paises por continente",
           x = "Continente",
           y = "Nº Paises")

europe <- filter(gapminder, continent == "Europe")

head(europe)

#Almacenamos en variables para mantener el grafico inalterable
point <- ggplot(data = europe, aes(x = year, y = lifeExp)) +
      geom_point(aes(color=gdpPercap, size = pop), alpha = 3/5) +
      labs(title = "Evolucion esperanza de vida en europa",
       x = "Años",
       y = "Esperanza de vida")+
      theme(panel.background = element_blank()) 

point




