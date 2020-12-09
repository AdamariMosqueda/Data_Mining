```R
 getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/LogisticRegression")
getwd()
```
# Importing the dataset
```R
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]
```
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
# Feature scaling
```R
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```
# Fitting Logistic Regression to Training set
```R
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```
# Predicting the Test set results
```R
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```

# Making the Confusion Metrix
```R
cm = table(test_set[, 3], y_pred)
cm
```

# 
```R
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

```

# Visualization the Training set result
# install.packages('ElemStatLearn') No work for me, 
# manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20	12M
# Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

Using the ElemStatLearn library and using the training_set data, we will make two sequences, followed by the use of the grid_set, where we will compare the previous sequences, we will combine Age and EstimatedSalary to form a vector.

In the prob_set, they will use the prediction data, where the classifier will be used, the type will be response and in the newdata it will be equal to the data of the grid_set.

In y_grid, an ifelse will be used, with the condition that the probability must be greater than 0.5, 1, 0.

In the plot, the main name of the graph will be Logistic Regression (Training set), on the X axis, it will have the name Age and on the Y axis the Estimated Salary, as a range we will have on the X axis its range will be the size of the sequence X1 and on the Y axis its range will be the size of sequence X2.

With contour we will create the graph, where we use the data of the sequence X1 and X2, in a matrix we will have the data of the prediction (y_grid) and the total of the sequences X1 and X1.
The points are those that will be shown in the graph, in the first one we have if they have bought they will be in green, followed by those who did not buy they will be red

```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

![Rplot](https://i.loli.net/2020/12/10/kF3g7WiSRc9BwOs.png)

# Visualising the Test set results

Using the ElemStatLearn library and using the test_set data, we will make two sequences, followed by the use of the grid_set, where we will compare the previous sequences, we will combine Age and EstimatedSalary to form a vector.

In the prob_set, they will use the prediction data, where the classifier will be used, the type will be response and in the newdata it will be equal to the data of the grid_set.

In y_grid, an ifelse will be used, with the condition that the probability must be greater than 0.5, 1, 0.

In the plot, the main name of the graph will be Logistic Regression (Test set), on the X axis, it will have the name Age and on the Y axis the Estimated Salary, as a range we will have on the X axis its range will be the size of the sequence X1 and on the Y axis its range will be the size of sequence X2.

With contour we will create the graph, where we use the data of the sequence X1 and X2, in a matrix we will have the data of the prediction (y_grid) and the total of the sequences X1 and X1.
The points are those that will be shown in the graph, in the first one we have if they have bought they will be in green, followed by those who did not buy they will be red

```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![Rplot01](https://i.loli.net/2020/12/10/5LUfS2PJbNDt7R4.png)