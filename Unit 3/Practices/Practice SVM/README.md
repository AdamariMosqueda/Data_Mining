# SMV

## Graph 1: Training set
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
```
The ElemStatLearn library is used, which is the one that helps us define the colors, in the set goes training set, where X1 has the minimum set that is given the value of 1, minus 1, and the maximum is also taken giving the value of 1, X2 is given similar parameters with the difference that we give the value of 2. We create a grid that is the expansion between X1 and X2, where the columns of this grid with Age and EstimatedSalary, we create y_grid that It will be our y-axis, which contains the expansion of the X and the classifier that contains the correct predictions and errors.

```R
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
In the plot the title is placed with main, with lab the legends of the axes are modified and with lim we indicate the range, where a contour is made that includes X1, X2, the matrix that has y_grid, the length of the X and that be TRUE.
The points are obtained from grid_set, which is the background of the graph with red and green colors, but to better visualize the data, other points with other shades of green and red are added.

![Imgur](https://imgur.com/4rOHH8k.png)

SMV accommodates the display by a diagonal, where the red points must go in the red zone and the green points go in the green zone, there are many errors near the line that separates both zones, but in the green zone there are some red points they move away from that line, he tried to make the separation of the sets as it should be but there are some that went too far from the real result.

## Graph 2: Test set
```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
```
Now the same configuration is done for test_set to check its accuracy with the predictions.

```r
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![Imgur](https://imgur.com/SJE27Pt.png)

Test has fewer results than training, the green points that crossed the zone are very close to the line and even as in the previous graph, a number of green points have the same behavior, they are almost together in the red zone, and the points Reds that crossed into the green zone are also very far from the line.
