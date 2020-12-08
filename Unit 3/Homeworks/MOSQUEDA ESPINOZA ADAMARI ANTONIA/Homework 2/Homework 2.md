# SCALE
The scale () function in R is a generic function that centers and scales the columns of a numeric matrix. The central parameter takes a similar numeric vector or logical value. If the numeric vector is given, then each column in the matrix has the corresponding value of the center subtracted from it. If the logical value is TRUE, then the means of the columns in the matrix are subtracted from their corresponding columns. The scale takes a numerical or logical vector value. When a numeric-like vector is provided, then each column in the matrix is ​​divided by the corresponding value on the scale. If the logical value is provided in the scale parameter, then the centered columns of the matrix are divided by their standard deviations and the root mean square otherwise. If it is FALSE, no scale is performed on the matrix.

Example:

```R
# Create matrix 
mt <- matrix(1:10, ncol = 5) 
  
# Print matrix 
cat("Matrix:\n") 
print(mt) 
  
# Scale matrix with default arguments 
cat("\nAfter scaling:\n") 
scale(mt) 
```

The matrix goes from 1 to 10 arranged by 5 columns, when the column is printed as it is, it shows the numbers assigned to the matrix, if you decide to scale, the values ​​now change.

![Imgur](https://imgur.com/wDD0CUY.png)

As can be seen in the result, after scaling the value of 0.7071 was given as a negative and positive number, the centered columns were 1.5, 3.5, 5.5, 7.5 and 9.5 and after the operations it was concluded that the value scaled is 0.7071.

# TABLE
The table function in R -table (), performs a categorical tabulation of data with the variable and its frequency. The Table () function is also useful for creating frequency tables with conditions and crosstabs.

Some examples of use:
- Frequency table in R with table () function
- Cross table or frequency table with proportion
- Bi-directional crosstab or bi-directional frequency table together with the ratio in R
- Three-way frequency table or three-way crosstab in R.

Example:
The bidirectional crosstab was used.
```R
## cross tabulation gear * carb 
table(mtcars$gear,mtcars$carb)
```
What this example does is create a crosstab of gears and carb in the mtcars table.

![Imgur](https://imgur.com/8bmLCTG.png)

It says there are 3 cars that have carb = 1 and gear = 3 and so on.

# REFERENCES
> https://www.geeksforgeeks.org/scale-the-columns-of-a-matrix-in-r-programming-scale-function/

> https://www.datasciencemadesimple.com/table-function-in-r/
