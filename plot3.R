plot3<- function(){
  # Renamed the source file as hhcomp.txt and then loaded the whole file
  home<-read.csv("hhcomp.txt",sep=";")
  # Conversion to date format 
  home[,1]<-as.Date(home[,1],"%d/%m/%Y")
  # select the subset of dates required from the global set
  dataset<-home[home[,1]>='2007-02-01' & home[,1] <= '2007-02-02',]
  # Convert each into numeric components
  dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
  dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
  dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
 
  # Create a PNG Image of size
  png("plot3.png",width=480,height=480,bg="transparent")
  # create a plot
  with(dataset,plot(as.numeric(dataset$Sub_metering_1),type="n",xaxt="n",xlab="",ylab="Energy sub Metering"))
  lines(dataset$Sub_metering_1,col="black")
  lines(dataset$Sub_metering_2,col="red")
  lines(dataset$Sub_metering_3,col="blue")
  #Since there are 1440 instances of both thursday and friday we have got a scale starting from 0, 1440 and then to 2880
  axis(1,at=c(0,1440,2880),lab=c("Thu","Fri","Sat"))
  legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  dev.off()
}