## Read "household_power_consumption.txt" dataset
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hpc <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = FALSE)

## Convert char to date
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
data <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Free memory                     
rm(hpc)

## Create New Field "datetime"
data$datetime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

## Convert class date "POSIXlt" to "POSIXct"
data$datetime <- as.POSIXct(data$datetime)

## Create png file
png("plot3.png", height=480, width=480, type="windows")

## Plot "Energy sub metering" depending on "datetime"
with(data, plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="", col='black'))
with(data, lines(Sub_metering_2~datetime,col='Red'))
with(data, lines(Sub_metering_3~datetime,col='Blue'))
        
legend("topright", col=c("black", "red", "blue"), lty=1,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7)

## Close png file
dev.off()

