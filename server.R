library(shiny)
library(dplyr)
library(plotly)
source('assignment.r')

# Code to be executed by the shiny server
shinyServer(function(input, output) {

  #Create an adjustable bar chart
  output$plot <- renderPlotly({
    
    #Change the data when users click different species button
    data_species <- switch(input$Species,
                          "setosa" = filter(data_summary, Species == "setosa"),
                          "versicolor" = filter(data_summary, Species == "versicolor"),
                          "virginica" = filter(data_summary, Species == "virginica"))
    
    #Change the data when users choose different type of data they want to see(sepal or petal)
    data_type <- switch(input$type,
                        "Sepal" = select(data_species, paste0(input$type, '.', "Length"), 
                                         paste0(input$type, '.', "Width")),
                        "Petal" = select(data_species, paste0(input$type, '.', "Length"), 
                                         paste0(input$type, '.', "Width")))
    
    #Create the bar chart that can adjusts showing data based on users' choice
    p <- plot_ly(data_summary, x = c(paste("Average", input$type, "Length"), 
                                     paste("Average", input$type, "Width")), 
                 y = data_type[1,], type = "bar", name = "Average Length and Width")
  })
})