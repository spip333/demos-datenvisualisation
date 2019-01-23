shinyUI(fluidPage(
  titlePanel("BFS-Open-Data Visualisierung - Regionale Altersverteilung"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Erstelle demographische Karten mit Open-Data Informationen des Bundesamtes für Statistik (BFS)"),
      
      selectInput("var1", 
                  label = "Wählen Sie eine Altersgruppe",
                  choices = c("Altersgruppe: 0-19", "Altersgruppe: 20-64",
                              "Altersgruppe: 65 plus"),
                  selected = "Altersgruppe: 20-64")
    ),
    
    mainPanel(
      h1(textOutput("text1"),align="center")
    )
  )
))
