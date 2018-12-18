# Erneut wird zuerst ein Subset für das Jahr 2009 erstellt

library(gcookbook) # Für Daten
library(GGally)
help(countries)

c2009<-countries %>%
  filter(Year==2009) %>%
  select(c(-Code,-Year))