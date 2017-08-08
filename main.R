library(jsonlite)
library(tidyverse)
library(dplyr)
library(ggplot2)

# get data from raspberry pi
data <- fromJSON('http://sogangds.com:3000/api/dust/all')
data <- tbl_df(data)
data <- data[,-1]

summary(data)

data %>% ggplot(aes(temp, PM25)) + geom_point(alpha=.05)
