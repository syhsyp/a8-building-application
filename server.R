library(shiny)
library(dplyr)
library(plotly)
source('assignment.r')

# Code to be executed by the shiny server
shinyServer(function(input, output) {

  #Create an adjustable bar chart
  output$plot <- renderPlotly({
    build_plot(data_summary, input$type, input$Species)
  })
})