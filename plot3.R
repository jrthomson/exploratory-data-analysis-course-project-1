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

# Get the submetering values 1-3

submeter1 <- as.numeric(subdata$Sub_metering_1)
submeter2 <- as.numeric(subdata$Sub_metering_2)
submeter3 <- as.numeric(subdata$Sub_metering_3)

# Create plot as 2x2 matrix

png("plot3.png", height = 480, width = 480)

# Plot the data

plot(datetime, submeter1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

# Shut down the current device

dev.off()
