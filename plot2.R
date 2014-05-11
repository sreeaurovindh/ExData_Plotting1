plot2<- function(){
  # Renamed the source file as hhcomp.txt and then loaded the whole file
  home<-read.csv("hhcomp.txt",sep=";")
  # Conversion o date format 
  home[,1]<-as.Date(home[,1],"%d/%m/%Y")
  # select the subset of dates required from the global set
  dataset<-home[home[,1]>='2007-02-01' & home[,1] <= '2007-02-02',]
  # Get the timeaxis
  timeAxis<-as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
  # Write to a PNG 
  png("plot2.png",width=480,height=480,bg="transparent")
  plot(dataset$Global_active_power*2/1000~timeAxis,type="l",xlab="",ylab="Global Active Power(Kilowatts)",xaxt="n",col="black")
  
  # add labels to the axis
  # The dataset is for two days. So we can get the plot by providing the start values and end values of dates
  axis(1,at=as.POSIXct(c("2007-02-01 00:00:00 MST","2007-02-02 00:00:00","2007-02-02 23:59:00")),lab=c("Thu","Fri","Sat"))
  #  Write to the PNG file
  dev.off()
  

  
}