plot1 <- function(directory = "household_power_consumption.txt")# directory should include your file name
{
	library(sqldf) # use sqldf to query the data with specified date
	mysql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' "
	raw <- read.csv2.sql(directory,mysql)
	hist(raw$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
	dev.copy(png, file = "plot1.png")
	dev.off()
}