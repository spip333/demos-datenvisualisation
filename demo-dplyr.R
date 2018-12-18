# Erneut wird zuerst ein Subset für das Jahr 2009 erstellt

library(gcookbook) # Für Daten
library(GGally)
library(dplyr)
help(countries)

c2009<-countries %>%
  filter(Year==2009) %>%
  select(c(-Code,-Year))

# Daten: ToothGrowth - The Effect of Vitamin C on Tooth Growth in Guinea Pigs

# Die Studie untersucht den Effekt von Vitamin C auf die Zähne. Dafür wurden unterschiedliche
# Verabreichungsmethoden getestet (VC=ascorbic acid, OJ=orange juice)
# Sind die Zähne der Meerschweinchen in Abhängigkeit der Dosis und der Verabreichungsmethode gewachsen?

# Wir berechnen zuerst das mittleres Wachstum der Zähne der Meerschweinchen 
# nach Verabreichungsmethode(supp) und Dosis(dise) und speichern diese im Objekt tg
# ergänzen Sie dafür, untenstehenden code bei group_by()
tg <- ToothGrowth %>% 
  group_by(supp,dose) %>% 
  summarise(length= mean(len))



## Daten: countries - Health and economic data about countries around the world from 1960-2010
library(gcookbook)
str(countries)
help(countries)
head(countries)

# Die Daten werden eingegrenzt - nur 2009
countsub<-filter(countries, Year==2009)

# Zeilen mit fehlenden Werten und die Variable laborrate[5] werden gelöscht)
countsub <- countsub %>%
  na.omit() %>%
  select(-laborrate)
