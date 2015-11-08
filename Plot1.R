## Read table
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Subset by date, then copy Global_active_power to vector
HPC <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
GAP <- as.numeric(HPC$Global_active_power)

## Create plot
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()