library(shiny)
library(dplyr)
library(plotly)
source('assignment.r')

# Code to be executed by the shiny server
shinyServer(function(input, output) {
  # input: information passed from the UI into the R session
 # lengthx <- paste0(input$type, '.', "Length")
#  widthx <- paste0(input$type, '.', "Width")
 # value <- filter(data_summary, species = input$Species) %>%
  #          select(lengthx, widthx)
  # output: objects passed from R session back to the server
  
  #Create an adjustable bar chart
  output$graph <- renderPlotly({
    
    #Change the data when users click different species button
    data_species <- switch(input$Species,
                          "setosa" = filter(data_summary, Species == "setosa"),
                          "versicolor" = filter(data_summary, Species == "versicolor"),
                          "virginica" = filter(data_summary, Species == "virginica"))
    
    #Change the data when users choose different type of data they want to see(sepal or petal)
    data_type <- switch(input$type,
                        "type1" = select(data_species, paste0(input$type, '.', "Length"), 
                                         paste0(input$type, '.', "Width")),
                        "type2" = select(data_species, paste0(input$type, '.', "Length"), 
                                         paste0(input$type, '.', "Width")))
    
    #Create the bar chart that can adjusts showing data based on users' choice
    p <- plot_ly(data_summary, x = c(paste("Average", input$type, "Length"), 
                                     paste("Average", input$type, "Width")), 
                 y = data_type[1,], type = "bar", name = "Average Length and Width")
  })
})