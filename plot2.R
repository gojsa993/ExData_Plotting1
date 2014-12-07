# Setting english time names
Sys.setlocale("LC_TIME", "English")

## Getting full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na = "?", 
                      stringsAsFactors=F, quote='\"')

## Subsetting the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

## Removing data_full from working directory
rm(data_full)

## Converting dates
dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)

## Saving plot to plot2.png
plot(dateTime,globalActivePower, type="l", ylab="Global Active Power (kilowatts)",
     xlab="", cex.lab=0.8, cex.axis=0.8)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()