
setwd ("F:/Exploratory Data Analysis")
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="F:/Exploratory Data Analysis/household_power_consumption.zip")
unzip(zipfile="./household_power_consumption.zip",exdir="./tempfile")
housepower <- read.table("F:/Exploratory Data Analysis/tempfile/household_power_consumption.txt",skip=1,sep=";")
names(housepower)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plotdata<-subset(housepower,housepower$Date=="1/2/2007" | housepower$Date =="2/2/2007")
plotdata$Global_active_power <- as.numeric(as.character(plotdata$Global_active_power))
hist(plotdata$Global_active_power, col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off() 




