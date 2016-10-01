setwd("C:/Users/Public/Documents/R Workspace/Exploratory Data")
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
library(dplyr)
dataSet <- filter(dt, Date %in% c("1/2/2007","2/2/2007"))#Data.Frame
TimeHour <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Energy1 <- as.numeric(dataSet$Sub_metering_1)
Energy2 <- as.numeric(dataSet$Sub_metering_2)
Energy3 <- as.numeric(dataSet$Sub_metering_3)
globalActivePower <- as.numeric(dataSet$Global_active_power)
globalReactivePower <- as.numeric(dataSet$Global_reactive_power)
Volt <- as.numeric(dataSet$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) # 2 by 2
plot(TimeHour, globalActivePower, xlab = "", ylab = "Global Active Power", type = "l" )#1
plot(TimeHour, Volt, xlab = "Datetime", ylab = "Voltage", type = "l" ) #2
plot(TimeHour, Energy1, xlab = "", ylab = "Energy sub meteing", type = "l")
lines(TimeHour,Energy2, type = "l", col = "red")
lines(TimeHour,Energy3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(TimeHour, globalActivePower, type = "l", xlab = "Datetime", ylab = "Global_reactive_power")#4
dev.off()