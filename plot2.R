setwd("C:/Users/Ashwath Nandan/Desktop/ExData_Plotting1")
# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
subSetData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
datetime<-strptime(paste(subSetData$Date,subSetData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Make and save plot
png("plot2.png",width = 480, height = 480)
plot(datetime,globalActivePower ,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
