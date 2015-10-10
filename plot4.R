
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

# Setup Parameters
filename<-"plot4.png"
xlab<-"Gloabl Active Power (kilowatts)"
title<-"Global Active Power"
data<-as.numeric(plotData$Global_active_power)

# Put it in a function for convenience.  We will plot to window + file for
# convenience / debugging.
plotFunc<-function()
{
  hist(data, freq=TRUE, xlab=xlab, col="red", main = title)
}
plotFunc()

# Write the plot to disk...
png(filename, width=480, height=480, units="px")
plotFunc()
dev.off()

