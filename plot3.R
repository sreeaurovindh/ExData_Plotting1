plot3<-function(){
#Read in all raw data
rawData <- read.table("hhcomp.txt", header=F, sep=";", colClasses = "character")
# Retain only the dates required
dataset <- rawData[grepl("^[12]/2/2007", rawData[,1]),]
dataset <- cbind(strptime(paste(dataset[,1], dataset[,2]), format="%d/%m/%Y %H:%M:%S"), dataset[,-c(1,2)])
# Column headers
names(dataset) <- c("Date-Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Open Png Image
png(filename="plot3.png", width=480, height=480)
# Dont add the points just create the plot
plot(dataset$Date, as.numeric(dataset$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")

lines(dataset$Date, as.numeric(dataset$Sub_metering_1), col="black")
lines(dataset$Date, as.numeric(dataset$Sub_metering_2), col="red")
lines(dataset$Date, as.numeric(dataset$Sub_metering_3), col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black", "red", "blue"))

# close png image
dev.off()
}