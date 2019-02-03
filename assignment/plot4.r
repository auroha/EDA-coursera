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

### fourth plot
png('plot4.png')
par(mfrow = c(2,2))
plot(df2$Datetime, df2$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
plot(df2$Datetime, df2$Voltage, xlab = '', ylab = 'Voltage', type = 'l')
plot(df2$Datetime, df2$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(df2$Datetime, df2$Sub_metering_2, type = 'l', col = 'red')
lines(df2$Datetime, df2$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1, cex = .65, pt.cex = 1)
plot(df2$Datetime,df2$Global_reactive_power, type = 'l', xlab = '', ylab = 'Global_reactive_power')
dev.off()