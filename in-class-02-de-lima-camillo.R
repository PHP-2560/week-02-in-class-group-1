
#Part 1

#1) 
#gets data
rain.df = read.table("rnf6080.dat")

#2)
dim(rain.df) #5070 col and 27 rows

#3)
names(rain.df) #V1, V2, ..., V27

#4)
rain.df[5,7] #value is 0

#5)
rain.df[2,]

#6)
names(rain.df) <- c("year","month","day",seq(0,23))
#the command changes the names of the columns to something that makes more sense given the data set.
#First column is year, then month, then day, then each hour of the day from 0-23.

#7)
rain.df$daily = rowSums(rain.df[,4:27])
hist(rain.df$daily, main = "Histogram of rain in Canada (1960-1980)", xlab = "Precipitation", ylab = "days")
#the problem is that there are some days with negative precipitation

#8)
rain.df.fixed = rain.df
rain.df.fixed[rain.df.fixed == -999] = NA
rain.df.fixed$daily = rowSums(rain.df.fixed[,4:27]) 
hist(rain.df.fixed$daily, main = "Histogram of rain in Canada (1960-1980)", xlab = "Precipitation", ylab = "days")



#Part 2

install.packages("nycflights13")
library(nycflights13)
library(dplyr)
library(ggplot2)

#1)
flights %>%
  filter(month == 3, day == 30)

#2)
flights %>%
  filter(row_number()%in%567:589)

#3)
flights %>%
  arrange(year, month, day)

#4)
flights %>%
  arrange(desc(arr_delay))

#5)
flights %>%
  select(year:day)
  
#6)
flights %>%
  select(tailnum, carrier)

#7)
flights %>%
  rename(tail_num = tailnum)

#8)
flights %>%
  mutate(gain = arr_delay - dep_delay)

#9)
flights %>%
  mutate(speed = distance/air_time*60)

#10)
flights %>%
  summarise(avg = mean(arr_delay, na.rm = TRUE))

#11)
flights %>%
  group_by(tailnum) %>%
  summarise(count = n(), dist = mean(distance, na.rm = TRUE), delay = mean(arr_delay, na.rm = TRUE)) %>%
  ggplot(aes(dist,delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()

#12)
flights %>%
  group_by(dest) %>%
  summarise(n_flights = n(), n_planes = n_distinct(tailnum))

#13)
#a- this function is not very legible and is difficult to understand what is going on, including the not necessary select verb
#b- very difficult
#c- 
flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>% #this line does not do anything, but it is in the original code
  summarise(arr = mean(arr_delay, na.rm = TRUE), dep = mean(dep_delay, na.rm = TRUE)) %>%
  filter(arr > 30 | dep > 30)
#d- it gives the same results

#14)
#a- hard to read and understand what it is supposed to do; there is no date column, so you would have to change it to year, month, an day
#b- very difficult
#c- 
hourly_delay = flights %>%
  filter(!is.na(dep_delay)) %>%
  group_by(year, month, day, hour) %>%
  summarise(delay = mean(dep_delay), n=n()) %>%
  filter(n>10)
#d- it gives the same results

 




