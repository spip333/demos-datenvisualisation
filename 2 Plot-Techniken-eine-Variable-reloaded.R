################################################################
## Skript:      2 - Plot-Techniken-eine-Variable
## Studiengang: CAS Datenanalyse HS 18
## Modul:       Graphische Datenexploration und Datenvisualisierung  
## Lernziele:   (1) Univariate Techniken der Datenexploration mit R
##              (2) Unterschiede konventionelle Plot-Methode und ggplot erkennen 
##              (3) Kernelemente von ggplot kennenlernen (daten, aes und geom_)
##      
####################################

## Libraries
library(ggplot2)

###
# Daten - Motor Trend Car Road Tests - mtcars
# Führen Sie eine erste Datenbegutachtung durch, damit Sie eine grundlegende Vorstellung
# der verwendeten Daten haben
help(mtcars)
head(mtcars)

###############
# Balken-Diagramme

# Erstellen Sie ein Balken-Diagramm für die Zylinderzahl mit der konventionellen Plot Funktion
# Man beachte: es ist nötig, eine Häufigkeitsauszählung (mit table) einzuweben
tab <- table(mtcars$cyl)
barplot(tab)

# Erstellen Sie ein Balken-Diagramm mit ggplot 
# Übergeben Sie die Varialbe cyl einmal als kategoriales Merkmal (factor) 
# und einmal als kontinuierliches Merkmal (numeric)

# Mit Zylinder als kategorialem Merkmal
ggplot(mtcars, aes(x=factor(cyl)))+
  geom_bar()

# Mit Zylinder als kontinuierlichem Merkmal
ggplot(mtcars, aes(x=mtcars$cyl))  +
  geom_bar()

# alternative perso : fill color.
ggplot(mtcars, aes(x=mtcars$cyl))  +
  geom_bar(fill="red")

# alternative perso.
df <- as.data.frame(mtcars$cyl)
colnames(df) <- "cyl"
ggplot(df, aes(cyl, col="red", ) )  +
  geom_bar()

###############
# Kuchendiagramme

# Zeichnen Sie ein Kuchendiagram mit der konventionellen Plot Funktion
# Auch hier ist nötig, eine Häufigkeitsauszählung einzuweben
plot(mtcars$cyl)
pie(table(mtcars$cyl), col=c("blue", "green", "red"))

## In ggplot gibt es keine direkte Umsetzung eines Kuchendiagrammes, weil Hadley Wickham, wie viele andere Statistiker
## glaubt, dass Kuchendiagramme ungenau sind


###############
# Histogramme
# http://www.r-bloggers.com/how-to-make-a-histogram-with-basic-r/

# Untersuchen Sie die Verteilung der Variable mpg (miles per gallon)
# Die Variable gibt Auskunft zum Benzinverbrauch
# (eine Meile ~1.6 KM, eine Gallone ~ 3.8 liter)
head(mtcars$mpg)

sorted <- sort(mtcars$mpg)
head(sorted)

plot(sorted)
# Erstellen Sie ein Histogramm mit der konventionellen Plot Funktion
# In welche Kategorie fallen am meisten Fahrzeuge?
hist(mtcars$mpg)

# Verändern Sie die Zahl der Klassen über die Option breaks 
# Wie sieht das Histogram aus mit 5,7,10 Unterteilungen aus?
# Ändert sich etwas in Bezug auf die Aussage, welch Kategorie von Benzinverbrauch am häufigsten vorkommt?
hist(mtcars$mpg, breaks = 10)

# Erstellen Sie ein Histogramm mit ggplot
# Wie geht ggplot bei der Bestimmung der Breite der Intervalle vor?
ggplot(mtcars, aes(x=mpg))+
  geom_bar()

# Mit ggplot lässt sich die Breite der Klassen bspw. über "binwidth" steuern 
# Justieren Sie die Intervallbreite so, dass sie ungefähr der Einteilung von breaks=10
#mit der konvetionellen Plot-Funktion entspricht.
ggplot(mtcars, aes(x=mpg))+
  geom_histogram(
    binwidth =2,
    aes(fill=..count..))

###############
# Boxplot
# 

# Erstellen Sie ein Boxplot für die Pferdestärke (hp=horsepower) mit der konventionellen Plotfunktion
boxplot(mtcars$hp, main="boxplot")

# Erstellen Sie ein Boxplot für die Pferdestärke (hp=horsepower) mit ggplot
ggplot(mtcars, aes(x="", y=hp)) + 
  geom_boxplot()

# perso: boxplot with hp as function of the number of cyls
ggplot(mtcars, aes(x=cyl, y=hp, group=cyl)) + 
  geom_boxplot()

hist(mtcars$cyl)

# Hinweis: geom_boxplot braucht eine Spezifikation für das x-aes (bspw. x="")

# Gibt es ein Auto, dass aufgrund der Daten als Ausreiser bezeichnet werden kann? 
# Um welches Auto handelt es sich?


ggplot(data=mtcars, aes(x=factor(""),y=hp))+
  geom_boxplot()+
  geom_text(data=mtcars[mtcars$hp>300,],label=rownames(mtcars[mtcars$hp>300,]))













