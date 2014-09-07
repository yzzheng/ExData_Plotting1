## read data file into R
data <- read.table("household_power_consumption.txt", head=T, sep=";", stringsAsFactors=F)
str(data)
## change data $Date variable to date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## subset data from the dates 2007-02-01 and 2007-02-02
data1 <- data[data$Date == "2007-02-01"| data$Date=="2007-02-02", ]
str(data1)
## change variable $Global_active_power to numeric type
data1$Global_active_power <- as.numeric(data1$Global_active_power)
## combine Date and Time columns to one variable
data1$datetime=paste(data1$Date, data1$Time, sep=" ")
str(data1)
## change datetime to POSIXlt date time type
data1$datetime = strptime(data1$datetime, format= "%Y-%m-%d %H:%M:%S")

## Plot 3
with(data1, {
  plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
})
## add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd = c(1,1,1), cex = 0.65, col=c("black", "red", "blue"))
## save to png file
dev.copy(png, file="plot3.png")
dev.off()