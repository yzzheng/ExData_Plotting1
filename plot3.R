data= read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
str(data)
names(data)
head(data)
data$datetime <- paste(data$Date, data$Time, sep=" ")
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, Date =="2007-02-01" | Date == "2007-02-02")
str(data1)

## plot 3
with(data1, plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
##plot(data1, lines(datetime, Sub_metering_1))
with(data1, lines(datetime, Sub_metering_2, col="red"))
with(data1, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty= c(1,1,1), pch=20, cex=0.65, lwd = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")  ## Copy my plot to a PNG file
dev.off()
