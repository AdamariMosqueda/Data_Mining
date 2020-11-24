# Exam
El examen consiste en crear una gráfica lo más parecida a la siguiente:

![Imgur](https://imgur.com/NFnUorU.png)

Lo único que se nos proporciona es un archivo csv llamado "Project-Data", para ello indicamos en donde está el archivo

```R
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Evaluation/Exam")
setwd("/home/alejandro/Data_Mining/Evaluation/Exam/")
getwd()

Data <- read.csv("Project-Data.csv")
```
En setwd indicamos en dónde tenemos el archivo a leer, esto facilita la lectura del archivo csv.


El dataframe tiene columnas donde los nombres son varias palabras separadas y/o incluye el símbolo %, esto causa errores en R por lo que decidimos cambiar los nombres de todas las columnas, aunque no se necesite toda la información.
```R
colnames(Data) <- c("Day_of_Week", "Director", "Genre", "Movie_Title", "Release_Date",
                "Studio", "Adjusted_Gross", "Budget",
                "Gross","IMDb_Rating","MovieLens_Rating",
                "Overseas_M", "Overseas", "Profit_M","Profit","Runtime",
                "US","Gross_US")
```
La gráfica contiene 5 géneros y 6 estudios, pero el dataframe contiene más información de estos, por ello hicimos un filtro, creamos un nuevo dataframe con la información de Data, donde la columna Género es "action", pero pide 5 géneros por lo que se usó el operador OR para que me ponga la información si es action, o adventures, o animation, etc.
```R
Data2 <- Data[Data$Genre == "action" | Data$Genre == "adventure" | Data$Genre == "animation"
              | Data$Genre == "comedy" | Data$Genre == "drama",]
```

Lo mismo se hace para los estudios, solo que en lugar de darle la información de Data, se le da el de Data2 que ya tiene el filtro de los géneros
```R
Data3 <- Data2[Data2$Studio == "Buena Vista Studios" | Data2$Studio == "Fox" 
               | Data2$Studio =="Paramount Pictures" | Data2$Studio == "Sony"
               | Data2$Studio =="Universal" | Data2$Studio =="WB",]
```

```R
library(ggplot2)
```
Resultado final
![Imgur](https://imgur.com/FCWbNeh.png)