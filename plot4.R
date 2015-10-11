power_file <- "household_power_consumption.txt"
data <- read.table(power_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
usefuldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(usefuldata$Date, usefuldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime2, usefuldata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, usefuldata$Voltage, type = "l", ylab = "Voltage")

plot(datetime, usefuldata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, usefuldata$Sub_metering_2, col = "red")
lines(datetime, usefuldata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,  col = c("black", "red", "blue"))

plot(datetime, usefuldata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
dev.off()