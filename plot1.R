power_file <- "household_power_consumption.txt"
data <- read.table(power_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
usefuldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", height = 480, width = 480)
hist(usefuldata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()