###################################
### example histogrammes
###################################

# cf https://www.r-bloggers.com/how-to-make-a-histogram-with-basic-r/
# Demo histogram with basic R
getwd()

hist(AirPassengers)

hist(
  AirPassengers,
  main = "Histogram for Air Passengers",
  xlab = "Passengers",
  border = "blue",
  xlim = c(100, 700),
  col = c("green", "blue"),
  las = 1,
  breaks = 5,
  prob = T
)

hist(AirPassengers, las=1)

hist(mtcars$gear, col = c("blue", "red", "green", "yellow"))

#Compute a histogram for the data values in AirPassengers, and set the bins such that they run from 100 to 300, 300 to 500 and 500 to 700.
hist(AirPassengers, breaks=c(100, 300, 500, 700)) 

hist(AirPassengers, breaks=seq(0, 1000, by=100), las=2) 

hist(AirPassengers, prob= T)
lines(density(AirPassengers)) 

#####################################################################3
# Demo histogram with qplot and ggplot
library(ggplot2)

# chol <- read.table(url("http://assets.datacamp.com/blog_assets/chol.txt"), header = TRUE)
chol <- read.table(file = "chol", header = TRUE)
str(chol)

qplot(chol$AGE, geom = "histogram")

qplot(
  chol$AGE,
  geom = "histogram",
  binwidth = 0.9,
  main = "Histogram of Age",
  xlab = "Age",
  fill = I("blue"),
  col = I("red"),
  alpha = I(.1),
  xlim = c(20, 50)
)

?qplot

ggplot(data = chol, aes(chol$AGE)) +
  geom_histogram()

ggplot(data = chol, aes(chol$AGE)) +
  geom_histogram(
    breaks = seq(20, 50, by = 2),
    col = "red",
    fill = "green",
    alpha = "0.2"
  )

ggplot(data = chol, aes(chol$AGE)) +
  geom_histogram(breaks = seq(20, 50, by = 2),
                 col = "red",
                 aes(fill = ..count..))

ggplot(data = chol, aes(chol$AGE)) +
  geom_histogram(breaks = seq(20, 50, by = 2),
                 col = "red",
                 aes(fill = ..count..)) +
  scale_fill_gradient("Count", low = "green", high = "red")
