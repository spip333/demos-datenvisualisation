###################################################3
# facet demo
###################################################3
library(ggplot2)

head(heightweight)

ggplot(heightweight,
       aes(x=ageYear, y=weightLb)) +
  geom_point()+
  geom_smooth()

# subplot vertically
ggplot(heightweight,
       aes(x=ageYear, y=weightLb)) +
  geom_point()+
  facet_grid(sex ~.)

# subplot horizontaly
ggplot(heightweight,
       aes(x=ageYear, y=weightLb)) +
  geom_point()+
  facet_grid(.~sex)

# subplot 2 directional with mpg data
head (mpg)

ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point()+
  facet_grid(cyl~drv)

