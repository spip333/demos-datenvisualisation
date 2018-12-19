###################################################3
# Corrplot demo
###################################################3

library(corrplot)
mcor <- cor(mtcars)
corrplot(mcor)
help(corrplot)

# Ergänzen Sie die corrplot mit der Option addCoef.col = "black"
corrplot(mcor, addCoef.col = "black")

# Mit "number.cex" justiert die Textgrösse 
corrplot(mcor, addCoef.col = "black", number.cex = .9)