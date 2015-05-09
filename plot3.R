## read in the data
class<-c("character", "character", rep("numeric",7)) 
data<-read.table("household_power_consumption.txt", sep=";", colClasses=class, header=TRUE, na.strings="?")

## coerce the Date column as dates
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## subset to the appropriate time range
data<-data[data$Date >="2007-02-01" & data$Date <="2007-02-02",  ]

## combine date and time as a string then convert to time
dateTime <- paste(data$Date, data$Time)
data$dateTime <- as.POSIXct(dateTime)

## plot the graph and relevant lines
png("plot3.png", width=480, height=480)

plot(data$Sub_metering_1~data$dateTime, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$dateTime, col="red")
lines(data$Sub_metering_3~data$dateTime, col="blue")

## add a legend
colors=c("black", "red", "blue")
legend("topright", col=colors, lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()