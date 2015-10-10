
source("loadData.R")

# Setup Parameters
filename<-"plot4.png"
dates<-as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

# Put it in a function for convenience.  We will plot to window + file for
# convenience / debugging.
plotFunc<-function()
{
  par(mfrow=c(2,2), lwd=1)
  
  #copy/paste from plot2.R
  plot(x=dates, y=plotData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  #2
  plot(x=dates, y=plotData$Voltage, type="l", ylab="Voltage", xlab="datetime")

  #Copy/Paste from plot3.R
  plot(x=dates, y=s1, col="black", type="l", xlab="", ylab="Global Active Power")  
  lines(x=dates, y=s2, col="red")  
  lines(x=dates, y=s3, col="blue")
  legend("topright", lwd=5, lty=1, col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
  
  #4
  plot(x=dates, y=plotData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}
plotFunc()

# Write the plot to disk...
png(filename, width=480, height=480, units="px")
plotFunc()
dev.off()

