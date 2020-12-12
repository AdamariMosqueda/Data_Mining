 # Exam 

## Naive Bayes
En un sentido amplio, los modelos de Naive Bayes son una clase especial de algoritmos de clasificación de Aprendizaje Automatico, o Machine Learning, tal y como nos referiremos de ahora en adelante. Se basan en una técnica de clasificación estadística llamada “teorema de Bayes”.


En ellos se asume que las variables predictoras son independientes entre sí. En otras palabras, que la presencia de una cierta característica en un conjunto de datos no está en absoluto relacionada con la presencia de cualquier otra característica.
Proporcionan una manera fácil de construir modelos con un comportamiento muy bueno debido a su simplicidad.
Lo consiguen proporcionando una forma de calcular la probabilidad ‘posterior’ de que ocurra un cierto evento A, dadas algunas probabilidades de eventos ‘anteriores’.


## Code
El examen consiste en implementar el modelo de clasificación Naive Bayes con el conjunto de datos Social_Network_Ads.csv, utilizando la librería e1071 con la función naiveBayes() y hacer un análisis de las gráficas

```R
setwd("C:/")
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
Indicamos en dónde esta nuestro archivo csv y creamos un nuevo dataset que va a contener toda esta información, de este dataset tomamos solo las columnas que nos interesan que es desde la 3 hasta la 5.

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
Del dataset se obtiene la columna Purchased, esta contendra valores de 1 y 0, que nos dice si es verdadero o falso, al trabajar con booleanos es mas sencillo manipular la columna.

```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Usamos la librería caTools para implantar una semilla 123, entonces se hace la división de nuestro dataset en dos, tarining_set que contiene los valores verdaderos y test_set que contiene los valores falsos.

```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Usamos la función Scale que lo que hace es centrar los valores de una matriz y escalarlas.

```R
library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'C-classification',
                        kernel = 'linear')
naiveBayes
```
Las librerias de e1071, nos servira para implementar metodos para el apredizaje estadistico, para esto usaremos el metodo de naiveBayes, donde la formula sera igual a todos los datos de la muestra purchased, el data sera igual al conjunto de entrenamiento, el tipo sera la etiqueta para predecir que es C-classification y el kernel sera linear, por el uso de 2 etiquetas o los simbolos de color diferente.

# Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```
Creamos la prediccion del eje Y, donde obtendremos como resultado las compras realizadas

# Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```
En la matriz de confusion, tenemos nuestros datos reales y las predicciones, que al final nos dara como resultado la exactitud de los datos

# Visualising the Training set results
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![Rplot](https://i.imgur.com/twJe9wj.png)

# Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3')) 
```

![Rplot01](https://i.imgur.com/ZMQQFok.png)