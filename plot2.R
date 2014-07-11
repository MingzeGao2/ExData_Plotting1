plot2 <- function(directory = "household_power_consumption.txt")
{
	library(sqldf) # use sqldf to query the data with specified date
	mysql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' "
	raw <- read.csv2.sql(directory,mysql)	
	x <- as.POSIXct(strptime(paste(raw$Date, raw$Time), "%d/%m/%Y %H:%M:%S")) 
	plot(x, raw$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
	lines(x, raw$Global_active_power)
}