library(readr)
library(ggplot2)
library(ggrepel)
library(tidyverse)
library(shiny)
library(plotly)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))
sss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (30 days)`)) %>% mutate( Percentage = (signif(avg_growth / sum(avg_growth)) * 100) )
ssss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (60 days)`)) %>% mutate( Percentage = (signif(avg_growth / sum(avg_growth)) * 100) )

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel(
    h1("Growth comparison of different category", align = "center")
  ),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        inputId = "category",
        label = "Select Category",
        choices = sss$category,
        selected = "GAME ACTION"
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "pie")
      
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$pie <- renderPlotly({
    filter_df <- mydata %>% group_by(category) %>% 
      summarise( avg_growth = mean(`growth (30 days)`)) %>% 
      filter(category %in% input$category) %>% 
      mutate( Percentage = (signif(avg_growth / sum(avg_growth)) * 100) )
      
    plot_ly(data = filter_df, labels = ~category, values = ~avg_growth,
            type = 'pie', sort = FALSE,
            marker = list(colors = colors, line = list(color = "black", width = 1))) %>% 
            layout(title = "Game genre and its growth of 30 days")
      
  })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
