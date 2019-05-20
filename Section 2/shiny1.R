library(shiny)
shinyUI(fluidPage(
  titlePanel("This is my first panel"),
  sidebarLayout(
  sidebarPanel("This is the side panel"),
  mainPanel("this is the main panel")
  )
)

)
