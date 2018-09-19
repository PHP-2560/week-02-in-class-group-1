
library(dplyr)
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

#1)







