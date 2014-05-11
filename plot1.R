plot1<- function(){
# Renamed the source file as hhcomp.txt and then loaded the whole file
home<-read.csv("hhcomp.txt",sep=";")
# Conversion to date format 
home[,1]<-as.Date(home[,1],"%d/%m/%Y")
# select the subset of dates required from the global set
dataset<-home[home[,1]>='2007-02-01' & home[,1] <= '2007-02-02',]
# Convert the global active power to numeric
dataset[,"Global_active_power"]<- as.numeric(dataset[,"Global_active_power"])
# Open the png image
png("plot1.png",width=480,height=480)
# Draw the histogram
hist(dataset$Global_active_power*2/1000,,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
#  Write to the PNG file
dev.off()
}