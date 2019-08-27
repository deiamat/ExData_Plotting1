#Andreia's project

#read data into R

power_consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE, na.strings="?")


#Converting data and Subsetting dates: 01/02/2007 and 02/02/2007
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consumption$Time <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")
power_consumption$Sub_metering_1 <- as.numeric(power_consumption$Sub_metering_1)
power_consumption$Sub_metering_2 <- as.numeric(power_consumption$Sub_metering_2)
power_consumption$Sub_metering_3 <- as.numeric(power_consumption$Sub_metering_3)
power_consumption$Global_reactive_power <- as.numeric(power_consumption$Global_reactive_power)

powerSub <- power_consumption[(power_consumption$Date=="2007/02/01" | power_consumption$Date=="2007/02/02"),]

#set language

dev_null <- Sys.setlocale("LC_TIME", "english")


#Plot 2

png (file='plot2.png', width=480, height=480, units="px")
with(powerSub,(plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")))
dev.off()
