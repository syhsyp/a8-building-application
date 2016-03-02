library(shiny)
library(plotly)
library(dplyr)
source('assignment.r')

# Code to be executed by the shiny server
shinyUI(fluidPage(
  titlePanel("iris dataset"),
  sidebarLayout(
    sidebarPanel(
      #Choose which type of data to display, sepal or petal
      selectInput("type", label = h3("display choice"),
        choices = list("Sepal" = "Sepal", 
                       "Petal" = "Petal"),
        selected = "Sepal"),
      
      hr(),
      
      #Choose which species to display
      radioButtons("Species", label = h3("Specie type"),
        choices = list("setosa" = "setosa", "versicolor" = "versicolor", "virginica" = "virginica"),
        selected = "setosa")
    ),
  
    #Display the graph
    mainPanel(
      plotlyOutput('plot')
    )
  )
))