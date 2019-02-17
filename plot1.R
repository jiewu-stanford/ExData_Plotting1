library('data.table')
## read in data
pwrDT <- fread('household_power_consumption.txt',na.strings='?')

## select dates between 2007-02-01 and 2007-02-02
pwrDT$Date <- as.Date(pwrDT$Date,'%d/%m/%Y')
pwrDT <- pwrDT[(Date >= '2007-02-01') & (Date <= '2007-02-02'),]

## plot into a PNG file
png('plot1.png', width = 480, height = 480)
hist(pwrDT[,Global_active_power], main='Global Active Power',
        xlab='Global Active Power (kilowatts)',ylab='Frequency',col='red')
dev.off()