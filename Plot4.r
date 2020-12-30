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
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
# Plot4
png(filename="Plot4.png")
par(mfrow = c(2, 2)) 
# 1
with(dataset,plot(date_time,
                  Global_active_power,type="l",
                  xlab = "",
                  ylab="Global Active Power"))
# 2
with(dataset,plot(date_time,
                  Voltage ,type="l",
                  xlab = "datetime",
                  ylab="Voltage"))
# 3 
with(dataset,plot(date_time,
                  Sub_metering_1,type="l",
                  xlab = "",
                  ylab="Energy sub metering"))
with(dataset,lines(date_time, Sub_metering_2, type="l", col="red"))
with(dataset,lines(date_time, Sub_metering_3, type="l", col="blue"))
legend("topright",
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"),
       lwd=2.5,
       col=c("black", "red", "blue"))
# 4
with(dataset,plot(date_time,
                  Global_reactive_power  ,type="l",
                  xlab = "datetime",
                  ylab="Global_reactive_power"))

dev.off()


