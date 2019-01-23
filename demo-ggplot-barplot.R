###################################
### example ggplot barplot
###################################

library(ggplot2)

###################################
# Simple Example 1
# var 1 :  count
x1 <- c(10, 20, 30, 40,20, 30,20)
df1 <- data.frame(x1)

ggplot(df1, aes(x=df1$x1)) + 
  geom_bar()

###################################
# Simple Example 2
# var 2 : x / y 

x2 <- c(10, 20, 30, 40,20, 30,20)
y2 <- 10 * x2
df2 <- data.frame(x2,y2)

ggplot(df2, aes(x=df2$x2, y=df2$y2)) + 
  geom_bar( stat="identity")

###################################
x1 <- c(10, 20, 30, 40)
y1 <- c(1000, 1500, 2200, 3800)
df1 <- data.frame(x1, y1)
n <- ggplot(df1, aes(df1$x1, df1$y1))
n + geom_bar(stat = "identity", col="red")
