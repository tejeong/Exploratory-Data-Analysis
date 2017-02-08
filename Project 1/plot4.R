power_consumption <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
newdata <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
rm(power_consumption)
time <- strptime(paste(newdata$Date, newdata$Time), format = "%d/%m/20%y %H:%M:%S")
par(mfrow = c(2, 2))

plot(time, newdata$Global_active_power, 
     ylim = c(0, 6.5), 
     xlab = "", 
     ylab = "Global Active Power", 
     type = "n")
lines(time, as.numeric(as.character(newdata$Global_active_power)))

plot(time, newdata$Global_active_power, 
     ylim = c(234, 246), 
     xlab = "datetimes", 
     ylab = "Voltage", 
     type = "n")
lines(time, as.numeric(as.character(newdata$Voltage)))

plot(time, newdata$Sub_metering_1, 
     ylim = c(0, 38), 
     xlab = "", 
     ylab = "Energy sub metering", 
     type = "n")
lines(time, as.numeric(as.character(newdata$Sub_metering_1)))
lines(time, as.numeric(as.character(newdata$Sub_metering_2)), col = "red")
lines(time, as.numeric(as.character(newdata$Sub_metering_3)), col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(time, newdata$Global_reactive_power, 
     ylim = c(0.0, 0.5), 
     xlab = "datetimes", 
     ylab = "Global_reactive_power", 
     type = "n")
lines(time, as.numeric(as.character(newdata$Global_reactive_power)))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
