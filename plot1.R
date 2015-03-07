# Read input data table
pvDat = read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = "?",
                   stringsAsFactors = F)

pvDat$Time = paste(pvDat$Date, pvDat$Time)
pvDat$Date = as.Date(pvDat$Date, "%d/%m/%Y")
pvDat$Time = strptime(pvDat$Time, format = "%d/%m/%Y %H:%M:%S")

st = as.Date('01/02/2007', "%d/%m/%Y")
ed = as.Date('02/02/2007', "%d/%m/%Y")

pv = pvDat[pvDat$Date >=st & pvDat$Date <=ed, ]

# Plot figure 1
png(file = 'plot1.png', bg = 'white', width = 480, height = 480)

hist(pv$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
