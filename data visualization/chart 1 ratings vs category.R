library(readr)
library(ggplot2)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

View(mydata)


barplot(mydata$`total ratings`,
      

        ylab = "number of ratings", line = 0.9, cex.lab = 1.4,
        xlab = "game categories",
        ylim = c(0, 90000000),
        names.arg = mydata$category, 
        las = 2,
        cex.names = 0.5,
        main = "Which category is the most popular?")
  

