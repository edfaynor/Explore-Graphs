setwd ("F:/Exploratory Data Analysis")
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="F:/Exploratory Data Analysis/household_power_consumption.zip")
unzip(zipfile="./household_power_consumption.zip",exdir="./tempfile")
housepower <- read.table("F:/Exploratory Data Analysis/tempfile/household_power_consumption.txt",skip=1,sep=";")
names(housepower)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plotdata<-subset(housepower,housepower$Date=="1/2/2007" | housepower$Date =="2/2/2007")
plotdata$Global_active_power <- as.numeric(as.character(plotdata$Global_active_power))
plotdata$datetime <-paste(plotdata$Date, plotdata$Time)
plotdata$Sub_metering_1 <- as.numeric(as.character(plotdata$Sub_metering_1))
plotdata$Sub_metering_2 <- as.numeric(as.character(plotdata$Sub_metering_2))
plotdata$Sub_metering_3 <- as.numeric(as.character(plotdata$Sub_metering_3))
plotdata$Voltage <- as.numeric(as.character(plotdata$Voltage))
par(mfcol = c(2,2))
plot(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
plot(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Sub_metering_2, type = "l", col = "red" )
lines(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_meter_1", "Sub_meter_2", "Sub_meter_3"), cex=.65)
plot(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S"), plotdata$Global_active_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png") 
dev.off() 


png(height=450, width=450