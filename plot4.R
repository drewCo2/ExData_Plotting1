
source("loadData.R")

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

