# Setting english time names
Sys.setlocale("LC_TIME", "English")

## Getting full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na = "?", 
                       stringsAsFactors=F, quote='\"')

## Subsetting the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

# Starting plot parameters
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Plotting histogram
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="Red",cex.lab=0.8, cex.axis=0.8)

## Saving histogram to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()