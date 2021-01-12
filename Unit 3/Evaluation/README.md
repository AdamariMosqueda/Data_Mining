 # Exam 

## Naive Bayes
In a broad sense, Naive Bayes models are a special class of classification algorithms for Machine Learning, or Machine Learning, as we will refer to from now on. They are based on a statistical classification technique called "Bayes's theorem."


They assume that the predictor variables are independent of each other. In other words, that the presence of a certain feature in a data set is not at all related to the presence of any other feature.
They provide an easy way to build very well behaved models due to their simplicity.
They do this by providing a way of calculating the 'later' probability of a certain event A occurring, given some probabilities of 'earlier' events.


## Code
The exam consists of implementing the Naive Bayes classification model with the Social_Network_Ads.csv data set, using the e1071 library with the naiveBayes () function and doing an analysis of the graphs

```R
setwd("C:/")
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
We indicate where our csv file is and we create a new dataset that will contain all this information, from this dataset we take only the columns that interest us, which is from 3 to 5.

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
From the dataset the Purchased column is obtained, it will contain values of 1 and 0, which tells us if it is true or false, when working with Booleans it is easier to manipulate the column.

```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
We use the caTools library to implement a 123 seed, then we divide our dataset in two, tarining_set containing the true values and test_set containing the false values.

```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Usamos la función Scale que lo que hace es centrar los valores de una matriz y escalarlas.

```R
library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'C-classification',
                        kernel = 'linear')
naiveBayes
```
The e1071 libraries will serve us to implement methods for statistical learning, for this we will use the naiveBayes method, where the formula will be equal to all the data of the purchased sample, the data will be equal to the training set, the type will be the label to predict what is C-classification and the kernel will be linear, by using 2 labels or symbols of different color.

# Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```
We create the prediction of the Y axis, where we will obtain the purchases made as a result

# Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```
In the confusion matrix, we have our real data and predictions, which in the end will give us the accuracy of the data.

# Visualising the Training set results
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
The ElemStatLearn library is used, which is the one that helps us define the colors, in the set goes training set, where X1 has the minimum set that is given the value of 1, minus 1, and the maximum is also taken giving the value of 1, X2 is given similar parameters with the difference that we give the value of 2. We create a grid that is the expansion between X1 and X2, where the columns of this grid with Age and EstimatedSalary, we create y_grid that It will be our y-axis, which contains the expansion of the X and the classifier that contains the correct predictions and errors.

In the plot the title is placed with main, with lab the legends of the axes are modified and with lim we indicate the range, where a contour is made that includes X1, X2, the matrix that has y_grid, the length of the X and that be TRUE.
The points are obtained from grid_set, which is the background of the graph with red and green colors, but to better visualize the data, other points with other shades of green and red are added.

![Rplot](https://i.imgur.com/twJe9wj.png)

The Naive Bayes model creates a curve to separate the data, the data in the red zone must be red points while the data in the green zone must be green points, but it is not an exact 100 model, it has a margin of error, so there is green data in the red zone and vice versa, there are few data that were unintentionally poorly arranged, there are several that crossed the area and because of the arrangement they have it seems that a curve is not the arrangement more optimal.

# Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3')) 
```

![Rplot01](https://i.imgur.com/ZMQQFok.png)

In Test set there is less data, that is why there are fewer errors but there is still some data in red that went too far from the red zone.