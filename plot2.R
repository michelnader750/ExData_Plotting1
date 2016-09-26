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

## Plot "Global Active Power" x "datetime"
plot(data$datetime, data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Produce png file
dev.copy(png, file="plot2.png", height=480, width=480)

## Close png file
dev.off()

