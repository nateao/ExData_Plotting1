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

## plot 3
png("plot3.png", width = 480, height = 480)
plot(x = power$DateTime, y = power$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l", col = "black")
lines(x = power$DateTime, y = power$Sub_metering_2, col = "red")
lines(x = power$DateTime, y = power$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()