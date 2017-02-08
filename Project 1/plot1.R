power_consumption <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
newdata <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
rm(power_consumption)
hist(as.numeric(as.character(newdata$Global_active_power)), 
     main = "Global Active Power",
     xlab = "Global Active Power (killowatts)",
     col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
