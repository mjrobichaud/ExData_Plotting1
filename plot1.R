
# Read the raw data
raw <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings=c("","?","NA"), colClasses=c("character", "character", rep("numeric",7)))

# Get the subset of data with date range 1/2/2007 - 2/2/2007
data <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")

# Create the png graphic device
png(file="plot1.png",width=480,height=480)

# Plot the histogram
hist(data$Global_active_power, col=c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", xlim=c(0, 6), ylim=c(0,1200))
  
# Finish the png
dev.off()