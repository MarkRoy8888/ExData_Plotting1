# library
library(tidyverse)
library(lubridate)
# load Data
dataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")  

dataset$Date2<- strptime(dataset$Date,"%d/%m/%Y")
dataset <- subset(dataset,Date2>="2007-02-01" & Date2<="2007-02-02")
dataset$date_time <- strptime(paste(dataset$Date, dataset$Time, sep=" "),
                              "%d/%m/%Y %H:%M:%S") 
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
# Plot2
png(filename="Plot2.png")
with(dataset,plot(date_time,
                  Global_active_power,type="l",
                  xlab = "",
                  ylab="Global Active Power (kilowatts)"))

dev.off()

