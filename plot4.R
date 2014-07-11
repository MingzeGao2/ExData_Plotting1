plot4 <- function(directory = "household_power_consumption.txt")
{
	library(sqldf) # use sqldf to query the data with specified date
	mysql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' "
	raw <- read.csv2.sql(directory,mysql)
	par(mfrow = c(2,2), mar = c(4,4,4,4), oma = c(4,4,4,4))		
	x <- as.POSIXct(strptime(paste(raw$Date, raw$Time), "%d/%m/%Y %H:%M:%S")) 
	plot(x, raw$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
	lines(x, raw$Global_active_power)

	plot(x, raw$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
	lines(x, raw$Voltage)

	plot(x, raw$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
	lines(x, raw$Sub_metering_1)
	lines(x, raw$Sub_metering_2, col = "red")
	lines(x, raw$Sub_metering_3, col = "blue")
	legend("topright", col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty  = 1)

	plot(x, raw$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
	lines(x, raw$Global_reactive_power)

}