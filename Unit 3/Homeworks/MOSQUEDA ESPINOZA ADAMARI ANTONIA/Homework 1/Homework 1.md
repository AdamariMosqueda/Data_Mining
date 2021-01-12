# Machine Learning

## What is machine learning?
Machine Learning is a scientific discipline in the field of Artificial Intelligence that creates systems that learn automatically. Learning in this context means identifying complex patterns in millions of data. The machine that really learns is an algorithm that reviews the data and is capable of predicting future behavior. Automatically, also in this context, implies that these systems are improved autonomously over time, without human intervention. Let's see how it works.

## Where is machine learning used?
>Buyer and consumer analysis

We can know based on historical data, for example, which of our customers are likely to leave and also which sales have the possibility of closing, for this it is necessary the supervised ML and include labels so that the system analyzes the past behavior of the customers that They have already left what purchases they made, they sent emails, visits to the page, calls etc. and then look for a pattern and based on that it looks for in the rest of the data what or who is repeating those behaviors.

>Company security

Through image recognition, it is possible to detect the faces of the work team, since the system is previously fed with photo or video and therefore establishes patterns of characteristics of each of the faces so that in this case it is able to identify who enters and who leaves via video.

> Piece counting in video or image

It is possible to count the pieces and if we want to, with historical analysis, know how much we have to buy and how much we will have to lose, in a matter of seconds.

> Time optimization

Determine when is the right time to do a specific task, for example, stop production, increase production, investments, reduction of budgets, etc.

> Customer service by voice and text

Words or phrases can be identified to generate the appropriate response for users, that is, if, for example, a user wanted to register or cancel a service, the system could respond to the request, which will be spoken, making it faster and more efficient.


>Information security and anti-fraud

We can increase perimeter security, since the system is able to detect the behavior of possible intruders, unlike other systems that are only fixed barriers.

## What is linear regression for?

Linear regression analysis is used to predict the value of one variable based on the value of another. The variable that you want to predict is called the dependent variable. The variable that is being used to predict the value of the other variable is called the independent variable.

> Trend lines

A trend line represents a trend in a series of data obtained over a long period. These types of lines can tell us if a particular data set has increased or decreased in a certain period.

> Medicine

In medicine, the first evidence linking mortality to tobacco smoking came from studies that used linear regression. The researchers include a large number of variables in their regression analysis in an effort to eliminate factors that could produce spurious correlations.

## Explain your observations of the linear regression plot generated in R

A dataset was split from salary, it splits the Y vector data into two sets in a predefined proportion while preserving the relative proportions of different Y labels. It is used to divide the data used during the classification into train subsets and test.
```R
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
```

What was done next was to create other datasets, one containing the True split, and the other containing the false split.
```R
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

### Graph 1
```R
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary), color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
This takes as x the years of experience inside training_set, which is the one that contains the true values, where the y axis is the salary, this is represented by points by geom_point and it is defined that the color is red, a trend line which is the one that contains the prediction to see if it is not far from reality, regressor was previously stated like this:
```
regressor = lm(formula = Salary ~ YearsExperience, data = dataset)
```
lm is used to fit linear models. It can be used to perform regressions, single-stratum analysis of variance, and analysis of covariance. You are given a formula for the prediction which is salary and years of experience and you specify where you will take the data from.
Returning to the graphing, the prediction was given the regressor and the new data that comes from training_set, the rest is to format it.

![Imgur](https://imgur.com/eXLegQ3.png)

It can be seen that the points are not very far from the trend line, which means that the predictions are not very far from reality, the closest prediction is at 5.9 years of experience, where for a moment it is seen that a piece of the circle crosses the line. There are some distant data that at first glance you cannot identify which of all is the most distant

### Graph 2
```R
ggplot() + geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary), color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
![Imgur](https://imgur.com/JET9FPT.png)

There are less data than in the first graph but it can be seen that there are some very distant values ​​and several very close ones, the closest is 3.9 years of experience and the furthest ones at first glance cannot know which is the least accurate because They are seen at a similar distance, in both situations the prediction was lower than the value it really is, compared to the previous graph they are even further from the trend line.


# References
> González, A. (----). ¿Qué es Machine Learning?. November, 2020, from cleverdata Website: 
https://cleverdata.io/que-es-machine-learning-big-data/#:~:text=Machine%20Learning%20es%20una%20disciplina,complejos%20en%20millones%20de%20datos.

> Castro, A. (2017). ¿Qué es Machine Learning y para qué sirve?. November, 2020, from inBest Website: 
https://www.inbest.cloud/comunidad/que-es-machine-learning-y-para-que-sirve

>https://es.wikipedia.org/wiki/Regresión_lineal#Aplicaciones_de_la_regresión_lineal
