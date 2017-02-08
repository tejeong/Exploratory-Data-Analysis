power_consumption <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
newdata <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
rm(power_consumption)
time <- strptime(paste(newdata$Date, newdata$Time), format = "%d/%m/20%y %H:%M:%S")
plot(time, newdata$Sub_metering_1, 
     ylim = c(0, 38), 
     xlab = "", 
     ylab = "Energy sub metering", 
     type = "n")
lines(time, as.numeric(as.character(newdata$Sub_metering_1)))
lines(time, as.numeric(as.character(newdata$Sub_metering_2)), col = "red")
lines(time, as.numeric(as.character(newdata$Sub_metering_3)), col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
