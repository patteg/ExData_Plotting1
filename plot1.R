# Build Plot 1

#loading data
myData <- read.table('./household_power_consumption.txt', 
                     header=TRUE, sep=';', na.strings='?')

#convert to date column
#note the uppercase Y to reflect 4 digit years
myData$Date <- as.Date(myData$Date, format='%d/%m/%Y')
myData$Time <- strptime(paste(myData$Date,myData$Time), format='%Y-%m-%d %H:%M:%S')

# set file specifics
png(file='plot1.png', width=480, height=480)

# build plot
with(subset(myData,Date>='2007-02-01' & Date <='2007-02-02'), 
     hist(Global_active_power, 
          col='red',
          main='Global Active Power',
          xlab='Global Active Power (kilowatts)'
     )
)

#close device
dev.off()