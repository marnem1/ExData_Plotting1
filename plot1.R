library(datasets)

data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

data2 = data[66637:69516,]

png("plot1.png",width = 480,height = 480,units = "px",bg = "transparent")

hist(data2$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red")

dev.off()