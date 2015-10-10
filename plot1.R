
#Load the raw data so we can process + plot it.
if (!exists("plotData"))
{
  # Load it..
  raw<-read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = FALSE)
  
  #Let's clean it up.
  dates<-as.Date(raw$Date, format="%d/%m/%Y")
  startDate<-as.Date('2007-2-1')
  stopDate<-as.Date('2007-2-3')
  
  filter<-(dates >= startDate & dates < stopDate)
  plotData<-raw[filter,]
  
  rm(list = c("raw", "dates", "startDate", "stopDate", "filter"))
}

xlab<-"Gloabl Active Power (kilowatts)"
title<-"Global Active Power"
data<-as.numeric(plotData$Global_active_power)
# data<-data[!is.na(data)]

hist(data, freq=TRUE, xlab=xlab, col="red", main = "Global Active Power")

png("plot1.png", width=480, height=480, units="px")
hist(data, freq=TRUE, xlab=xlab, col="red", main = "Global Active Power")
dev.off()
