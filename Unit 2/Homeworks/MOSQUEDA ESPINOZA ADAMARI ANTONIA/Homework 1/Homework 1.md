# Grammar of Graphics
## Introduction  

A graph is the written representation, generally numerical, of some type of information about reality. All knowledge processes collect information that can be translated into mathematical language in the form of a graph.

Grammar is called the science whose object of study is the components of a language and their combinations. It can be defined as the group of principles, rules and precepts that govern the use of a particular language.

## Grammar of Graphics
Of the many systems that R has for making graphs, ggplot2 is one of the most elegant and versatile. This is because ggplot2 implements a consistent system for describing and building graphs, known as the graphing grammar. With ggplot2 you can do more things in less time, learning a single system and applying it in different areas.

Although it also has some limitations since it is not possible to make three-dimensional or interactive graphics.
The basic idea: independently specify the building blocks and combine them to create almost any type of graphical display you want. The building blocks of a chart include:
- Data
- Aesthetic mapping
- Statistical transformations
- Scales
- Coordinate system
- Position adjustments
- Appearance
- Geometric object

### aes
The aes () argument is synonymous with aesthetic, ggplot2 considers the X and Y axis of the graph to be aesthetic, along with the color, size, shape, fill, etc. You can add any aesthetic you want inside the aes () argument, such as indicating the X and Y axes, specifying the respective variables of the data set.

### geom
The layers of ggplot2 are also called geom. Once the base setup is done, the geoms can be added on top of each other.

Example

```R
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth()
```
![Imgur](https://imgur.com/dk1slFM.png)

### labs
Labs tags help to visualize what we want to represent in a graph. The most common are the main chart title, axis titles, and legends. For this we use the labels layer, intended to specify the labels

### themes
Label size adjustment can be done using the theme () function by setting plot.title, axis.text.x and axis.text.y, which must be specified inside element_text (). Adjusting the caption title is a bit tricky. If the legend is that of a color attribute and varies based on a factor, you must set the name using scale_color_discrete (), where the color part belongs to the color attribute and is discrete because the legend is based on a factor variable.

Example
```R
gg1 <- gg +
theme(plot.title=element_text(size=30, face="bold"),
axis.text.x=element_text(size=15),
axis.text.y=element_text(size=15),
axis.title.x=element_text(size=20),
axis.title.y=element_text(size=20)) +
scale_color_discrete(name="Corte del diamante")
```
![Imgur](https://imgur.com/VVYFCpH.png)

- scale_shape_discrete (name = "legend title"): If the legend shows a shape attribute based on a factor variable.
- scale_shape_continuous (name = "legend title"): If it is a shape attribute based on a continuous variable.
- scale_fill_continuous (name = "legend title"): If based on a fill attribute on a continuous variable.

If we introduce theme (legend.position = "none"), the legend can be removed. Using theme (legend.position = "top") you can move the legend around the plot. For example, we can set it to the top margin ('top'). By setting legend.position to a coordinate within the plot, the legend can be placed within the chart. Legend.justification denotes the anchor point of the legend, that is, the point that will be placed at the coordinates given by legend.position .

### facet_wrap
If what we prefer is to see a graph separated by groups, we must use the option facet_wap ​​(formula). facet_wrap (formula) takes a formula as an argument. The elements that we place on the right correspond to the columns, and those that we place on the left define the rows.

Example
```R
gg1 + facet_wrap( ~ cut, ncol=3)
```
![Imgur](https://imgur.com/al5sbyM.png)

## Conclusion 
The grammar of the graphs what it does is give a better format to the graphs, just showing the information is not enough, the legends and titles must be adequate for the people who are going to represent this information

## References
> Anonymous author. (----). Gráfica. November, 2020, from QueSignificado Web site: https://quesignificado.com/grafica/

> Pérez, J. & Merino, M. (2008). Definición de gramática. November, 2020, from Definición Web site: https://definicion.de/gramatica/

> Grolemund, G & Wickham, H. (----). Visualización de datos. November, 2020, from r4ds Web site: https://es.r4ds.hadley.nz/visualización-de-datos.html

> https://www.maximaformacion.es/wp-content/themes/maximaformacion/img/Tema2_ggplot2.pdf
