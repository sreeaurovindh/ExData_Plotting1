plot2<- function(){
  # Renamed the source file as hhcomp.txt and then loaded the whole file
  home<-read.csv("hhcomp.txt",sep=";")
  # Conversion to date format 
  home[,1]<-as.Date(home[,1],"%d/%m/%Y")
  # select the subset of dates required from the global set
  dataset<-home[home[,1]>='2007-02-01' & home[,1] <= '2007-02-02',]
  # get the week day
  dataset<-cbind(dataset,weekday)
  # Write to a PNG 
  png("plot2.png",width=480,height=480,bg="transparent")
  plot(dataset$Global_active_power*2/1000,type="l",xlab="",ylab="Global Active Power(Kilowatts)",xaxt="n",col="black")
  # add labels to the axis
  axis(1,at=c(0,1450,2900),lab=c("Thu","Fri","Sat"))
  #  Write to the PNG file
  dev.off()
  
  
  
  
}