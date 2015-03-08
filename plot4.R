library(datasets)

data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

data2 = data[66637:69516,]
data2$Date = as.Date(data2$Date,"%d/%m/%Y")
datetime = paste(data2$Date,data2$Time)
datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S")

png("plot4.png",width = 480,height = 480,units = "px",bg = "transparent")

par(mfrow = c(2,2))
plot(datetime,data2$Global_active_power,type = "l",
     ylab = "Global Active Power",xlab = "")

plot(datetime,data2$Voltage,type = "l",xlab = "datetime",
     ylab = "Voltage")

plot(datetime,Sub_metering_1,type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(datetime,Sub_metering_2,type = "l",col = 2)
lines(datetime,Sub_metering_3,type = "l",col = 4)
legend("topright",
       lty = 1,
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime,data2$Global_reactive_power,type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()