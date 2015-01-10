## download and unzip file
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")

# read file
library(sqldf)
power <- read.csv.sql(file = "household_power_consumption.txt", 
                         sql = "SELECT * FROM file WHERE DATE IN ('1/2/2007','2/2/2007')", 
                         sep = ";")

## merge Date and Time to a single field
power$Date <- as.Date(power$Date , "%d/%m/%Y")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

## plot 2
png("plot2.png", width = 480, height = 480)
plot(x = power$DateTime, y = power$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()