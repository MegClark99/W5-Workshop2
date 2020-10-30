#packages
library(tidyverse)
library(dplyr)
library(Rmisc)

#importing the untidy data
data <- read.csv("Human-development-index.csv")
data[1:5,]

data2 <- data %>% 
  pivot_longer(names_to = "Years", 
               values_to = "Index",
               cols = -c(Country,HDI.Rank..2018.))

#removing all the Na's
data3 <- data2[!is.na(data2$Index),]
data4 <- data3[!is.na(data3$HDI.Rank..2018.),]

#to keep all rows where years is 1990
#hdi %>%
#  filter(years == 1990)

#to exlude the year 1990 from the data
#hdi %>%
#  filter(years != 1990)

#removing NAs from years
#filter(!is.na(years))

#data summary of the mean, sd and se of index
data3_summary <- data3 %>% 
  group_by(Country) %>% 
  summarise(mean_Index = mean(Index),
            n = length(Index),
            sd = sd(Index),
            se = sd/sqrt(n))

#ten countries with the lowest mean HDI using:
data3_summary_low <- data3_summary %>% 
  filter(rank(mean_Index) < 11)
data3_summary_low

#plotting a graph
data3_summary_low %>% 
  ggplot() +
  geom_point(aes(x = Country,
                 y = mean_Index)) +
  geom_errorbar(aes(x = Country,
                    ymin = mean_Index - se,
                    ymax = mean_Index + se)) +
  scale_y_continuous(limits = c(0, 0.5),
                     expand = c(0, 0),
                     name = "HDI") +
  scale_x_discrete(expand = c(0, 0),
                   name = "") +
  theme_classic() +
  coord_flip()








