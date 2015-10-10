
source("loadData.R")

# Setup Parameters
filename<-"plot2.png"
ylab<-"Gloabl Active Power (kilowatts)"
data<-as.numeric(plotData$Global_active_power)
dates<-as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

# Put it in a function for convenience.  We will plot to window + file for
# convenience / debugging.
plotFunc<-function()
{
  plot(x=dates, y=data, type="l", xlab="", ylab=ylab)
}
plotFunc()

# Write the plot to disk...
png(filename, width=480, height=480, units="px")
plotFunc()
dev.off()

