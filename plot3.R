
source("loadData.R")

# Setup Parameters
filename<-"plot3.png"

ylab<-"Energy sub metering"
data<-as.numeric(plotData$Global_active_power)

s1<-plotData$Sub_metering_1
s2<-plotData$Sub_metering_2
s3<-plotData$Sub_metering_3

dates<-as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

# Put it in a function for convenience.  We will plot to window + file for
# convenience / debugging.
plotFunc<-function()
{
  par(mfrow=c(1,1), lwd=1)
  plot(x=dates, y=s1, col="black", type="l", ylab=ylab, xlab="")  
  lines(x=dates, y=s2, col="red")  
  lines(x=dates, y=s3, col="blue")
  legend("topright", lwd=5, lty=1, col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
}
plotFunc()

# Write the plot to disk...
png(filename, width=480, height=480, units="px")
plotFunc()
dev.off()

