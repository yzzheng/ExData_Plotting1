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

## Plot 1
with(data1, hist(Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power"))
## copy to png device file
dev.copy(png, file="plot1.png")
dev.off()