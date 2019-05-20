library(shiny)

shinyUI(fluidPage(
  headerPanel(title=h1("My Shiny App")),
  sidebarLayout(
    sidebarPanel(("Data"),
      textInput("Name","Name",""),
      radioButtons("Datas","Select DataSet", list("Stocks","Global Weather"),""),
      selectInput("DataDrop","Select DataSet:",choices=c("Stocks"="Stocks","Global Weather"="Global Weather"))
  ),
  mainPanel(("MainPanel"),
            textOutput("MyName"),
            textOutput("Mydatas"),
            textOutput("Mydrop"))

  )
)

)
