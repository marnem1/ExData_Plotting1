library(datasets)

data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

data2 = data[66637:69516,]
data2$Date = as.Date(data2$Date,"%d/%m/%Y")
datetime = paste(data2$Date,data2$Time)
datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S")

png("plot2.png",width = 480,height = 480,units = "px",bg = "transparent")

plot(datetime,data2$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab = "")

dev.off()