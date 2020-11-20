# Practice 1
## Investigate 5 geometry functions that can be added to the ggplot2 () function
For this practice we use the same csv file that we have been seeing in class,  P2-Movie-Ratings.csv
```R
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Practices/Practice 1")
getwd()
movies <- read.csv("P2-Movie-Ratings.csv")
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

factor(movies$Year)
movies$Year <- factor(movies$Year)

library(ggplot2)
```
We take the line of code from ggplot in which it is defined from which dataframe the data comes, the axes, the color, etc.
```R
p <- ggplot(movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))
```

## First function
geom_smooth (), according to the definition given by R "Helps the eye to see patterns in the presence of overdrawing."
```R
p + geom_smooth()
```
![Imgur](https://imgur.com/mFmkUcn.png)

Generate guidelines to see trends, the shadow is not very visible because it does not show some colors like the yellow that represents Adventure

## Second function
labs (): This function modifies the labels of the axes, of the legends, and a representative title of the graph can be added.
```R
gg <- p + geom_point() + labs(title="Diagrama de puntos", x="Critica", y="Audiencia")
```
![Imgur](https://imgur.com/MlGZOnF.png)
Now instead of seeing the legends as they come in the data, we can put the title to whatever we want.

## Third function
facet_wrap: What it does is separate the color information (in this case genres) in different graphs, ncol is to know how many columns are made for visualization.
```R
gg + facet_wrap( ~ Genre, ncol=3)
```
![Imgur](https://imgur.com/fURS8l2.png)
