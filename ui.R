library(shiny)
library(dplyr)

data <- read.table("cereal.tsv", header = TRUE)

shinyUI(fluidPage(
  titlePanel("Widget Demo"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label="Pick a type", 
                  choices = list("Calories" = 'calories', "Protein" = 'protein', "Fat" = 'fat', "Sodium" = 'sodium'), 
                  selected = 'calories'),
      sliderInput("slider", label="Rating", min = min(data$rating), max = max(data$rating), value = 100),
      radioButtons("radio", label="Choose a color", choices = list("Red" = 'red', "Blue"  = 'blue', "Green" = 'green'))
    ),
    
    mainPanel(plotOutput("graph"))
  )
))