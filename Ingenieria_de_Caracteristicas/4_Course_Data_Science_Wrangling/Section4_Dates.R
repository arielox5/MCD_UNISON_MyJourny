# Regex Section 3

# detect whether a comma is present
pattern <- ","
str_detect(murders_raw$total, pattern) 

# show the subset of strings including "cm"
str_subset(reported_heights$height, "cm")

# use the "or" symbol inside a regex (|)
yes <- c("180 cm", "70 inches")
no <- c("180", "70''")
s <- c(yes, no)
str_detect(s, "cm") | str_detect(s, "inches")
str_detect(s, "cm|inches")

# highlight the first occurrence of a pattern
str_view(s, pattern)

# highlight all instances of a pattern
str_view_all(s, pattern)


library(dslabs)
library(lubridate)
library(dtplyr)
library(dplyr)
dataX <- data(brexit_polls)
dataX <- brexit_polls
c1 <- month(brexit_polls$startdate) 
dataX["Month_Number"] <- c1
res <- nrow(dataX[dataX$Month_Number == "4",])

res <- nrow(dataX[dataX$enddate == "4",])


c1 <- round_date(dataX$enddate, unit = "week")
dataX["round"] <- c1
res <- nrow(dataX[dataX$round == "2016-06-12",])
# Q4
dataX["weekdays"] <- weekdays(dataX$enddate)
dataX["weekdays"] == "Sunday"
length(which(dataX["weekdays"] == "Sunday"))
# Q5
dataMovies <- movielens
dataMovies$timestamp = as_datetime(dataMovies$timestamp)
dataMovies["yearM"] = year(dataMovies$timestamp)
dataMovies["Hour"] = hour(dataMovies$timestamp)

listYears <- unique(dataMovies$yearM)
listHours <- sort(unique(dataMovies$Hour))
sort(listHours)


for(n in 1:length(listHours)){
  # print(paste("Año = ", listYears[n], "Total Rows = ", nrow(dataMovies[dataMovies$yearM == listYears[n],])))
  print(paste("Hour = ", listHours[n], "Total Rows = ", nrow(dataMovies[dataMovies$Hour == listHours[n],])))
  
}
  

# Q 6
library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)
