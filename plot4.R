plot4<- function(){
  # Renamed the source file as hhcomp.txt and then loaded the whole file
  home<-read.csv("hhcomp.txt",sep=";")
  # Conversion o date format 
  home[,1]<-as.Date(home[,1],"%d/%m/%Y")
  # select the subset of dates required from the global set
  dataset<-home[home[,1]>='2007-02-01' & home[,1] <= '2007-02-02',]
  # Get the timeaxis
  datetime<-as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
  # Convert voltage,sub metering to numeric
  dataset$Voltage <- as.numeric(dataset$Voltage)
  dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
  dataset$Global_reactive_power <- as.numeric(dataset$Global_reactive_power)
  dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
  dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
  dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
  # Write to a PNG 
  png("plot4.png",width=480,height=480,bg="transparent")
  par(mfrow=c(2,2))
  with(dataset,{
  plot(dataset$Global_active_power*2/1000~datetime,type="l",xlab="",ylab="Global Active Power(Kilowatts)",xaxt="n",col="black")
  
  # add labels to the axis
  # The dataset is for two days. So we can get the plot by providing the start values and end values of dates
  axis(1,at=as.POSIXct(c("2007-02-01 00:00:00 MST","2007-02-02 00:00:00","2007-02-02 23:59:00")),lab=c("Thu","Fri","Sat"))
  
  
  plot(dataset$Voltage~datetime,type="l",ylab="Voltage",xlab="datetime",xaxt="n",col="black")
  
  # add labels to the axis
  # The dataset is for two days. So we can get the plot by providing the start values and end values of dates
  axis(1,at=as.POSIXct(c("2007-02-01 00:00:00 MST","2007-02-02 00:00:00","2007-02-02 23:59:00")),lab=c("Thu","Fri","Sat"))
  
  plot(as.numeric(dataset$Sub_metering_1),type="n",xaxt="n",xlab="",ylab="Energy sub Metering")
  
  lines(dataset$Sub_metering_1,col="black")
  lines(dataset$Sub_metering_2,col="red")
  lines(dataset$Sub_metering_3,col="blue")
  #Since there are 1440 instances of both thursday and friday we have got a scale starting from 0, 1440 and then to 2880
  axis(1,at=c(0,1440,2880),lab=c("Thu","Fri","Sat"))
  legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(dataset$Global_reactive_power~datetime,type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n",col="black")
  
  # add labels to the axis
  # The dataset is for two days. So we can get the plot by providing the start values and end values of dates
  axis(1,at=as.POSIXct(c("2007-02-01 00:00:00 MST","2007-02-02 00:00:00","2007-02-02 23:59:00")),lab=c("Thu","Fri","Sat"))
  })
  
  #  Write to the PNG file
  dev.off()
  
  
  
}