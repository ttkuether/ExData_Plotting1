power_file <- "household_power_consumption.txt"
data <- read.table(power_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
usefuldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(usefuldata$Date, usefuldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datetime2 <- as.POSIXct(datetime)

png("plot3.png", height = 480, width = 480)
plot(datetime, usefuldata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, usefuldata$Sub_metering_2, col = "red")
lines(datetime, usefuldata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,  col = c("black", "red", "blue"))
dev.off()