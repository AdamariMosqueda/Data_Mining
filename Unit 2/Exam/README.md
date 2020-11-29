# Exam
The exam consists of creating a graph as similar to the following:

![Imgur](https://imgur.com/NFnUorU.png)

The only thing that is provided is a csv file called "Project-Data", for this we indicate where in the file.

```R
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Evaluation/Exam")
setwd("/home/alejandro/Data_Mining/Evaluation/Exam/")
getwd()

Data <- read.csv("Project-Data.csv")
```
In setwd we indicate where we have the file to read, this makes it easier to read the csv file.

The dataframe has columns where the names are several separate words and / or includes the% symbol, this causes errors in R so we decided to change the names of all the columns, although not all the information is needed.

```R
colnames(Data) <- c("Day_of_Week", "Director", "Genre", "Movie_Title", "Release_Date",
                "Studio", "Adjusted_Gross", "Budget",
                "Gross","IMDb_Rating","MovieLens_Rating",
                "Overseas_M", "Overseas", "Profit_M","Profit","Runtime",
                "US","Gross_US")
```

The graph contains 5 genres and 6 studies, but the dataframe contains more information about these, so we made a filter, we created a new dataframe with the Data information, where the Genre column is "action", but it asks for 5 genres so The OR operator was used to give me the information if it is action, or adventures, or animation, etc.

```R
Data2 <- Data[Data$Genre == "action" | Data$Genre == "adventure" | Data$Genre == "animation"
              | Data$Genre == "comedy" | Data$Genre == "drama",]
```
The same is done for the studies, only instead of giving the Data information, the Data2 information is given, which already has the genres filter

```R
Data3 <- Data2[Data2$Studio == "Buena Vista Studios" | Data2$Studio == "Fox" 
               | Data2$Studio =="Paramount Pictures" | Data2$Studio == "Sony"
               | Data2$Studio =="Universal" | Data2$Studio =="WB",]
```

First, the ggplot2 libraries are loaded, in order to make the diagram.

```R
library(ggplot2)
```

P, is our variable, we call the ggplot function, where we will put the following arguments, first of all we call our data, in this case it is called Data3, and then in the aes or Aesthetic function, on the X axis we will put the genre y on the Y axis the gross us, followed by each study having a different color and the size being defined by the Budget

```R
p <- ggplot(Data3, aes(x=Genre, y=Gross_US, 
                 color=Studio, size=Budget))
```

Now to the variable P, we add the geom_jitter and the geom_boxplot, but we will give the boxplot a size of 0.2, we will put the color black and a transparency of 0.5 or alpha of 0.5.

We will add the labs, to put, the general title of the graph, sub-titles of the X axis and the Y axis and also change the name of the Budget scale

Followed by the titles, we add a theme, where the letter of the sub-titles are in BlueViolet color and both have a font size of 18, the general title of the graphic was adjusted in the middle and a font size was given of 22 and to finish the whole graphic the font was changed by Comic Sans MS.

```R
p + geom_jitter() + geom_boxplot(size=0.2, color = "Black", alpha=0.5) +
  labs(title = "Domestic Gross % by Genre", x = "Genre", y = "Gross % US") + scale_size(name="Budget $M") +
  theme(axis.title.x = element_text(color = "BlueViolet", size = 18),
        axis.title.y = element_text(color = "BlueViolet", size = 18),
        plot.title = element_text(hjust = 0.5, size = 22),
        text = element_text(family = "Comic Sans MS"))

```
Final score

![Imgur](https://imgur.com/FCWbNeh.png)