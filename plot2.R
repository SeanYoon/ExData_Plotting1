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

##Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot2 <- plot(power.extracted$DateTime,power.extracted$Global_active_power,
              type = "l", 
              xlab = NA, ylab = "Global Active Power (killowatts)")
dev.off()
