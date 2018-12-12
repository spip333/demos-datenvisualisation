###################################
### example ggplot
###################################

library(ggplot2)

# Simple Example 1
x <- c(10, 20, 30, 40)
y <- c(1000, 1500, 2200, 3800)
df1 <- data.frame(x, y)
n <- ggplot(df1, aes(df2$x, df2$y ))
n +geom_bar(stat = "identity")

# Simple Example 2
ggplot(mtcars, aes(x=mtcars$cyl)) + geom_bar()

