library(jsonlite)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)

# get data from raspberry pi
# data <- fromJSON('http://sogangds.com:3000/api/dust/all')
# data <- tbl_df(data)
# data <- data[,-1]
# data %>% write_csv("data-2017-08-10.csv")

data <- read.csv("finedust.csv")

data %>% select(PM25, PM1, PM10) %>%
  sample_n(1000) %>%
  pairs()

df <- data %>%
  mutate(date=lubridate::parse_date_time(data$date, "YmdHMS", tz = "Asia/Seoul") + hours(9)) %>%
  select(date, atm, humid, temp, PM1, PM10, PM25) %>%
  mutate(yy = year(date),
         mm = month(date),
         dd = day(date),
         hh = hour(date))

df <- data %>%
  mutate(date=as.POSIXct(data$date, format = "%Y-%m-%dT%H:%M:%S", tz = "Asia/Seoul") + hours(9)) %>%
  select(date, atm, humid, temp, PM1, PM10, PM25) %>%
  mutate(yy = year(date),
         mm = month(date),
         dd = day(date),
         hh = hour(date))

df %>% glimpse()

df %>%
  ggplot(aes(date, PM25)) + geom_point() +
  geom_hline(yintercept=100, col='red')

df %>%
  ggplot(aes(hh, PM25)) + geom_jitter(alpha=.1)

df %>%
  ggplot(aes(hh, PM25)) + geom_jitter(alpha=.1) +
  scale_y_log10()

df %>%
  ggplot(aes(hh, temp)) + geom_jitter(alpha=.1) +
  scale_y_log10()

df %>%
  ggplot(aes(as.factor(hh), PM25)) + geom_boxplot(alpha=.1) +
  scale_y_log10()

df %>%
  ggplot(aes(as.factor(hh), temp)) + geom_boxplot(alpha=.1) +
  scale_y_log10() + facet_wrap(~mm)

df %>%
  ggplot(aes(as.factor(hh), humid)) + geom_boxplot(alpha=.1) +
  scale_y_log10() + facet_wrap(~mm)

df %>%
  ggplot(aes(as.factor(hh), atm)) + geom_boxplot(alpha=.1) +
  scale_y_log10() + facet_wrap(~mm)

df %>%
  summarize(humid = mean(humid),
            temp = mean(temp))

df %>%
  group_by(mm) %>%
  summarize(humid = mean(humid),
            temp = mean(temp),
            atm = mean(atm, na.rm = TRUE))

glimpse(df)
df %>%
  transmute(atm, humid, temp, log10(PM25)) %>%
  sample_n(1000) %>%
  pairs()

df %>%
  transmute(atm, humid, temp, log10(PM25+1)) %>% # To prevent log zero data, just plus 1.
  cor(use = "complete.obs") # skip missing data

df %>%
  ggplot(aes(PM25)) + geom_histogram()

df %>%
  ggplot(aes(PM25)) + geom_histogram() +
  scale_x_log10()
