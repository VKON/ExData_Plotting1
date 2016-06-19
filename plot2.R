# Coursera 
# Exploratory Data Analysis 
# Week 1
# Viktor Konakovsky
# June 19 2016

# Instructions: reproduce plots from dataset

# URL 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
# filename 'exdata%2Fdata%2Fhousehold_power_consumption.zip'

# assume you have saved and unzipped the file in your local directory already

# setwd("C:/Users/Viktor/Desktop")

# matrix looks like this

# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 1/1/2007;00:00:00;2.580;0.136;241.970;10.600;0.000;0.000;0.000

D <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', comment.char = '', na.strings = '?') 

head(D) 
# View(D)

# do subsetting first otherwise all commands are executed on a very large dataset and take forever to execute

D1 <- D[D$Date %in% c('1/2/2007','2/2/2007'), ] # find those two strings in the Date column of D and subset them as D1
View(D1)

DateTime <- paste(D1$Date,D1$Time, sep= ' ') # combine Date and Time to a new variable DateTime
DateTimeposx <- as.POSIXlt(DateTime,format="%d/%m/%Y %H:%M:%S") # use this information as posixlt class

# reproduce second figure

# actually dont need to transform Date to Weekdays

png('Plot 2.png', width = 480, height = 480) # set dimensions of png

par(mar=c(5.1, 4.1, 4.1, 2.1)) # set margins used in tutorial videos
plot(DateTimeposx, GAP, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)') # thats type L for line, lower case

dev.off()
