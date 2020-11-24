# Practice 1 

## In practice one, we do a test of the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1. We count how many of these numbers fall between -1 and 1.


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
N numbers is the size that one wants to define, we choose the number 1000, set the counter to 0. In the cycle we define i with rnorm (function to get a random value), where we indicate the amount of random  numbers we want (N), mean which is defined as o and standart deviation (sd) as 1.

In the if loop, what we do is that while the value of i remains between -1 and 1, the counter will increase its value one by one, so we know the number of numbers that came out within this range according to the number of N. The for loop will continue until the amount of N. 

At the end, counter is divided by N to have the percentage of the times that numbers that fall in that range appearced, if it is multiplied by 100 that percentage can be seen more clearly.

The code was checked multiple times, most of the time the result stayed within 0.60 to 0.69
