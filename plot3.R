
# Read the raw data
raw <- read.table('household_power_consumption.txt',
				  sep=";",
				  header=TRUE,
				  na.strings=c("","?","NA"),
				  colClasses=c("character", "character",
				  rep("numeric",7)))

# Get the subset of data with date range 1/2/2007 - 2/2/2007
data <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")

# Add a datetime column we can use to plot the data
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Create the png graphic device
png(file="plot3.png",width=480,height=480)

# Plot the graph
plot(data$Sub_metering_1~data$DateTime,
	 col="black",
	 type="l",
	 xlab=NA,
	 ylab="Energy sub metering")
lines(data$Sub_metering_2~data$DateTime, col="red", type="l")
lines(data$Sub_metering_3~data$DateTime, col="blue", type="l")
legend("topright",
	   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	   lwd=1,
	   col=c("black", "red", "blue"))
  
# Finish the png
dev.off()