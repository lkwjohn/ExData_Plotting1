#ensure that the txt file is within the same directory
getwd()
setwd("/Users/john/Desktop/rstudio/coursera/class4")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   colClasses=c("character", "character", rep("numeric",7)) , na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

fechas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% fechas)


par(mfrow = c(2,2))
png('/Users/john/Desktop/rstudio/coursera/class4/plot4.png', width = 480, height = 480)

plot(data$Time, data$Global_active_power, xlab="", ylab="Global active power", type="l")

plot(data$Time, data$Voltage, xlab="", ylab="Voltage", type="l")

plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l", col = "black")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

plot(data$Time, data$Global_reactive_power, xlab="", ylab="Global_reactive_power", type="l")

dev.off()
