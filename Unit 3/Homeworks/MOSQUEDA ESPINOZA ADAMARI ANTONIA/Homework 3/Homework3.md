# caTools
Contains several basic utility functions including: moving (rolling, running) window statistic functions, read/write for GIF and ENVI binary files, fast calculation of AUC, LogitBoost classifier, base64 encoder/decoder, round-off error free sum and cumsum, etc.

## Example 1
```R
write.gif( volcano, "volcano.gif", col=terrain.colors, flip=TRUE, 
         scale="always", comment="Maunga Whau Volcano")
y = read.gif("volcano.gif", verbose=TRUE, flip=TRUE)
image(y$image, col=y$col, main=y$comment, asp=1)
```
![Imgur](https://imgur.com/1n792dc.png)

## Example 2
```R
#test runmin, runmax and runmed
k=25; n=200;
x = rnorm(n,sd=30) + abs(seq(n)-n/4)
col = c("black", "red", "green", "brown", "blue", "magenta", "cyan")
plot(x, col=col[1], main = "Moving Window Analysis Functions (window size=25)")
lines(runmin (x,k), col=col[2])
lines(runmed (x,k), col=col[3])
lines(runmean(x,k), col=col[4])
lines(runmax (x,k), col=col[5])
legend(0,.9*n, c("data", "runmin", "runmed", "runmean", "runmax"), col=col, lty=1 )
```
![Imgur](https://imgur.com/gYw3bYd.png)

# ElemStatLearn example
```R
#Predict the test set results 
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
y_pred = ifelse(prob_pred>0.5, 1, 0)


install.packages('ElemStatLearn'
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
![Imgur](https://imgur.com/XBEaYap.png)

# References
> https://www.rdocumentation.org/packages/caTools/versions/1.17.1/topics/caTools-package

> https://stackoverflow.com/questions/61300544/r-package-elemstatlearn-is-not-available-for-r-version-3-6-3-is-there-any-al?noredirect=1&lq=1
