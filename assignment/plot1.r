df <- read.table('C:/Users/JUN/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt', sep = ';', header = T, dec = '.')
df$Date <- as.character(df$Date)
df$Date <- as.Date(df$Date, '%d/%m/%Y')
df2 <- df[df$Date >= '2007-2-1' & df$Date <= '2007-2-2',]
df2$Datetime <- paste(df2$Date,df2$Time)
df2$Date <- NULL
df2$Time <- NULL
df2$Datetime <- strptime(df2$Datetime, '%Y-%m-%d %H:%M:%S')
df2$Global_active_power <- as.numeric(levels(df2$Global_active_power))[df2$Global_active_power]
df2$Sub_metering_1 <- as.numeric(levels(df2$Sub_metering_1))[df2$Sub_metering_1]
df2$Sub_metering_2 <- as.numeric(levels(df2$Sub_metering_2))[df2$Sub_metering_2]
df2$Sub_metering_3 <- as.numeric(levels(df2$Sub_metering_3))[df2$Sub_metering_3]
df2$Voltage <- as.numeric(levels(df2$Voltage))[df2$Voltage]
df2$Global_reactive_power <- as.numeric(levels(df2$Global_reactive_power))[df2$Global_reactive_power]
any(is.na(df2))



### first plot
png('plot1.png')
with(df2, hist(df2$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts) '))
dev.off()


