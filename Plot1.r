# library
library(tidyverse)
# load Data
dataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
dataset$Date<- strptime(dataset$Date,"%d/%m/%Y")
dataset <- subset(dataset,Date>="2007-02-01" & Date<="2007-02-02")
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
# Plot1
png(filename="Plot1.png")
with(dataset,hist(Global_active_power,
                  main = "Global Active Power",
                  col = "red",
                  xlab="Global Active Power(kilowatts)"))
dev.off()


