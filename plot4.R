# Read input data table
pvDat = read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = "?",
                   stringsAsFactors = F)

pvDat$Time = paste(pvDat$Date, pvDat$Time)
pvDat$Date = as.Date(pvDat$Date, "%d/%m/%Y")
pvDat$Time = strptime(pvDat$Time, format = "%d/%m/%Y %H:%M:%S")

st = as.Date('01/02/2007', "%d/%m/%Y")
ed = as.Date('02/02/2007', "%d/%m/%Y")

pv = pvDat[pvDat$Date >=st & pvDat$Date <=ed, ]

# Plot figure 4
png(file = 'plot4.png', bg = 'white', width = 480, height = 480)

par(mfrow = c(2, 2))
#1
plot(pv$Time, pv$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")
#2
plot(pv$Time, pv$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")
#3
plot(pv$Time, pv$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
lines(pv$Time, pv$Sub_metering_1)
lines(pv$Time, pv$Sub_metering_2, col = 'red')
lines(pv$Time, pv$Sub_metering_3, col = 'blue')
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1, 1, 1),
       col = c('grey', 'red', 'blue'), cex = 1, bty = "n")
#4
plot(pv$Time, pv$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()