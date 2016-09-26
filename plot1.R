## Read "household_power_consumption.txt" dataset
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hpc <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = FALSE)

## Convert char to date
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
data <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Free memory                     
rm(hpc)

## Plot "Global Active Power"
hist(data$Global_active_power, main="Global Active Power",  col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Produce png file
dev.copy(png, file="plot1.png", height=480, width=480)

## Close png file
dev.off()

