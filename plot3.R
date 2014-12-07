# Setting english time names
Sys.setlocale("LC_TIME", "English")

## Getting full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na = "?", 
                      stringsAsFactors=F, quote='\"')



## Subsetting the data
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Removing data_full from working directory
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="",cex.lab=0.8, cex.axis=0.8)
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving plot ot plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()