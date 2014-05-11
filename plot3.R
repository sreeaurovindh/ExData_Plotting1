plot3<-function(){
#Read in all raw data
rawData <- read.table("hhcomp.txt", header=F, sep=";", colClasses = "character")
# Retain only the dates required
dataset <- rawData[grepl("^[12]/2/2007", rawData[,1]),]
# Bind the "Date" and "Time" columns to a single "Date/Time" column
dataset <- cbind(strptime(paste(dataset[,1], dataset[,2]), format="%d/%m/%Y %H:%M:%S"), dataset[,-c(1,2)])
# Set the column headers
names(dataset) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Open "PNG" device
png(filename="plot3.png", width=480, height=480)
# Prepare the plot, but do not add any points
plot(dataset$Date, as.numeric(dataset$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")
# Connect the dots: black is station 1, red is 2, blue is 3
lines(dataset$Date, as.numeric(dataset$Sub_metering_1), col="black")
lines(dataset$Date, as.numeric(dataset$Sub_metering_2), col="red")
lines(dataset$Date, as.numeric(dataset$Sub_metering_3), col="blue")
# Add a legend
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"))

# Close the "PNG" device
dev.off()
}