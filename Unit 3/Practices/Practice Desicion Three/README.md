 # Decision Tree Classification
```R
getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/DesicionThree")
getwd()
```
# Importing the dataset
```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
# Encoding the target feature as factor
```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
# Feature Scaling
```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
# Fitting Decision Tree Classification to the Training set
# install.packages('rpart')
```R
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)
```
# Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```
# Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```
# Visualising the Training set results

Using the ElemStatLearn library and using the training_set data, we will make two sequences, followed by the use of the grid_set, where we will compare the previous sequences, we will combine Age and EstimatedSalary to form a vector.

In y_grid, we use the prediction generated earlier.
In the Plot, in the main name of the graph, we will put Decision Tree Classification (Training set), in the X axis we will put Age and in the Y axis the Estimated Salary and we will put a limit to our data of the sequences, where the data that pass this limit will be eliminated from the graph.

With contour we will create the graph, where we use the data of the sequence X1 and X2, in a matrix we will have the data of the prediction (y_grid) and the total of the sequences X1 and X1.
The points are those that will be shown in the graph, in the first one we have if they have bought they will be in green, followed by those who did not buy they will be red

![Rplot](https://i.imgur.com/nuC71KC.png)

```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# Visualising the Test set results

Using the ElemStatLearn library and using the test_set data, we will make two sequences, followed by the use of the grid_set, where we will compare the previous sequences, we will combine Age and EstimatedSalary to form a vector.

In y_grid, we use the prediction generated earlier.
In the Plot, in the main name of the graph, we will put Decision Tree Classification (Test set), in the X axis we will put Age and in the Y axis the Estimated Salary and we will put a limit to our data of the sequences, where the data that pass this limit will be eliminated from the graph.

With contour we will create the graph, where we use the data of the sequence X1 and X2, in a matrix we will have the data of the prediction (y_grid) and the total of the sequences X1 and X1.

The points are those that will be shown in the graph, in the first one we have if they have bought they will be in green, followed by those who did not buy they will be red

![Rplot2](https://i.imgur.com/rzXkOuU.png)

```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
# Plotting the tree

Here we will use the classifier data, which was previously obtained from the training_set data
We will plot a classifier and in text, we will use classifier and cex with 0.6, where is the relation with the default value

![Rplot03](https://i.imgur.com/mo5GKDD.png)

```R
plot(classifier)
text(classifier, cex=0.6)
```