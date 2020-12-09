# K-Means Clustering
# Set our workspace
```R
getwd()
setwd("/home/alejandro/Data_Mining/Unit 3/Practices/Practice K-Means/")
getwd()
```

# Importing the dataset
```R
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5]
```

# Using the elbow method to find the optimal number of clusters

Agregamos nuestra semilla de aleatoriedad, despues en un vector donde i esta en bucle en secuencia de 1 a 10, donde los datos de wcss de i sera igual a la suma, donde kmeans hara la agrupacion de los vectores del dataset e i, e identificaremos los datos de la columna withinss.

En el plot tendremos la secuencia del vector 1 a 10, usando los datos de wcss, en tipo seria igual a b, el nombre principal de la grafica sera The Elbow Method, en el eje X tendremos el nombre de Number of clusters y en el eje Y WCSS

```R
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```
![Rplot](https://i.imgur.com/6Rz6jhZ.png)

# Fitting K-Means to the dataset
```R
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster
```
# Visualising the clusters
# install.packages('cluster')

Usando la libreria de cluster, haremos uso de la herramienta clusplot, donde tendremos los datos del dataset y la media de Y

```R
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
```
![Rplot01](https://i.imgur.com/summDvI.png)