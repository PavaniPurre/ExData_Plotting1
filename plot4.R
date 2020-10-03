setwd("C:/Users/Ashwath Nandan/Desktop/ExData_Plotting1")

# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")

# Filter data
subSetData <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

globalActivePower <- as.numeric(subSetData$Global_active_power)

datetime <- strptime(paste(subSetData$Date,subSetData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

sub1 <- as.numeric(subSetData$Sub_metering_1)

sub2 <- as.numeric(subSetData$Sub_metering_2)

sub3 <- as.numeric(subSetData$Sub_metering_3)

globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

Volt <- as.numeric(subSetData$Voltage)

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
plot(datetime,globalActivePower,type = "l",xlab = " ",ylab = "Global Active Power")

# Plot 2
plot(datetime,Volt,type = "l",xlab = "datetime",ylab = "Voltage")

#Plot 3
plot(datetime,sub1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")

lines(datetime, sub2, col = "red")

lines(datetime, sub3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

#Plot 4
plot(datetime,globalReactivePower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
