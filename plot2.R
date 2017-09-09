# Get data

dataFile <- "household_power_consumption.txt"

# Read data

data <- read.table(dataFile, header = TRUE, sep = ";")

# Convert the Date variable to Date classes in R using the as.Date() function

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data

subdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the Time variables to Time classes in R using the strptime() function

datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")

# Get the Global_active_power

globalactivepower <- as.numeric(subdata$Global_active_power)

# Create plot

png("plot2.png", height = 480, width = 480)

# Plot the data

plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Shut down the current device

dev.off()
