load("/Users/MLupion/Desktop/GOV 1005/Regions Data/ICPSR_35355/DS0003/Regions3.rda")
load("/Users/MLupion/Desktop/GOV 1005/Regions Data/ICPSR_35355/DS0007/35355-0007-Data.rda")
library(tidyverse)
library(dplyr)
RegionsData3 <- da35355.0003

RegionsData3$ID <- as.factor(as.character(RegionsData3$ID)) 

RegionsData3 %>%
  filter(ID %in% c("1","2","5")) %>%
  group_by(ID, YEAR) %>%
  ggplot(aes(x = YEAR, y = BREVENUE, color = ID)) + geom_line(size = 2) + scale_color_manual(labels = c("Republic of Adygea", "Republic of North Ossetia-Alania", "Amur Oblast"), values = c("blue","red", "green")) +
  ggtitle("Regional budget revenue", subtitle = "from 1990 to 2010") + xlab("Year") + ylab("Revenue (millions of USD)")


RegionsData7 <-da35355.0007
RegionsData7$ID <- as.factor(as.character(RegionsData3$ID)) 
select(RegionsData7, NAME, SICKRATE15, YEAR) %>%
  filter(YEAR == 2010) %>%
  arrange(desc(SICKRATE15))
#Primorsky Krai has highest rate of trauma/intoxication illnesses 

#How has that changed over time?
filter(RegionsData7, ID == 55)%>%
  ggplot(aes(x = YEAR, y = SICKRATE15)) + geom_point(size = 2)

#What about in Chechnya, Daegastan and Ingushetia?
filter(RegionsData7, ID %in% c(16, 17, 12))%>%
  ggplot(aes(x = YEAR, y = SICKRATE15, color = ID)) + geom_point(size = 2)
