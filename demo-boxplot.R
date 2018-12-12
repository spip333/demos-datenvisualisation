###################################
### example boxplot
###################################

# Erstellen Sie ein Boxplot für die Pferdestärke (hp=horsepower) mit der konventionellen Plotfunktion
boxplot(mtcars$hp, main="boxplot")

# Erstellen Sie ein Boxplot für die Pferdestärke (hp=horsepower) mit ggplot
ggplot(mtcars, aes(x="", y=mtcars$hp)) + geom_boxplot()
