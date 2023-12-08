install.packages('mlbench')
library(mlbench)
#Comprobamnos el nombre de los datasets que existen en el paquete
data(package = 'mlbench')
#Usamos el de la diabetes
data(package = 'mlbench', PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)

#-------------------
# Test T de Student: Comparacion de medias de dos grupos
#Funcion de base
t <- t.test(glucose ~ diabetes, data = PimaIndiansDiabetes2)
print(t)
#Si la T es más negatica, hay más diferencia entre las medias

#------------------
# Test anova
data(package = 'ggplot2', diamonds)
anova <- aov(price ~ cut, data = diamonds)
print(summary(anova))

#-----------------
# Test chi cuadrtado
tabla_contingencia <- table(diamonds$cut, diamonds$color)
tabla_contingencia

chi_cuadrado <- chisq.test(tabla_contingencia)
chi_cuadrado
#p - value mucho menor al 0.05% da la hipotesis por invalidad

#-------------------
#test de correlacion de pearson
cor_test <- cor.test(PimaIndiansDiabetes2$glucose, PimaIndiansDiabetes2$mass)
cor_test
#correlacion 23% directa, a mas masa, más glucosa


#Test de willconxon
precio_antes <- diamonds$price[1:100]
precio_despues <- diamonds$price[101:200]

willconxon <- wilcox.test(precio_antes,precio_despues,paired=TRUE)
willconxon
