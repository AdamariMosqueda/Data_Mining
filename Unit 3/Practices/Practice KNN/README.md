# Practice 2

## In this practice we explain the code to plot a KNN classifier

```r
setwd("C:/Users/MARIO BAJA PC/Documents/Mineria_de_datos/Data_Mining/Unit 3/Practices/Practice 2")
getwd()
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
The first thing to do is indicate where our csv file will be and create a new dataset that will contain all this information, for this example we arrange the dataset [3: 5] so that it takes the data from the column 3 through column 5.

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
From the dataset you get the Purchased column, which contains 1 and 0, which says it is true or false.
```r
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
We use the caTools library to implant a 123 seed, a split is made where training_set has TRUE values ​​while test_set has FALSE values

```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
We use the Scale function that what it does is center the values ​​of a matrix and scale them.

```r
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5)
```
Now our K-NN classifier is created with the class library, with this we make a prediction, where we give it the values ​​of train, test and cl, where k is the number of closest neighbors.

![Imgur](https://imgur.com/9tv3FHD.png)

These are the results of the prediction we made for Purchased, but it is very difficult to see these results with the datasets, so a visualization will be performed.

```r
cm = table(test_set[, 3], y_pred)
```
We create the confusion matrix with the table function, which we will give test_set showing 3 columns and we give it y_pred

```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
```
Now the visualization continues, before making the plot the information must be accommodated for this we import the ElemStatLearn library, in set we put the first test that is training_set, where X1 has the minimum set that is given the value of 1, minus 1 , and the maximum is also obtained by giving it the value of 1, X2 is given similar parameters with the difference that we give it the value of 2. We create a grid that is the expansion between X1 and X2, where the columns of this grid with Age and EstimatedSalary, we create y_grid which will be our y axis, it is the prediction how it was explained with y_pred

```r
plot(set[, -3],
     main = 'K-NN Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
In the plot the title is placed with main, with lab the legends of the axes are modified and with lim we indicate the range, where a contour is made that includes X1, X2, the matrix that has y_grid, the length of the X and that be TRUE.
The points are obtained from grid_set, which is the background of the graph with red and green colors, but to better visualize the data, other points with other shades of green and red are added.

![Imgur](https://imgur.com/1woLSSh.png)

As can be seen in the graph, he made very accurate predictions because he divides the data, but there are some red dots in the green area and vice versa, which are the errors that came out at the time of making the prediction.
```r
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
```
Now the same configuration is done for test_set to check its accuracy with the predictions.
```r
plot(set[, -3], main = 'K-NN Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![Imgur](https://imgur.com/MxL9i5l.png)

You can see from this graph that it also had its errors, but like the previous example, it did its best to separate the data, so it is not too far from reality.
