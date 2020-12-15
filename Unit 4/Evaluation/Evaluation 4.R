#Implementar el modelo de agrupación K-Means con el conjunto de datos Iris.csv que
#se encuentra en https://github.com/jcromerohdz/iris utilizando el método
#kmeans() en R. Una vez que se obtenga el modelo de agrupamiento hacer el analis
#de visualización de datos correspondiente.

#Al finalizar el desarrollo explicar detalladamente en consiste el modelo de
#agrupación K-Means y cuales fuerón sus observacines en el analisis de visualización
#de datos.

setwd("C:/")
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
