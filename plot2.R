setwd("C:/Users/Public/Documents/R Workspace/Exploratory Data")
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
library(dplyr)
dataSet <- filter(dt, Date %in% c("1/2/2007","2/2/2007"))#Data.Frame
TimeHour <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(TimeHour, globalActivePower, xlab = "", ylab = "Global Active Power Kilowatts", type = "l" )
dev.off()
