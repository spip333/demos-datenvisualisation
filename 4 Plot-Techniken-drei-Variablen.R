################################################################
## Skript:      4 - Plot-Techniken-drei-Variablen
## Studiengang: CAS Datenanalyse HS 18
## Modul:       Graphische Datenexploration und Datenvisualisierung  
## Lernziele:   Techniken der Datenexploration mit R - drei Variablen
##
####################################

##
# Libraries
library(ggplot2)
library(vcd)
library(dplyr)


# Mosaic-Plot 
# zur Visualisierung von bivariaten Häufigkeitsverteilungen 
# von kategorialen Variablen


# Daten - UCBAdmissions - Student Admissions at UC Berkeley
# Machen Sie sich mit den Daten vertraut
UCBAdmissions
help("UCBAdmissions")
str(UCBAdmissions)

# UCBAdmissionss ist ein aggregierter Datensatz von Bewerbern der Universität 
# Berkley unterschieden nach Departement und Geschlecht

# Hintergrund: Von 2691 Bewerbern, wurden 1198 (44.5%) zugelassen
# Zum Vergleich: von den 1835  Bewerberinnen, wurden ledilgich 557 (30.4%) zugelassen
# Die Universität Berkley wurde entsprechend verklagt.
# Bei der Diskriminierungsklage gegen die Universität Berkeley handelt es sich 
# um ein berühmtes Beispiel zur Veranschaulichung des Simpson-Paradoxons
# https://de.wikipedia.org/wiki/Simpson-Paradoxon

# Frage: Wurden Frauen wirklich benachteiligt?


# Das Datenformat ist etwas spezieller
# (3-dimensionale Arrays sind 3-fache Häufigkeitsauszählungen. 
# Sie können mit table() erstellt werden)
# mytable <- table(A, B, C) 

# Schauen Sie sich die Daten mit ftable() an


## Ein Mosaik-Plot unterteilt die Daten der Reihenfolge der Eingabe nach
# Erstellen Sie einen Mosaik-Plot (mosaic()), der die Daten zuerst nach Zulassung (Admit) und danach nach Geschlecht (Gender) unterteilt
mosaic(~Var1+Var2,data=UCBAdmissions)

# Was können Sie aus dem Mosaik-Plot in Bezug 
# auf die Zulassungspraktiken nach Geschlecht ablesen?


# Nun nehmen Sie als dritte Variable die Departemente hinzu +Dept
## Was wird ersichtlich, wenn wir die Daten zuerst nach Deptartement splitten?
mosaic(~Var1+Var2+Var3,data=UCBAdmissions)

## Zusätzliche optische Unterstützung gibt es mit den Optionen highlighting und direction
## Highlighting hebt Ausprägungen einer Variable farblich hervor
## direction gibt an in welche Richtung die Splitt's erfolgen v=vertical, h=horizontal
## Heben Sie die Geschlechter farblich hervor mit folgendem Code-Schnippsel
## highlighting = "Gender",highlighting_fill=c("lightblue","pink"), direction=c("v","v","h")
## Testen Sie die Darstellungsmöglichkeiten indem Sie die Parameter "v" und "h" austauschen.
mosaic(~Var1+Var2+Var3,data=UCBAdmissions,
       highlighting = "",highlighting_fill=c("",""),
       direction=c("","",""))


## Fällt Ihnen etwas auf bezüglich Zulassung nach Geschlecht?





#################### 
# Mehrere Linien in einem Plot
# eignen sich für ordinale Variable auf der x-Achse, kontinuierliche auf der y-Achse + nominale Variable (Gruppe) 

# Daten: ToothGrowth - The Effect of Vitamin C on Tooth Growth in Guinea Pigs
help(ToothGrowth)

# Die Studie untersucht den Effekt von Vitamin C auf die Zähne. Dafür wurden unterschiedliche
# Verabreichungsmethoden getestet (VC=ascorbic acid, OJ=orange juice)
# Sind die Zähne der Meerschweinchen in Abhängigkeit der Dosis und der Verabreichungsmethode gewachsen?

# Wir berechnen zuerst das mittleres Wachstum der Zähne der Meerschweinchen 
# nach Verabreichungsmethode(supp) und Dosis(dise) und speichern diese im Objekt tg
# ergänzen Sie dafür, untenstehenden code bei group_by()
tg<-ToothGrowth%>% 
  group_by(xx,xx) %>% 
  summarise(length= mean(len))


