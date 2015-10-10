
#Load the raw data so we can process + plot it.
# We use this function and source it in all of the plot scripts to cut down on duplicate
# code and processing time.
if (!exists("plotData"))
{
  # Load it..
  raw<-read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = FALSE)
  
  #Let's clean it up.
  dates<-as.Date(raw$Date, format="%d/%m/%Y")
  raw$Date<-dates
  startDate<-as.Date('2007-2-1')
  stopDate<-as.Date('2007-2-3')
  
  filter<-(dates >= startDate & dates < stopDate)
  plotData<-raw[filter,]
  
  # Convert input.
  plotData$Global_active_power<-as.numeric(plotData$Global_active_power)
  plotData$Global_reactive_power<-as.numeric(plotData$Global_reactive_power)
  plotData$Sub_metering_1<-as.numeric(plotData$Sub_metering_1)
  plotData$Sub_metering_2<-as.numeric(plotData$Sub_metering_2)
  plotData$Sub_metering_3<-as.numeric(plotData$Sub_metering_3)
  plotData$Voltage<-as.numeric(plotData$Voltage)  
  
  # cleanup temp data.
  rm(list = c("raw", "dates", "startDate", "stopDate", "filter"))
}
