##################
# Scatterplot-Demo

# Ähnlich wie eine Korrelationsmatrix visualisiert eine Scatterplot-Matrize 
# bivariate Zusammenhänge in Daten
## Daten: countries - Health and economic data about countries around the world from 1960-2010
library(gcookbook) # Für Daten
library(GGally)
library(ggplot2)

head(countries)
str(countries)

# Wir untersuchen, wie Wirtschaftswachstum (GDP), Erwerbsquote(laborrate)
# Gesundheitsausgaben (healthexp) und Kindersterblichkeit (infmortality) korrelieren

# Subset für das Jahr 2009:
c2009<-countries %>%
  filter(Year==2009) %>%
  select(c(-Code,-Year))

# Die Funktion ggpairs() ist ausgezeichnet für Scatterplot-Matrizen
# Erstellen Sie eine Scatterplot/Korrelations-Matrix aller Variablen des reduzierten 
# Datensatzes c2009 (Achtung: schliessen Sie die Variable "Name" aus (c2009[,2:5]))
ggpairs()
?ggpairs
head(c2009)
ggpairs(c2009[,2:5] )
ggpairs(c2009, columns =2:5 )
