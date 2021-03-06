consumption<-read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F, skip=66637, nrows=2880,header=F);
names(consumption) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") 
png(filename="plot4.png",width=480, height=480)
par(mfcol=c(2,2))
plot(consumption$DateTime, consumption$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main="", type="l", col="black")
plot(consumption$DateTime, consumption$Sub_metering_1, xlab="",  ylab="Energy sub metering", main="", type="l", col="black")
lines(consumption$DateTime, consumption$Sub_metering_2, col="red")
lines(consumption$DateTime, consumption$Sub_metering_3, col="blue")
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(consumption$DateTime, consumption$Voltage, xlab="datetime", ylab="Voltage", main="", type="l", col="black")
plot(consumption$DateTime, consumption$Global_reactive_power, ylab="Global_reactive_power", main="", type="l", col="black", xlab="datetime")
dev.off()
