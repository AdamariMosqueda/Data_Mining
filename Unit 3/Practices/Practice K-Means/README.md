# K-Means Clustering
## Set our workspace
```R
getwd()
setwd("/home/alejandro/Data_Mining/Unit 3/Practices/Practice K-Means/")
getwd()
```

## Importing the dataset
```R
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5]
```

## Using the elbow method to find the optimal number of clusters

We add our randomness seed, then in a vector where i is looped in sequence from 1 to 10, where the wcss data of i will be equal to the sum, where kmeans will make the grouping of the vectors of the ei dataset, and we will identify the data from column withinss.

In the plot we will have the sequence of the vector 1 to 10, using the wcss data, in type it would be equal to b, the main name of the graph will be The Elbow Method, in the X axis we will have the name of Number of clusters and in the axis And WCSS

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

## Fitting K-Means to the dataset
```R
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster
```
## Visualising the clusters

Using the cluster library, we will use the clusplot tool, where we will have the dataset data and the mean of Y

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