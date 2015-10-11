power_file <- "household_power_consumption.txt"
data <- read.table(power_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
usefuldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(usefuldata$Date, usefuldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datetime2 <- as.POSIXct(datetime)

png("plot2.png", height=480, width = 480)
plot(datetime2, usefuldata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
