#Investigar 5 funciones de geometr?a que puedan a?adirse a la funci?n ggplot2()

#Antes de las funciones
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Practices/Practice 1")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
factor(movies$Year)

library(ggplot2)

p <- ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                        color=Genre, size=BudgetMillions))

#First function
#geom_smooth
p + geom_smooth()

#Second function
#labs
gg <- p +
   geom_point() +
   labs(title="Diagrama de puntos", x="Critica", y="Audiencia", 
        color = "Generos", size = "Millones de presupuesto")
gg

#Third function
#facet_wrap
 gg + facet_wrap( ~ Genre, ncol=3)
 
 #Fourth function
 #Box Plot
 p + geom_boxplot()

 #Fifth function
 #Geom Rug
 ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                    color=Genre)) + 
   geom_rug()
