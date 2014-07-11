plot3 <- function(directory = "household_power_consumption.txt")
{
	library(sqldf) # use sqldf to query the data with specified date
	mysql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' "
	raw <- read.csv2.sql(directory,mysql)	
	x <- as.POSIXct(strptime(paste(raw$Date, raw$Time), "%d/%m/%Y %H:%M:%S")) 
	plot(x, raw$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
	lines(x, raw$Sub_metering_1)
	lines(x, raw$Sub_metering_2, col = "red")
	lines(x, raw$Sub_metering_3, col = "blue")
	legend("topright", col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty  = 1)
}