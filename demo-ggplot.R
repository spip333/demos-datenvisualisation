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

# Simple Example: lineplot
x4 <- c(11, 13, 31, 41, 45, 55, 59, 68)
y4 <- c(19, 22, 33, 45, 58, 60, 62, 74)
df4 <- data.frame(x4, y4)
ggplot(df4, aes(x=df4$x4, y=df4$y4))+ geom_line()


### Toothgrowth
# Linienplot mit 2 Variables
tg <- ToothGrowth %>% 
  group_by(supp,dose) %>% 
  summarise(length= mean(len))

# Erstellen Sie zur Beantwortung der Untersuchungsfrage
# einen Linien-Plot mit der Dosis auf der x-Achse (dose) und 
# der Länge der Zähne auf der y-Achse (length)
# Stellen Sie den Linienverlauf nach Verabreichungsmethode farblich dar (colour=supp)
ggplot(tg,aes(x=dose, y=length, colour=supp)) +
  geom_line()

# Erstellen Sie  den selben Linien-Plot, der die Verabreichungsmethode über unterschiedliche
# Linientypen darstellt (linetype) anstatt über Farben
# Zeichnen Sie zusätzlich zu den Linien alle Messpunkte in die Grafik ein
ggplot(tg,aes(x=dose, y=length, linetype=supp)) + 
  geom_line() + 
  geom_point()

# Barplot
library(gcookbook)
# Erstellen Sie einen Barplot, der auf der X-Achse die Information zum Datum enthält, 
# an welchem der Versuchs-Kohl gepflanzt wurde (Date), das mittlere Gewicht auf der y-Achse (Weight) 
# sowie die unterschiedlichen Kultivierungsmethoden (Cultivar) farblich aufzeigt (fill=)
# Hat die Kultivierungsmethode einen Einfluss auf das mittlere Gewicht der untersuchten Kohle?
# Achtung 1: damit balken entsprechend der Werte im Datensatz abgebildet werden
# ist die option stat="identity" nötig. 
# Achtung 2: Ohne position="dodge" wird ein gestapelter Barplot gezeigt.

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar))+ 
  geom_bar(stat="identity")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar))+ 
  geom_bar(stat="identity", position="dodge")


###################
# Scatterplots mit 3 Variablen
# 2 kontinuierliche Variablen und eine Gruppenvariable 

# Daten: heightweight - Height and weight of schoolchildren
heightweight
help("heightweight")
str(heightweight)
head(heightweight)

# Ausgangspunkt ist der im vorangehenden Skript erstellte Scatterplot, 
# der Grösse und Alter der Schulkinder plottet
ggplot(heightweight, aes(x=ageYear,y=heightIn)) +
  geom_point()

# Wie sieht der Plot aus, wenn Geschlechterunterschiede (sex) farblich abgebildet werden (colour=)? 
# Ist der Zusammenhang von Alter und Grösse für Mädchen und Jungs anders?
ggplot(heightweight, aes(x=ageYear,y=heightIn, colour=sex)) +
  geom_point()

# Ergänzen Sie den Plot mit einem stat_smooth(method=loess)
# Damit werden Linien mit lokaler Anpassung an die Daten angezeigt, 
# um den Zusammenhang von Alter und Grösse für Mädchen und Jungs unterschieden darzustellen
ggplot(heightweight, aes(x=ageYear,y=heightIn, colour=sex)) +
  geom_point() +
  stat_smooth(method=loess)


###################
# Plots mit drei kontinuierlichen Variablen möglich?
# Bubble-Chart/Ballon-Chart, eine Erweiterung des Scatterplots

## Daten: countries - Health and economic data about countries around the world from 1960-2010
library(gcookbook)
str(countries)
help(countries)
head(countries)

# Die Daten werden eingegrenzt - nur 2009
countsub<-filter(countries, Year==2009)

# Zeilen mit fehlenden Werten und die Variable laborrate[5] werden gelöscht)
countsub<-countsub %>%
  na.omit() %>%
  select(-laborrate)

countsub

# Wie ist der Zusammenhang zwischen Kindersterblichkeit(infmortality), 
# Gesundheitsausgaben (healthexp) und dem Bruttosozialprodukt (GDP)?
# Erstellen Sie zur Beantwortung dieser Frage einen Bubble-Chart 
# mit den Gesundheitsausgaben auf der x-Achse, der Kindersterblichkeit 
# auf der y-Achse und dem Bruttosozialprodukt visualisiert über die Grösse der Punkte
# über aes(size=)
head(countsub)
ggplot(countsub, aes(x=healthexp, y=infmortality, size=GDP))+
  geom_point()

# Wenn man die Kreise etwas grösser zeichen will, 
# muss die Skalierung von size angepasst werden (scale_size_area(max_size=))
head(countsub)
ggplot(countsub, aes(x=healthexp, y=infmortality, size=GDP))+
  geom_point() +
  scale_size_area(max_size=15)
