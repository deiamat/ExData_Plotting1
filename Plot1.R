#Andreia's project

#read data into R

power_consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

#Convert factor to date
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consumption$Global_active_power <- as.numeric(as.character(power_consumption$Global_active_power))

#Subsetting dates: 01/02/2007 and 02/02/2007
powerSub <- power_consumption[(power_consumption$Date=="2007/02/01" | power_consumption$Date=="2007/02/02"),]



#checking head and tail of the dataset
head(powerSub)
tail(powerSub)

str(power_consumption)
#Checking size of the dataset
dim(powerSub)

#Checking Summary
summary(powerSub)
View(powerSub)

#Plotting a histogram (Plot1.png)

png(file='plot1.png', width=480, height = 480, units="px")
with(powerSub, hist(Global_active_power, col="Red", xlab= "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
dev.off()
