library(shiny)
library(dplyr)
library(ggplot2)


data <- read.table("cereal.tsv", header = TRUE)
data <- data %>% slice(1:5)

shinyServer(function(input, output) {
  output$graph <- renderPlot({
    data <- data %>% filter(rating < input$slider)
    ggplot(data, aes_string(x = 'name', y = input$select)) + geom_col(fill = input$radio)
  })

})

