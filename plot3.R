# Read input data table
pvDat = read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = "?",
                   stringsAsFactors = F)

pvDat$Time = paste(pvDat$Date, pvDat$Time)
pvDat$Date = as.Date(pvDat$Date, "%d/%m/%Y")
pvDat$Time = strptime(pvDat$Time, format = "%d/%m/%Y %H:%M:%S")

st = as.Date('01/02/2007', "%d/%m/%Y")
ed = as.Date('02/02/2007', "%d/%m/%Y")

pv = pvDat[pvDat$Date >=st & pvDat$Date <=ed, ]

# Plot figure 3
png(file = 'plot3.png', bg = 'white', width = 480, height = 480)

plot(pv$Time, pv$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
lines(pv$Time, pv$Sub_metering_1, col = 'black')
lines(pv$Time, pv$Sub_metering_2, col = 'red')
lines(pv$Time, pv$Sub_metering_3, col = 'blue')
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1, 1, 1),
       col = c('black', 'red', 'blue'), cex = 1)

dev.off()