## Read table
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Subset by date
HPC <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

## Copy date and time variables to vector of POSIX, and copy Sub_metering columns to vectors
dateTime <- strptime(paste(HPC$Date, HPC$Time, sep =" "), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(HPC$Sub_metering_1)
SM2 <- as.numeric(HPC$Sub_metering_2)
SM3 <- as.numeric(HPC$Sub_metering_3)

## Create plot
png("Plot3.png", width = 480, height = 480)
plot(dateTime, SM1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(dateTime, SM2, type = "l", col = "red")
lines(dateTime, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()