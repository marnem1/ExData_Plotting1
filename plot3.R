library(datasets)

data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

data2 = data[66637:69516,]
data2$Date = as.Date(data2$Date,"%d/%m/%Y")
datetime = paste(data2$Date,data2$Time)
datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S")

Sub_metering_1 = data2$Sub_metering_1
Sub_metering_2 = data2$Sub_metering_2
Sub_metering_3 = data2$Sub_metering_3

png("plot3.png",width = 480,height = 480, units = "px", bg = "transparent")

plot(datetime,Sub_metering_1,type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(datetime,Sub_metering_2,type = "l",col = 2)
lines(datetime,Sub_metering_3,type = "l",col = 4)
legend("topright",
       lty = 1,
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()