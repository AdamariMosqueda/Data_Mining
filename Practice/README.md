**INDEX**

- [Practice 1](#practice-1)
- [Practice 2](#practice-2)

<div id='pr1' />

## Practice 1 
- In practice one, we do a test of the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1. We count how many of these numbers fall between -1 and 1.

[Link of practice 1](https://github.com/AdamariMosqueda/Data_Mining/blob/Unit_1/Practice/Practice%201.R)

```
N <-1000
Counter <-0

for(i in rnorm(N, mean = 0, sd = 1 ))
{
  if(i >=-1 && i <=1){
    Counter<- Counter+1
  }
}
result <-Counter/N

print (result)

mean <- result*N

```
N es el tamaño que uno quiera definir, elegimos 1000, se definió el contador a 0. En el ciclo for definimos i con rnorm (función que permite obtener un valor aleatorio), donde le indicamos la cantidad de números random que queremos (N), mean que se define como 0 y standard deviation (sd) como 1.

En el if lo que hacemos es que mientras el valor de i se mantiene entre -1 y 1, el counter aumentará su valor de uno en uno, así sabremos la cantidad de números que salieron dentro de este rango de acuerdo a la cantidad de N. El ciclo for seguirá hasta que termine la cantidad de N.

Al final se divide Counter entre N para tener el porcentaje de las veces que aparecieron números que entran en ese rango, si se multiplica por 100 se puede ver más claro ese porcentaje.

Se comprobó varias veces el código, la mayoría de las veces el resultado se quedaba dentro de 0.60 a 0.69. 



<div id='pr2' />

## Practice 2 

- In practice two, twenty functions are investigated and each one was made an example in the R language
  
[Link of practice 2](https://github.com/AdamariMosqueda/Data_Mining/blob/Unit_1/Practice/Practice%202.R)



```
#1 
x <- c(23, 76, 0, 19)
rev(x)

#2 
rm(x)

#3 
x<- c(-1, -0.5, - 0.2, 0.5, 1, 1.7, 2, 2.5, 3, 2.8, 2.3, 1.9)
plot (x)

#4 
y <- "Hello, i'm an example"
toupper(y)

#5 
tolower (y)

#6 
z <- c(1,6,5,2,7,1,4,9,3,6,1,3,7,3,1,3,5,3)
hist (z)

#7 
df <- data.frame(x = 1:5, y = c('a', 'b', 'c', 'd', 'e')) 

#8 
View(df)

#9 
nchar (y)

#10 
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
```

1.- rev(x) return "x" reversed, in te example, we defined x like "x <- c(23, 76, 0, 19)", when you
run X, it prints 23 76 0 19, when you run rev(x) it prints 19, 0, 76, 23

2.- rm(x) deletes x from "Global environment"

3.- plot (x) it plot Values of x in order.

![Imgur](https://i.imgur.com/ueTmlY6.png)

4.- toupper(y) convert y to uppercase, we defined y = "Hello, i'm an example", so when you run
toupper(y) the result is = "HELLO, I'M AN EXAMPLE"

5.- tolower(y) convert y to lowercase, using the same example of y, when you run
tolower(y) the result is ="hello, i'm an example"

6.- hist(z) makes an Histogram of the numbers frecuency from z

![Imgur](https://i.imgur.com/QZPokTa.png)

7.- df (data.frame) makes a list where all elements are the same length.

8.- You run View(df) to see the full data frame, this is what it looks the df we defined in the 7th function

![Imgur](https://i.imgur.com/EdMVxQG.png)

9.- nchar(y) numbers the characters that are in y, in this example we use the same y = "Hello, i'm an example", nchar counts spaces, commas and apostrophes so the result is 21

10.- round(r, n), indicates the number of decimal places to be used, where r is the number we have and n the number of decimal places, we defined r=4.09245 and n =2, the result is 4.09
