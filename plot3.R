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

##Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot3 <- plot(power.extracted$DateTime,power.extracted$Sub_metering_1, 
              type = "l",
              xlab = NA, ylab = "Energy sub metering")
lines(power.extracted$DateTime, power.extracted$Sub_metering_2, col = "red")
lines(power.extracted$DateTime, power.extracted$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","red","blue"))
dev.off()
