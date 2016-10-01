setwd("C:/Users/Public/Documents/R Workspace/Exploratory Data")
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
library(dplyr)
dataSet <- filter(dt, Date %in% c("1/2/2007","2/2/2007"))#Data.Frame
png("plot1.png", width=480, height=480)
hist(as.numeric(dataSet$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()