library(readr)
library(ggplot2)

urlfile = "https://raw.githubusercontent.com/ShuhanChenrock/Info201_Final_Project/main/android-games.csv"

mydata <- read_csv(url(urlfile))

View(mydata)

mean_total_ratings <- android_games %>% group_by(category)%>% summarise (mean_num = mean(total.ratings)) %>% arrange(mean_num)


ggplot(mean_total_ratings, aes(x = mean_num, y = category))+
  geom_bar(stat = "identity")+
  labs(title = "Which category is the most popular?")


  

