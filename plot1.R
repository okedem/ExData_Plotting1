# Exploratory Data Analysis, course project 1, plot 1
# This code uses the sqldf package, use the commented-out command below if needed.

%install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";",
                      sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n")
png(file='plot1.png')
with(data,hist(Global_active_power,main='Global Active Power',xlab='Global active power (kilowatts)',col='red'))
dev.off()