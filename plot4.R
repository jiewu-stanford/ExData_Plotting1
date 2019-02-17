library('data.table')
## read in data
pwrDT <- fread('household_power_consumption.txt',na.strings='?')

## select dates between 2007-02-01 and 2007-02-02
pwrDT[,dateTime := as.POSIXct(paste(Date,Time),
                                format = '%d/%m/%Y %H:%M:%S')]
## need to set the end date to be 2007-02-03 otherwise 2007-02-02 data are lost
## use dim(pwrDT) to check it out, which should be 2881
pwrDT <- pwrDT[(dateTime >= '2007-02-01') & (dateTime <= '2007-02-03'),]

## plot into a PNG file
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
## plot 1
plot(pwrDT[,dateTime],pwrDT[,Global_active_power],type='l',
                            xlab='',ylab='Global Active Power')
## plot 2
plot(pwrDT[,dateTime],pwrDT[,Voltage],type='l',
                            xlab='datetime',ylab='Voltage')
## plot 3
plot(pwrDT[, dateTime], pwrDT[, Sub_metering_1],col='black',type='l',
                            xlab='', ylab='Energy sub metering')
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_2],col='red')
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_3],col='blue')
legend('topright',
       col=c('black','red','blue'),
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
## plot 4
plot(pwrDT[,dateTime],pwrDT[,Global_reactive_power],type='l',
        xlab='datetime',ylab='Glbal_reactive_power')
dev.off()