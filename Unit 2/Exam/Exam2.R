
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Evaluation/Exam")
setwd("/home/alejandro/Data_Mining/Evaluation/Exam/")
getwd()

install.packages('extrafont')
library(extrafont)
extrafont::font_import()

windowsFonts()

font_import(pattern="Comic")

fonts()

Data <- read.csv("Project-Data.csv")

colnames(Data) <- c("Day_of_Week", "Director", "Genre", "Movie_Title", "Release_Date",
                "Studio", "Adjusted_Gross", "Budget",
                "Gross","IMDb_Rating","MovieLens_Rating",
                "Overseas_M", "Overseas", "Profit_M","Profit","Runtime",
                "US","Gross_US")
head(Data)

library(ggplot2)

#Filers
#Genres
Data2 <- Data[Data$Genre == "action" | Data$Genre == "adventure" | Data$Genre == "animation"
              | Data$Genre == "comedy" | Data$Genre == "drama",]
Data2

#Studios
Data3 <- Data2[Data2$Studio == "Buena Vista Studios" | Data2$Studio == "Fox" 
               | Data2$Studio =="Paramount Pictures" | Data2$Studio == "Sony"
               | Data2$Studio =="Universal" | Data2$Studio =="WB",]
Data3

#boxplot + jitter
p <- ggplot(Data3, aes(x=Genre, y=Gross_US, 
                 color=Studio, size=Budget))

p + geom_jitter() + geom_boxplot(size=0.2, color = "Black", alpha=0.5) +
  labs(title = "Domestic Gross % by Genre", x = "Genre", y = "Gross % US") + scale_size(name="Budget $M") +
  theme(axis.title.x = element_text(color = "BlueViolet", size = 18),
        axis.title.y = element_text(color = "BlueViolet", size = 18),
        plot.title = element_text(hjust = 0.5, size = 22),
        text = element_text(family = "Comic Sans MS"))
