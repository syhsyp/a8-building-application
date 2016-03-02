library(dplyr)

data('iris')
data_summary <- group_by(iris, Species) %>%
            summarise(Sepal_Length = mean(Sepal.Length, na.rm = TRUE), 
                      Sepal_Width = mean(Sepal.Width, na.rm = TRUE), 
                      Petal_Length = mean(Petal.Length, na.rm = TRUE), 
                      Petal_Width = mean(Petal.Width, na.rm = TRUE))
