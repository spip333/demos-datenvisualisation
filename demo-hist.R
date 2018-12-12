###################################
### example histogrammes
###################################

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

     