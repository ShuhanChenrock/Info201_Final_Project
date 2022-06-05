

library(shiny)


urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

Total_RatingsofGames <- mydata$`total ratings`
# Define UI for application that draws a histogram
ui <- basicPage(
  headerPanel("Relation between number of ratings and quality of ratings"),
  
  sliderInput(inputId = "Total_RatingsofGames", label = "Select the range of bill length?", value = c(1000000,50000000), min = 0, max = 60000000, step = 1000),
  plotOutput("plot1",
             click = "plot_click",
             dblclick = "plot_dblclick",
             hover = "plot_hover",
             brush = "plot_brush"
  ),
  verbatimTextOutput("info")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({

    Total_5Star_RatingsofGanmes <- mydata$`5 star ratings`
    plot(Total_RatingsofGames, Total_5Star_RatingsofGanmes)
  })
  
  output$info <- renderText({
    xy_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("x=", round(e$x, 1), " y=", round(e$y, 1), "\n")
    }
    xy_range_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("xmin=", round(e$xmin, 1), " xmax=", round(e$xmax, 1), 
             " ymin=", round(e$ymin, 1), " ymax=", round(e$ymax, 1))
    }
    
    paste0(
      "click: ", xy_str(input$plot_click),
      "dblclick: ", xy_str(input$plot_dblclick),
      "hover: ", xy_str(input$plot_hover),
      "brush: ", xy_range_str(input$plot_brush)
    )
  })
}

shinyApp(ui, server)
