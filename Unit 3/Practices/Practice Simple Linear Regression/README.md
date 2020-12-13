# Practice Simple Linear Regression

```R
getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/SimpleLinearRegression")
getwd()
```

## Importing the dataset
```R
dataset <- read.csv('Salary_Data.csv')
```

## Splitting the dataset into the Training set and Test set

```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
## Fitting Simple Linear Regression to the Training set
```R
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)
summary(regressor)
```

## Predicting the Test set results
```R
y_pred = predict(regressor, newdata = test_set)
```

## Visualising the Training set results

We will use the ggplot2 libraries, where we will make a ggplot, we will use the geom_point, on the X axis we will use the data from training_set, where we only want to show the YearsExperience data, on the Y axis of the training_set data, we will only use the Salary

In the geom_line, we will have the training_set data on the X axis, where we will only use YearsExperience and on the Y axis, we will use a prediction where the regressor and newdata would be equal to the training_set data

As the main title of the graph we will put Salary vs Experience (Training Set), the title of the X axis we will put Years of experience and on the Y axis Salary

```R
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```

![Rplot](https://i.imgur.com/dp750v1.png)

## Visualising the Test set results

We will use ggplot, we will use the geom_point, on the X axis we will use the data from test_set, where we only want to show the data from YearsExperience, on the Y axis of the test_set data, we will only use the Salary

In the geom_line, we will have the training_set data on the X axis, where we will only use YearsExperience and on the Y axis, we will use a prediction where the regressor and newdata would be equal to the training_set data

As the main title of the graph we will put Salary vs Experience (Test Set), the title of the X axis we will put Years of experience and on the Y axis Salary

```R
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```

![Rplot01](https://i.imgur.com/Jc4aZcH.png)
