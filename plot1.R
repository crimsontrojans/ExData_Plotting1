## read in the data
class<-c("character", "character", rep("numeric",7)) 
data<-read.table("household_power_consumption.txt", sep=";", colClasses=class, header=TRUE, na.strings="?")

## coerce the Date column as dates
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## subset to the appropriate time range
data<-data[data$Date >="2007-02-01" & data$Date <="2007-02-02",  ]

## plot the graph
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

## alternatively
# dev.copy(png, file="plot1.png", height=480, width=480)
# dev.off()