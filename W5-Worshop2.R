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







