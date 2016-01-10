# Exploratory Data Analysis, course project 1, plot 4
# This code uses the sqldf package, use the commented-out command below if needed.

%install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";",
                      sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n")
data$meas_time = paste(data$Date,' ',data$Time)
data$postime = strptime(data$meas_time, format='%d/%m/%Y %H:%M:%S')

png(file='plot4.png')
par(mfrow = c(2,2))
with(data,{
    plot(postime,Global_active_power,ylab='Global Active Power',xlab='',type='l',col='black')
    plot(postime,Voltage,ylab='Voltage',xlab='datetime',type='l',col='black')
    plot(postime,Sub_metering_1,ylab='Energy sub metering',xlab='',type='l',col='black')
    lines(postime,Sub_metering_2,type='l',col='red')
    lines(postime,Sub_metering_3,type='l',col='blue')
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(postime,Global_reactive_power,ylab='Global_reactive_power',xlab='datetime',type='l',col='black')
})
dev.off()

