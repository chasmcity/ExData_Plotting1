## Read table
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Subset by date
HPC <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

## Copy date and time variables to vector of POSIX, and copy Global_active_power to vector
dateTime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(HPC$Global_active_power)

## Create plot
png("plot2.png", width = 480, height = 480)
plot(dateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()