# Erstellen Sie zur Beantwortung der Untersuchungsfrage
# einen Linien-Plot mit der Dosis auf der x-Achse (dose) und der Länge der Zähne auf der y-Achse (length)
# Stellen Sie den Linienverlauf nach Verabreichungsmethode farblich dar (colour=supp)
ggplot(tg,aes()) +
  geom_line()


# Erstellen Sie  den selben Linien-Plot, der die Verabreichungsmethode über unterschiedliche Linientypen darstellt (linetype) anstatt über Farben
# Zeichnen Sie zusätzlich zu den Linien alle Messpunkte in die Grafik ein


######
# Barplots mit drei Variablen
# 2 kategoriale Variablen und eine metrische Variable (Outcome)
# Wenn theoretische begründete Vorstellungen zu Ursache und Wirkungszusammenhängen bestehen, 
# bietet sich folgende Anordnung an: x-Achse (erklärende Variable), Y-Achse (zu erklärende Variable),
# Farb-Unterschiede für Gruppen (Drittvariablen)

# Daten: cabbage_exp - Data from a cabbage field trial (Summary)
library(gcookbook)
help("cabbage_exp")

# Erstellen Sie einen Barplot, der auf der X-Achse die Information zum Datum enthält, 
# an welchem der Versuchs-Kohl gepflanzt wurde (Date), das mittlere Gewicht auf der y-Achse (Weight) 
# sowie die unterschiedlichen Kultivierungsmethoden (Cultivar) farblich aufzeigt (fill=)
# Hat die Kultivierungsmethode einen Einfluss auf das mittlere Gewicht der untersuchten Kohle?
# Achtung 1: damit balken entsprechend der Werte im Datensatz abgebildet werden
# ist die option stat="identity" nötig. 
# Achtung 2: Ohne position="dodge" wird ein gestapelter Barplot gezeigt.

ggplot(cabbage_exp, aes())+




  #########
# Scatterplots mit 3 Variablen
# (2 kontinuierliche Variablen) und eine Gruppenvariable 

# Daten: heightweight - Height and weight of schoolchildren
# Nehmen Sie eine erste Dateninspektion vor
heightweight
help("heightweight")

# Ausgangspunkt ist der im vorangehenden Skript erstellte Scatterplot, 
# der Grösse und Alter der Schulkinder plottet
ggplot(heightweight, aes(x=ageYear,y=heightIn)) +
  geom_point()

# Wie sieht der Plot aus, wenn Geschlechterunterschiede (sex) farblich abgebildet werden (colour=)? 
# Ist der Zusammenhang von Alter und Grösse für Mädchen und Jungs anders?


# Ergänzen Sie den Plot mit einem stat_smooth(method=loess)
# Damit werden Linien mit lokaler Anpassung an die Daten angezeigt, 
# um den Zusammenhang von Alter und Grösse für Mädchen und Jungs unterschieden darzustellen




####
# Sind Plots mit drei kontinuierlichen Variablen möglich?
# Klar. Hier kommt der Bubble-Chart/Ballon-Chart, eine Erweiterung des Scatterplots


## Daten: countries - Health and economic data about countries around the world from 1960-2010
library(gcookbook)
str(countries)
help(countries)

# Die Daten werden eingegrenzt - nur 2009
countsub<-filter(countries, Year==2009)

# Zeilen mit fehlenden Werten und die Variable laborrate[5] werden gelöscht)
countsub<-countsub %>%
  na.omit() %>%
  select(-laborrate)

# Wie ist der Zusammenhang zwischen Kindersterblichkeit(infmortality), 
# Gesundheitsausgaben (healthexp) und dem Bruttosozialprodukt (GDP)?
# Erstellen Sie zur Beantwortung dieser Frage einen Bubble-Chart 
# mit den Gesundheitsausgaben auf der x-Achse, der Kindersterblichkeit 
# auf der y-Achse und dem Bruttosozialprodukt visualisiert über die Grösse der Punkte
# über aes(size=)
ggplot(countsub, aes())+
  geom_point()

# Wenn man die Kreise etwas grösser zeichen will, 
# muss die Skalierung von size angepasst werden (scale_size_area(max_size=))




