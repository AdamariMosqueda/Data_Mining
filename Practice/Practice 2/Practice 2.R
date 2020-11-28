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

#11 Function outer, add array x elements with array y
x <- c(1,2,3,4,5,10,20,30,50)
y <- c(5,10)
outer(x,y, "+")

#12 Function Unique, this function remove duplicated elements from a vector
z <- c(2:8,4:10) 
z
unique(z)

#13 Function t, this function transposes a matrix 
t(x)
x <- matrix(1:9,3,3)
class(x)

#14 Function toString, this function produces a single character string describing
x <- c("Dog","Cat","Bird")
toString(x)
toString(x, width=5)

#15 Function abs, this function computes the absolute values of numeric data
x <- c(-10,2,71,-7,4,-8,69)
abs(x)

#16 Function exp, this function compute the exponential value of a number or number vector
x <- 5
exp(x)

#17 Function diag, this function extracs or replace the diagonal of a matrix
diag(1,3,4)
diag(10,3,4)

#18 Function charmatch, this function find matches between two arguments
charmatch("at",c("dog","cat","fish","rabbit"))

#19 Function nchar, this function determines the size of each elements of an character vector
x <- c("dog","cat","fish","rabbit")
nchar(x)

#20 Function factorial, this function computes the factorial
x <- 5
factorial(x)

factorial(2)