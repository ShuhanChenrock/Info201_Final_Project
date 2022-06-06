#Library loaded
library(shiny)
library(shinythemes)
library(tidyverse)
library(readr)
library(ggplot2)
library(ggrepel)
library(tidyverse)
library(shiny)
library(plotly)
#dataset loaded
urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

Total_RatingsofGames <- mydata$`total ratings`
urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))
sss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (30 days)`)) %>% mutate( Percentage = (signif(avg_growth / sum(avg_growth)) * 100) )
ssss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (60 days)`)) %>% mutate( Percentage = (signif(avg_growth / sum(avg_growth)) * 100) )

ui <- fluidPage(
  theme = shinytheme("cyborg"),
  navbarPage(
    theme = "cyborg",
    "Info 201 Final Project:Analysis of Game category on Android System",
    tabPanel("Introduction",
  h1("Introduction", align = "center"),
  br(""),
  h3("What is this study about?"),
  h6("In this study, we focus on the correlation among games genre, rating, and the installments of games in Android system. Android self-phone gaming is an ignored gaming field and we want to know the tendency of the game genre, the popularity, and the quality of games."),
  h3("Where and how the dataset is gathered?"),
  h6("This dataset, Top Games on Google is found through Kaggle by searching the keyword videogames. Dataset Top Games on Google Play Store was collected by Dhruvil Dave through Google Play Store directly. He gathered this information by collecting the information shown in the game details page. This dataset was gathered around Jun 2021, containing 100 games and 17 game-types categories available in android Google Play."),
  h3("What we focus on "),
  h6("In this study, we focus on the correlation relationship among the category, the rating of each android games, and the installment of each android games. We attempt to found that which category is most popular, if its popularity is relevant with its rating (5stars rate), and if the growth of installment is relevant with the rating."),
  h6("The chart could be found in the following pages."),
  img(src = "gaming.png",height = 300, width = 400 ),
    ),
  tabPanel("Ratio of Number of Rating and Genre",
           headerPanel("Relation between number of ratings and quality of ratings"),
           
           sliderInput(inputId = "Total_RatingsofGames", label = "Select the range of bill length?", value = c(1000000,50000000), min = 0, max = 60000000, step = 1000),
           plotOutput("plot1",
                      click = "plot_click",
                      dblclick = "plot_dblclick",
                      hover = "plot_hover",
                      brush = "plot_brush"
           ),
           verbatimTextOutput("info"),
           br(""),
           h3("Why we include this chart and what we found"),
           h6("The reason why we choose this chart to illustrate the relationship between the total ratings and 5 star rating is because it allows us to understand the correlation relationship between these two variables. According to this chart, one question can be answered that alone with the total rating increase, the ratio of 5 star rating will also increase, meaning the game genre with more number of ratings has higher possibility to get better rating. Accompany with the previous chart, it is easy to understand that Action Game not only possesses the most number of rating, but also the highest quality of rating."),
  ),
  tabPanel("Growth comparison of different category 30 days",
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
           ),
           h3("Why we include this chart and what we found"),
           h6("The reason why we include this pies chart is because pie chart can compare the speed of growth among different genres easily and illustrates the occupation of genre in the total growthfollowed by Game Trivia and Game Card. In this chart, it is easy to see that Game Casino occupies the biggest portion of the game growth, about 43.5%, followed by Game Trivia(20.1%) and Game Card(13.9%). It is a unexpected discovery considering the low ranking these three categories has in ranking and installment."),
           
  ),
  tabPanel("chart3",
           h2("Chart missing"),
           h3("Why we include this chart and what we found"),
           h6("The reason why we choose this chart to illustrate the relationship between the game genre and its total number of rating is because it allows us to view the disturbance of different genre vividly. As the chart shows, Game action has the most rating number of all game genres in Google Play store, which followed by Casual Game and Strategies Game."),
           
          
             ),
            
  tabPanel("Summary",
           h1("Summary"),
           br(""),
           h3("Why we include these three chart?"),
           h6("The first chart illustrates the ratio between number of rating and genre that explores which gaming genre has the most popularity. However, verifying the quality of games by merely its amount of rating is not accurate enough. Thus, we create the second chart, which focus on the quality of rating by comparing the number of 5-star rating and total rating numbers. Finally, we create the third chart to illustrate the comparison between different growth of the genre to discover the potential changes of the trends we found."),
           h3("What we can discover from the chart?"),
           h6("In these three scripts, some trends can be easily discovered. Action Game possesses the highest number of ratings and the highest 5 stars rate. However, its growth, is relatively low compared with the previous two variables, given that only at rank 15 in 30 growth and rank 4 in 60 days growth. The top growth in 30 days and 60 days are Casino Game and Board Game, which appeared to have relatively low ranking at both rating variables."),
           h3("What is our mainly takeaway from these charts?"),
           h6("1.	The data of total rating number and 5-stars rating number have positive correlation, meaning the more rating number one category has, the more popular and welcoming it is."),
           img(src = "scatterplot.png",height = 500, width = 600 ),
           h6("2.	Action Game possesses the top popularity considering its high occupation in the total rating number and 5-stars rating. The data of total rating number and 5-stars rating number have positive correlation, meaning the more rating number one category has, the more popular and welcoming it is. In both category, Action Game has the top number, and it means Action Game is the top popular game category among Android users."),
           img(src = "histogram.png",height = 500, width = 600 ),
           h6("3.	The game genre with the fastest growth rate is not Action Game, but Casino Game. Casino Game occupies approximately 43.5% of total growth of the total installment in 30 days. The position of the ranking among ranking and growth is completely opposite. Casino Games appears to be the last few categories of both total rating categories and 5-star- category, while Action Game appears to be the last few categories of the growth chart."),
           img(src = "pie chart.png",height = 500, width = 700 ),
           h6("4.	The position of the rating chart and growth chart are completely opposite. If a game is ranked at the higher position in the total rating list, it would appear to be at the lower position in the growth chart. Furthermore, the top game genre in the rating chart is more well-known compared with the top game genre in the growth chart. To explain this phenomenon, our group assume that the top game genre in the growth chart could be the relatively new game genre, which just uploaded on the Google Play for users to access. Thus, they appear to have high growth of installment, but low rating number. On the other hand, the top game genre in the total rating chart has been uploaded for a long time and facing the saturation of their potential user, which give them enormous number of rating number but low recent (30 days) installment speed."),
           
           ),
 
  )
)
  

server <- function(input, output){
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

shinyApp(ui = ui, server = server)
