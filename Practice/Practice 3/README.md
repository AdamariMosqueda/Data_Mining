# Practice 3

## In practice three, we did an exercise pretending to be data scientists to obtain the financial status of the organization


> Data
```
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```

> Calculate Profit As The Differences Between Revenue And Expenses
```
profit <- revenue - expenses
profit
```

> Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
```
tax <- round(0.30 * profit, 2)
tax 
```

The round function is to reduce the decimal places, it receives two values, the number to print or the result of an operation and the second is the number of decimal places to be printed.

> Calculate Profit Remaining After Tax Is Deducted
```
profit.after.tax <- profit - tax
profit.after.tax
```

> Calculate The Profit Margin As Profit After Tax Over Revenue. Round To 2 Decimal Points, Then Multiply By 100 To Get %
```
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin
```

> Calculate The Mean Profit After Tax For The 12 Months
```
mean_pat <- mean(profit.after.tax)
mean_pat
```
The good.months variable was created, with which the profit must be greater than the average, in order to see the months with the best profit
> Find The Months With Above-Mean Profit After Tax
```
good.months <- profit.after.tax> mean_pat
good.months
```
The reverse part was done, instead of seeing the good months, now the bad months will be seen, using the sign ! which must be different
> Bad Months Are The Opposite Of Good Months !
```
bad.months <- !good.months
bad.months
```

To see the best month, a new variable was created which is best.month, here the results are equalized, until the largest of all comes out
> The Best Month Is Where Profit After Tax Was Equal To The Maximum
```
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```
Here the inverse part will be shown, instead of seeing the best month in profit after tax, a new variable is created called Worst.month, in which we will do the following, if the profit after tax is equal to the minimum of the profit after tax
> The Worst Month Is Where Profit After Tax Was Equal To The Minimum
```
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```
we will create a new variable for each data we want to obtain, with round, we will round the numbers and within the parentheses we will divide by a thousand and with zero we will not show the decimals
> Convert All Calculations To Units Of One Thousand Dollars
```
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(round / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)
```
We print the variables
> Print Results
```
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```
With rbind, we join all our data to make a matrix
> BONUS:
Preview Of What's Coming In The Next Section
```
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
```

> Print The Matrix
```
M
```