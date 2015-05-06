## Import the file
colClasses <- c("character","character",rep("numeric",7))
power.raw<-read.table("household_power_consumption.txt",
                      header = T, sep = ";", na.strings = "?",
                      colClasses = colClasses,
                      nrows = 2100000)

## Extract 01/02/2007 and 02/02/2007 only
power.extracted <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

## Change Date and Time to DateTime format
power.extracted$DateTime <-strptime(DateTime, "%d/%m/%Y %H:%M:%S")

##Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot4.1 <- plot(power.extracted$DateTime,power.extracted$Global_active_power,
                type = "l", 
                xlab = NA, ylab = "Global Active Power (killowatts)")
plot4.2 <- plot(power.extracted$DateTime,power.extracted$Voltage,
                type = "l", 
                xlab = "datetime", ylab = "Voltage")
plot4.3 <- plot(power.extracted$DateTime,power.extracted$Sub_metering_1, 
                type = "l",
                xlab = NA, ylab = "Energy sub metering")
lines(power.extracted$DateTime, power.extracted$Sub_metering_2, col = "red")
lines(power.extracted$DateTime, power.extracted$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","red","blue"))
plot4.4 <- plot(power.extracted$DateTime,power.extracted$Global_reactive_power,
                type = "l", 
                xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
