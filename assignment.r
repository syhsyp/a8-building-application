library(dplyr)

data('iris')
data_summary <- group_by(iris, Species) %>%
            summarise(ave_sepal_length = mean(Sepal.Length, na.rm = TRUE), 
                      ave_sepal_width = mean(Sepal.Width, na.rm = TRUE), 
                      ave_petal_length = mean(Petal.Length, na.rm = TRUE), 
                      ave_petal_width = mean(Petal.Width, na.rm = TRUE),
                      count = n())
value <- filter(data_summary, Species == "setosa")
