power_consumption <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
newdata <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
rm(power_consumption)
time <- strptime(paste(newdata$Date, newdata$Time), format = "%d/%m/20%y %H:%M:%S")
plot(time, newdata$Global_active_power, 
     ylim = c(0, 8), 
     xlab = "", 
     ylab = "Global Active Power (killowatts)", type = "n")
lines(time, as.numeric(as.character(newdata$Global_active_power)))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
