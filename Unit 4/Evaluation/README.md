# Exam U4
Para este examen usamos el método de agrupación de K-Means para el archivo iris.csv
```R
setwd("C:/")
setwd("/home/alejandro/Data_Mining/Unit 4/Evaluation/")
getwd()
```
Indicamos la ruta en la que vamos a estar trabajando, que es donde esta nuestro archivo csv

```R
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
dataset
```
Creamos el dataset con los datos de iris.csv y solo seleccionamos desde la columna 1 a la 4 porque la columna 5 tiene valores string

```R
set.seed(6)
wcss = vector()
                   #suma de cuadrados dentro de cada grupo
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
```
Implementamos la semilla con el valor de 6 y creamos el vector, wcss son las siglas de "suma de los cuadrados dentro de cada grupo", creamos un ciclo for donde i va a ir de 1 a 10, indicando el número de clusters, a cada vector se le da la suma de wcss.

```R
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```
Hacemos el ploteo del método Elbow con los valores de cada clusters, el tipo se refiere a lo que se va a plotear, l es lineal, p es point, y b es both.
![Imgur](https://imgur.com/SiBcgLn.png)

Este método sirve para identificar el número óptimo de K, en la gráfica se encuentra el “punto codo”, donde la tasa de descenso se “afila”.

![Imgur](https://imgur.com/T6lFpNL.png)

Por eso llegamos a la conclusión que el valor óptimo para K es 3