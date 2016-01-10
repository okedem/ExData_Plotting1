# Exploratory Data Analysis, course project 1, plot 2
# This code uses the sqldf package, use the commented-out command below if needed.

#install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";",
                      sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n")
data$meas_time = paste(data$Date,' ',data$Time)
data$postime = strptime(data$meas_time, format='%d/%m/%Y %H:%M:%S')

png(file='plot2.png')
with(data,plot(postime,Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='l',col='black'))
dev.off()


