###################################
### example ggplot
###################################

library(ggplot2)

# Simple Example 1
x1 <- c(10, 20, 30, 40)
y1 <- c(1000, 1500, 2200, 3800)
df1 <- data.frame(x1, y1)
n <- ggplot(df1, aes(df1$x1, df1$y1))
n + geom_bar(stat = "identity", col="red")

# Simple Example 2
ggplot(mtcars, aes(x=mtcars$cyl)) + geom_bar()

# Simple Example 3
x3 <- c(10, 20, 30, 20, 30, 30, 10, 10, 10, 20, 40)
df3 <- data.frame(x3)
ggplot(df3, aes(x=df3$x3, fill="red")) + geom_bar(stat = "count")
