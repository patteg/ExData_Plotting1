# Build Plot 4

#loading data
myData <- read.table('./household_power_consumption.txt', 
                     header=TRUE, sep=';', na.strings='?')

#convert to date column
#note the uppercase Y to reflect 4 digit years
myData$Date <- as.Date(myData$Date, format='%d/%m/%Y')
myData$Time <- strptime(paste(myData$Date,myData$Time), format='%Y-%m-%d %H:%M:%S')

# set file specifics
png(file='plot4.png', width=480, height=480)

# build plot
par(mfrow=c(2,2))
with(subset(myData,Date>='2007-02-01' & Date <='2007-02-02'),{
     plot(Time, Global_active_power, 
          type = 'l', 
          col='black',
          xlab='',
          ylab='Global Active Power'
     )
     plot(Time, Voltage,
          type = 'l',
          col='black',
          xlab='datetime',
          ylab='Voltage')
     plot(Time,
          Sub_metering_1, 
          type = 'l', 
          col='black',
          xlab='',
          ylab='Energy sub metering'
     )
     lines(Time, Sub_metering_2, col = 'red')
     lines(Time, Sub_metering_3, col = 'blue')
     legend('topright', lty=c(1,1,1), col= c('black', 'red', 'blue'),
            legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))
     plot(Time, Global_reactive_power,
          type = 'l',
          col='black',
          xlab='datetime',
          ylab='Global_reactive_power')
})

#close device
dev.off()