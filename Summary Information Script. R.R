#Summary information script
# The data used is listed below
mean_total_ratings <- android_games %>% group_by(category)%>% summarise (Average_total_rating = mean(total.ratings)) %>% arrange(-Average_total_rating)
mean_total_ratings %>% kable() %>% kable_styling(latex_options = "striped")

mean_total_quality <- android_games %>% group_by(category)%>% summarise (Average_5star_rating = mean(X5.star.ratings)) %>% arrange(-Average_5star_rating)
mean_total_quality %>% kable() %>% kable_styling(latex_options = "striped")

mean_total_growth_30_days <- android_games %>% group_by(category)%>% summarise (Average_growth_in_30_days = mean(growth..30.days.)) %>% arrange(-Average_growth_in_30_days,rm.na=TRUE)
mean_total_growth_30_days %>% kable() %>% kable_styling(latex_options = "striped")

mean_total_growth_60_days <- android_games %>% group_by(category)%>% summarise (Average_growth_in_60_days = mean(growth..60.days.)) %>% arrange(-Average_growth_in_60_days,rm.na=TRUE)
mean_total_growth_60_days %>% kable() %>% kable_styling(latex_options = "striped")