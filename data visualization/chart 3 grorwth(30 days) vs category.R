library(readr)
library(ggplot2)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

#View(mydata)

sss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (30 days)`))

ssss <- mydata %>% group_by(category) %>% summarise( avg_growth = mean(`growth (60 days)`))


ggplot(sss, aes(x = avg_growth, y = category))+
  geom_boxplot() +
  ggtitle("Different categories growth in 30 days")


