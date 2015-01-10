## download and unzip file
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")

# read file
library(sqldf)
power <- read.csv.sql(file = "household_power_consumption.txt", 
                      sql = "SELECT * FROM file WHERE DATE IN ('1/2/2007','2/2/2007')", 
                      sep = ";")

## plot 1
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power")
dev.off()