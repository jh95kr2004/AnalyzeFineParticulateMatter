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

## Data Columns

<table>
<tr><td><b>Column Name</b></td><td><b>Description</b></td></tr>
<tr><td>date</td><td>Measured date</td></tr>
<tr><td>temp</td><td>Temperature</td></tr>
<tr><td>humid</td><td>Humidity</td></tr>
<tr><td>alt</td><td>Altitude</td></tr>
<tr><td>atm</td><td>Atmospheric pressure</td></tr>
<tr><td>PM1</td><td>PM1.0</td></tr>
<tr><td>PM25</td><td>PM2.5</td></tr>
<tr><td>PM10</td><td>PM10</td></tr>
</table>

# Goal
Goal of analysis is finding correlation of status of PM, date, temparature, humid and etc.
