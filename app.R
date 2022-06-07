

library(readr)
library(dplyr)
library(ggplot2)
library(shiny)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read.csv(url(urlfile))
total.ratings <- mydata$`total ratings`


# View(mydata)

mean_total_ratings <- mydata %>% group_by(category)%>% summarise (mean_num = mean(total.ratings)) %>% arrange(mean_num)

categories<-unique(mydata$category)

ggplot(mean_total_ratings, aes(x = mean_num, y = category))+
  geom_bar(stat = "identity")+
  labs(title = "Which category is the most popular?")


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Android Games Rating"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("show_category", "category to show:",
                         categories, selected = categories)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("colPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  dat_aux<-reactive({
    dat<- mean_total_ratings %>% filter(category %in% input$show_category)
    dat
  })
  
  output$colPlot <- renderPlot({
    dat<-dat_aux()
    plot<-ggplot(dat, aes(x = mean_num, y = category))+
      geom_bar(stat = "identity")+
      labs(title = "Which category is the most popular?")
    plot
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

