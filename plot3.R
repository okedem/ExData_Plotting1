# Exploratory Data Analysis, course project 1, plot 3
# This code uses the sqldf package, use the commented-out command below if needed.

%install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";",
                      sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n")
data$meas_time = paste(data$Date,' ',data$Time)
data$postime = strptime(data$meas_time, format='%d/%m/%Y %H:%M:%S')

png(file='plot3.png')
with(data,plot(postime,Sub_metering_1,ylab='Energy sub metering',xlab='',type='l',col='black'))
with(data,lines(postime,Sub_metering_2,type='l',col='red'))
with(data,lines(postime,Sub_metering_3,type='l',col='blue'))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
