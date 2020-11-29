## What is the grammar of graphics?
The basic idea: independently specify the building blocks and combine them to create almost any type of graphical display you want.

The building blocks of a chart include:

* Data
* Aesthetic mapping
* Statistical transformations
* Scales
* Coordinate system
* Position adjustments
* Appearance
* Geometric object

## The configuration (aes)

The argument is () is synonymous with aesthetics, ggplot2 considers the X and Y axis of the graph to be aesthetic, along with the color, size, shape, fill, etc. You can add any aesthetic you want inside the es () argument, such as indicating the X and Y axes, specifying the respective variables of the data set. The variable based on which the color, size, shape and stroke should change can also be specified here. You must bear in mind that the aesthetics specified here will be inherited by all the geom layers that were added later.

We specify both X and Y axes, which will now be fixed on all layers.

```
ggplot(diamonds,aes(x=carat, y=price))
```

![Screenshot_20201122_124739](https://i.imgur.com/0SwREFv.png)

### The layers (geom)

The layers of ggplot2 are also called geom. Once the base setup is done, the geoms can be added on top of each other.

Alternatively, you can specify aesthetics within the geom layer, as shown below.

```
ggplot(diamonds)+geom_point(aes(x=carat, y=price, color=cut))+geom_smooth(aes(x=carat, y=price, color=cut))
```
![Screenshot_20201122_124433](https://i.imgur.com/aipbzBw.png)

## Las etiquetas (labs)

Las Etiquetas ayudan a visualizar lo que queremos representar en un gráfico. Las más comunes son el título principal del gráfico, los títulos de los ejes y las leyendas. Para ello utilizamos la capa labels, destinada a especificar las etiquetas. Sin embargo, la manipulación del tamaño, el color de las etiquetas es trabajo delthemeque veremos más adelante.

```
gg <-ggplot(diamonds,aes(x=carat, y=price, color=cut))+geom_point()+labs(title="Diagrama de puntos", x="Tamaño del diamante", y="Precio")
```

![Screenshot_20201122_125049](https://i.imgur.com/xpVEBVU.png)

## The Theme

All that remains to be specified is the size of the labels and the caption title.

Label size adjustment can be done using the theme () function setting plot.title, axis.text.x axis.text.y, which must be specified inside element_text ().

Adjusting the caption title a bit tricky. If the legend is that of a color attribute and varies based on a factor, you must set the name by usingndoscale_color_discrete (), where the color part belongs to the color attribute and discrete because the legend is based on a factor variable.

```
g1 <- gg+theme(plot.title=element_text(size=30, face="bold"),axis.text.x=element_text(size=15),axis.text.y=element_text(size=15),axis.title.x=element_text(size=20),axis.title.y=element_text(size=20))+scale_color_discrete(name="Corte del diamante")
```

![Screenshot_20201122_125332](https://i.imgur.com/B8oNLXe.png)

## The aspect (facet)

In the graph above, we saw a scatter plot for all the different cutoff values ​​plotted on the same graph. If what we prefer is to see a graph separated by groups (e.g. for each of the cut types) we must use the facet_wap ​​(formula) option.

facet_wrap (formula) takes a formula as an argument. The elements that we place on the right correspond to the columns, and those that we place on the left define the rows.

```
gg1
+facet_wrap(~cut, ncol=3)
```

![Screenshot_20201122_125652](https://i.imgur.com/w858jfE.png)
