
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
png(file="plot2.png",width=480,height=480)

# Plot the graph
plot(data$Global_active_power~data$DateTime,
	 type="l",
	 xlab=NA,
	 ylab="Global Active Power (kilowatts)")
  
# Finish the png
dev.off()