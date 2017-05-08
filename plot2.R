#Source: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#Reading the data from a text file
dat <- read.table("household_power_consumption.txt"  ,sep = ";" , na.strings = "?",header = T, stringsAsFactors = FALSE)
#Converting the first column to a date format
dat$Date <- as.Date(dat$Date , format = "%d/%m/%Y")
#Subsetting the data to rows in which the dates are either 2/1/07 or 2/2/07
newdat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")
#Renaming the column names
colnames(newdat) <- c("consumption-date","consumption-time","global-active-power","global-reactive-power","voltage","global-intensity","sub-metering1","sub-metering2","sub-metering3")

##Creating the plot
#loading graphics library for plotting
library(graphics)
#Creating PNG file for the plot
png(file="plot2.png",width = 480,height = 480)
#Combining Date & Time for x-axis values
consumptionDateTime <- strptime(paste(newdat$`consumption-date`,newdat$`consumption-time`), format = "%Y-%m-%d %H:%M:%S")
plot(consumptionDateTime,newdat$`global-active-power`,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()