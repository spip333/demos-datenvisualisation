###################################
### example histogrammes
###################################

# Demo histogram with basic R
hist(AirPassengers)

hist(AirPassengers, 
     main="Histogram for Air Passengers", 
     xlab="Passengers", 
     border="blue", 
     xlim=c(100,700),
     col=c("green", "blue"),
     las=1, 
     breaks=5,
     prob = T)

hist(mtcars$gear, col = c("blue", "red", "green", "yellow"))

# Demo histogram with ggplot2

library(ggplot2)

chol <- read.table(url("http://assets.datacamp.com/blog_assets/chol.txt"), header = TRUE)     
str(chol)


qplot(chol$AGE, geom="histogram")

qplot(chol$AGE, 
      geom="histogram",
      binwidth=0.5,
      main="Histogram of Age",
      xlab="Age",
      fill=I("blue"),
      col=I("red"),
      alpha=I(.9),
      xlim=c(20, 50))

ggplot(data=chol, aes(chol$AGE)) + geom_histogram()

ggplot(data=chol, aes(chol$AGE))+ geom_histogram(breaks=seq(20, 50, by=2),
                                                 col="red",
                                                 fill="green",
                                                 alpha="0.2")

ggplot(data=chol, aes(chol$AGE))+ geom_histogram(breaks=seq(20, 50, by=2),
                                                 col="red",
                                                 aes(fill=..count..))

ggplot(data = chol, aes(chol$AGE)) +
  geom_histogram(breaks = seq(20, 50, by = 2),
                 col = "red",
                 aes(fill = ..count..)) +
  scale_fill_gradient("Count", low = "green", high = "red")
