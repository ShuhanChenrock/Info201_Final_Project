library(readr)
library(ggplot2)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

View(mydata)

plot(mydata$`total ratings`, mydata$`5 star ratings`,
     xlim = c(0, 90000000) , ylim = c(0, 70000000), 
     pch = 18, 
     cex = 0.8, 
     col = "#69b3a2",
     xlab = "Total ratings", ylab = "5 star ratings",
     main = "Relation between number of ratings and quality of ratings"
)
