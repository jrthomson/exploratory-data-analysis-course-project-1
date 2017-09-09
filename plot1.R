# Get data

dataFile <- "household_power_consumption.txt"

# Read data

data <- read.table(dataFile, header = TRUE, sep = ";")

# Convert the Date variable to Date classes in R using the as.Date() function

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data

subdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Get the Global_active_power

globalactivepower <- as.numeric(subdata$Global_active_power)

# Create plot

png("plot1.png", height = 480, width = 480)

# Plot the data

hist(globalactivepower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Shut down the current device

dev.off()
