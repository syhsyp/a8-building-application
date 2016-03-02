library(dplyr)
library(plotly)

data('iris')
#create a summary table that shows average measument for each kind of data
data_summary <- group_by(iris, Species) %>%
            summarise(Sepal_Length = mean(Sepal.Length, na.rm = TRUE), 
                      Sepal_Width = mean(Sepal.Width, na.rm = TRUE), 
                      Petal_Length = mean(Petal.Length, na.rm = TRUE), 
                      Petal_Width = mean(Petal.Width, na.rm = TRUE))

#a function to create a bar chart with dataframe, data type and species
build_plot <-function(df, type, species) {
  df <- filter(df, Species == species) %>%
                select_(paste0(type, "_Length"), paste0(type, "_Width"))
  p <- plot_ly(df, x = c(paste("Average", type, "Length"), paste("Average", type, "Width")), 
          y = as.character(df[1,]), type = "bar"
          )
  layout(p, xaxis = list(title = "Data type"), yaxis = list(title = "Average Measurement"))
}