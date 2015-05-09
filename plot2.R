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

## plot the graph
png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$dateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()