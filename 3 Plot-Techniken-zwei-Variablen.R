################################################################
## Skript:      3 - Plot-Techniken-zwei-Variablen
## Studiengang: CAS Datenanalyse HS 18
## Modul:       Graphische Datenexploration und Datenvisualisierung  
## Lernziel:    1) Bivariate Techniken der Datenexploration mit R oder Visualisierungen mit zwei Variablen
##              2) Erstellen von geläufigen Diagrammen: Liniendiagrammen, gruppierte Box- und Barplots und Scatterplots
##              3) Weitere Elemente der grammar of graphics und ggplot kennenlernen: statistics, themes und scales
##
####################################

rm(list = ls())


## Libraries
library(ggplot2)
library(dplyr)



#################
# Liniendiagramme
####
# Geeignet für ein kontinuierliches Merkmal (viele Ausprägungen 5+) auf der x-Achse  
# und ein kontinuierliches Merkmal auf der y-Achse (Bsp. eine Zeitreihe)

# Daten- BOD > Biochemical Oxygen Demand
# Schauen Sie sich den Datensatz an. Was wurde mit dem Datensatz untersucht? Was wurde gemessen?
help(BOD)
head(BOD)
str(BOD)
BOD

# Wie entwickelt sich die biochemische Sauerstoff-Nachfrage von Wasser über die Zeit?
# Erstellen Sie ein Liniendiagram mit der Zeit (Time) auf der x-Achse und der Sauerstoff-Nachfrage (demand) auf der y-Achse

# ggplot zeichnet Linien mit geom_line()
ggplot(data = BOD, aes(x=BOD$Time, y=BOD$demand)) +
  geom_line()


# Fügen Sie der Grafik ebenfalls die Messpunkte hinzu (mit +geom_point)
# Nur so wird ersichtlich, für welche Zeitpunkte tatsächlich Messungen vorliegen.
# Sind für alle Zeitpunkte Messdaten vorhanden?

ggplot(data = BOD, aes(x=BOD$Time, y=BOD$demand)) +
  geom_line() + 
  geom_point()


############
# Balkendiagramme 
#####

# Geeignet für ein kontinuierliches Merkmal mit wenig Ausprägungen oder ein kategoriales Merkmal auf der x-Achse
# und einem kontinuierlichem Merkmal auf der y-Achse (Bpsw. Gruppenvergleiche für wenige Beobachtungen)

# Wie sieht der BOD-Line-Plot von oben (x=Time, y=demand) mit Balken aus?


# Achtung: Die Standardeinstellung von geom_bar() ist stat="count", d.h. die Höhe der Balken wird entsprechend der Anzahl Ausprägungen je Kategorie gezeichnet. 
help(geom_bar)
# Das passt prima für eine Häufigkeitsauszählung, nicht jedoch für die Anwendung hier.
# Im vorliegenden Fall soll die Länge der Balken entsprechend der beobachtet Werte gezeichnet werden. 
# Überschreiben Sie den Standardparameter mit dem Zusatz stat="identity"


ggplot(data = BOD, aes(x=BOD$Time, y=BOD$demand)) +
  geom_bar(stat = "identity" )



######
# Boxplots 

# Sind besonders für Gruppenvergleiche von metrischen Variablen mit vielen Beobachtungen geeignet
# Nutzen Sie erneut den Auto-Datensatz (mtcars)
# Übergeben Sie die Zahl der Zylinder(cyl) als x-Wert und die PS(hp) als Y-Wert
head(mtcars)

ggplot(data = mtcars, aes(x=cyl, y=hp, group = cyl)) + 
  geom_boxplot()


# Beeinflusst die Zahl der Zylinder die PS?





###################
# Streudiagram / Scatterplot
#####

## 
# Geeignet zur Darstellung beobachteter Wertepaare zweier metrischer Variablen

# Benötigte Libraries (für die Daten)
library(gcookbook)
head(heightweight)
str(heightweight)

# Daten (heightweight): Height and weight of schoolchildren
# Machen Sie sich mit den Daten vertraut. Welche Informationen beinhaltet der Datensatz?


# Erstellen Sie einen Scatterplot mit dem Alter der Schulkinder(ageYear) auf der X-Achse 
# und dem Grösse (heightIn) auf der Y-Achse
ggplot(data=heightweight, aes(x=ageYear, y=heightIn)) +
  geom_point()

# Frage: Gibt es einen Zusammenhang zwischen dem Alter und der Grösse der Schulkinder?

# Der Zusammenhang kann  mit einer Regressionslinie veranschauchlicht werden
# Die Regressionslinie zeigt den linearen mittlere Veränderung der Grösse in Abhängigkeit des Alters
# +stat_smooth(method=lm, se=FALSE)

ggplot(data=heightweight, aes(x=ageYear, y=heightIn)) +
  geom_point() +
stat_smooth(method=lm, se=F)
  

# EXTRA zu Scatterplot
# Was geschieht, wenn viele Datenpunkte vorliegen (grosse Datensätze)?
# Die Datenpunkte überlagern (Overplotting) und 
# es wird schwierig die Verteilung der Daten in diesem Bereich zu erkennen

# Daten: diamonds Data - Prices of 50,000 round cut diamonds

# Erste Dateninspektion
diamonds
help(diamonds)
str(diamonds)
length(diamonds$carat)

# Nun zeichnen wir einen Scatterplot mit über 54'000 Datenpunkten
# Plotten Sie das Gewicht der Diamanten (carat) auf der x-Achse und 
# den Preis in US-Dollars (price) auf der y-Achse
ggplot(diamonds, aes(x=carat,y=price))+
  geom_point()

# Einige Muster werden kenntlich, Grenzen bei 1, 1.5 und 2 carat
# Insbesondere im Bereich von 0 bis 2 carat bleibt die Sache obskur

# Es besteht die Möglichkeit, die Dichte zusätzlich mit einer Farbe zu visualisieren
# Dafür wird die Funktion stat_bin2d() verwendet, die die Fläche in Rechtecke einteilt 
# und die Anzahl der Beobachtungen innerhalb eines Rechteckes farblich abbildet (ein fill-aesthetic wird eingefügt)
# Dichte ist je Bins visualisiert
ggplot(diamonds, aes(x=carat,y=price))+
  stat_bin2d(bins=50)

# Die verwendete Farbskale können wir überschreiben mit einem scale_fill_gradient-Element
ggplot(diamonds, aes(x=carat,y=price))+
  stat_bin2d(bins=50)+
  scale_fill_gradient(low="lightblue",high="red")


# Zusatz zu Skalen mit x und y Skalen   
ggplot(diamonds, aes(x=carat,y=price))+
  stat_bin2d(bins=50)+
  scale_y_continuous(position = "right")+
  scale_x_continuous(limits = c(0,1))+
  scale_fill_gradient(low="lightblue",high="red",limits=c(0,10000))+
  coord_polar()














