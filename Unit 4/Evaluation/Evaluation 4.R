#Implementar el modelo de agrupaci?n K-Means con el conjunto de datos Iris.csv que
#se encuentra en https://github.com/jcromerohdz/iris utilizando el m?todo
#kmeans() en R. Una vez que se obtenga el modelo de agrupamiento hacer el analis
#de visualizaci?n de datos correspondiente.

#Al finalizar el desarrollo explicar detalladamente en consiste el modelo de
#agrupaci?n K-Means y cuales fuer?n sus observacines en el analisis de visualizaci?n
#de datos.

setwd("C:/")
setwd("/home/alejandro/Data_Mining/Unit 4/Evaluation/")
getwd()

dataset = read.csv('iris.csv')
dataset = dataset[1:4]
dataset


set.seed(6)

wcss = vector()
                   #suma de cuadrados dentro de cada grupo
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)

plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

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

