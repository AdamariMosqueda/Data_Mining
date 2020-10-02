#Practice 2: R Functions

#1 rev(x), return "x" reversed
x <- c(23, 76, 0, 19)
x
#When you run X, it prints 23 76 0 19
rev(x)
#When you run rev(x), it prints 19 0 76 23

#2 rm(x), remove x from the environment
rm(x)
#When you run rm(x), x desapears from "Global environment"

#3 plot (x), plot Values of x in order.
x<- c(-1, -0.5, - 0.2, 0.5, 1, 1.7, 2, 2.5, 3, 2.8, 2.3, 1.9)
plot (x)

#4 toupper(y), convert y to uppercase.
y <- "Hello, i'm an example"
toupper(y)

#5 tolower(y) Convert y to lowercase.
tolower (y)

#6 hist(z), makes an Histogram of the numbers frecuency from z
z <- c(1,6,5,2,7,1,4,9,3,6,1,3,7,3,1,3,5,3)
hist (z)

#7 data.frame, makes a list where all elements are the same length.
df <- data.frame(x = 1:5, y = c('a', 'b', 'c', 'd', 'e')) 

#8 View(df) See the full data frame
View(df)

#9 nchar(y), number of characters in y.
nchar (y)

#10 round(r, n), indicates the number of decimal places to be used.
r <- 4.09245
round(r, 2)
