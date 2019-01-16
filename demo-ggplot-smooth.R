###################################################3
# ggplot smooth demo
###################################################3
library(ggplot2)

head(heightweight)

ggplot(heightweight,
       aes(x=ageYear, y=weightLb)) +
  geom_point()+
  geom_smooth()