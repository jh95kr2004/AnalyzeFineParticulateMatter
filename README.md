# Fine Particulate Matter
R project to analyze fine particulate matter of Sajik-dong, South Korea.

# Data
Data is measured using Raspberry pi 3 and Arduino every 5 minutes.<br>
You can check data at http://sogangds.com/<br>
or get JSON data using API(http://sogangds.com:3000/api/dust/all).<br><br>
To read data in R, use jsonlite library.<br>
```
library(jsonlite)
data <- fromJSON('http://sogangds.com:3000/api/dust/all')
```

# Goal
Goal of analysis is finding correlation of status of PM, date, temparature, humid and etc.
