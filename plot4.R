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

# Get the Global_reactive_power

globalreactivepower <- as.numeric(subdata$Global_reactive_power)

# Get the voltage

volt <-as.numeric(subdata$Voltage)

# Get the submetering values 1-3

submeter1 <- as.numeric(subdata$Sub_metering_1)
submeter2 <- as.numeric(subdata$Sub_metering_2)
submeter3 <- as.numeric(subdata$Sub_metering_3)

# Create plot as 2x2 matrix

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))

# Plot the data

plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(datetime, volt, type ="l", ylab = "Voltage",  xlab ="datetime")
## space for plot 3
plot(datetime, globalreactivepower, type = "l", ylab="Global_reactive_power", xlab="datetime")


dev.off()
