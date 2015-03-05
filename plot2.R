# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February 2007. 
# The task is to reconstruct the Coursera assignment plots, all of which were constructed using the base plotting system.

# The data can be downloaded from UC Irvine Machine Learning Repository
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# Needs to be unzipped into the working directory prior to running this script

# Read the household data and select only the data from Feb 1 to Feb 2
data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
data <- subset(data, as.Date(data$Date, format = "%d/%m/%Y") >= as.Date("2007-02-01", format = "%Y-%m-%d"))
data <- subset(data, as.Date(data$Date, format = "%d/%m/%Y") <= as.Date("2007-02-02", format = "%Y-%m-%d"))

# Combine dates and times together
Date_time <- paste(data$Date, data$Time)
Date_time <- as.POSIXct(strptime(Date_time, format = "%d/%m/%Y %H:%M:%S"))

# Save a line graph plotting the Global active power data points for each minute within the time period
png(filename = "plot2.png")
plot(Date_time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
