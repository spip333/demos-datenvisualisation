library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Hello my App-1"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Zahl der bins:",
                  min = 5,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
))