data= read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
str(data)
names(data)
head(data)
data$datetime <- paste(data$Date, data$Time, sep=" ")
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, Date =="2007-02-01" | Date == "2007-02-02")
str(data1)

## Plot 1
hist(data1$Global_active_power, xlab = "Global Active Power(kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="plot1.png") ## Copy my plot to a PNG file
dev.off()