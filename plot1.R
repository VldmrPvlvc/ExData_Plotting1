consumption<-read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F);

twoDaysConsumption<-subset(consumption, (consumption$Date == "1/2/2007" | consumption$Date== "2/2/2007")) 

png(filename="plot1.png",width=480, height=480)

hist(twoDaysConsumption$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")

dev.off()
