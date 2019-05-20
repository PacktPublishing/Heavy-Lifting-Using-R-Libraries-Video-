library(shiny)

shinyServer(
  function(input, output){

    output$MyName=renderText(input$Name)
    output$Mydatas=renderText(input$Datas)
    output$Mydrop=renderText(input$DataDrop)

  }


)

