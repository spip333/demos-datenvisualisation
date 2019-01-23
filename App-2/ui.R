shinyUI(fluidPage(
  titlePanel("My own little Star Wars"),
  
  sidebarLayout(
    sidebarPanel(" "),
    mainPanel(h6("Episode IV", align="center"),
              h5("A NEW HOPE", align="center"), 
              h5("It is a period of civil war.", align="center"),
              h3("Rebel spaceships, striking", align="center"),
              h4("from a hidden base, have won", align="center"),
              h4("their first victory against the", align="center"),
              h1("evil Galactic Empire.", align="center")
              )
  )
))

