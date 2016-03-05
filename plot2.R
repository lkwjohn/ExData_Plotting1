#ensure that the txt file is within the same directory
getwd()
setwd("/Users/john/Desktop/rstudio/coursera/class4")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   colClasses=c("character", "character", rep("numeric",7)) , na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

fechas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% fechas)

png('/Users/john/Desktop/rstudio/coursera/class4/plot2.png', width = 480, height = 480)
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power  (kilowatts)", type = "l")
dev.off()



