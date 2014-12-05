fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./exproj1.zip")
unzip("./exproj1.zip", exdir = "exProj1")
directory <- "exProj1"
folder <- list.files(directory, full.names = TRUE)
folder
exd1 <- read.table(folder, header = T, sep = ";")

exd1$Date <- as.Date(exd1$Date, "%d/%m/%Y")
class(exd1$Date)
exd1$Time <- strptime(exd1$Time, "%T")
d2 <- exd1[which(exd1$Date == "2007-02-01"),]
d3 <- exd1[which(exd1$Date == "2007-02-02"),]
d4 <- rbind(d2, d3)

## PLOT 3
d4$SM1 <- sub("?", " ", d4$Sub_metering_1, )
d4$SM1 <- as.numeric(d4$SM1)
d4$SM2 <- sub("?", " ", d4$Sub_metering_2, )
d4$SM2 <- as.numeric(d4$SM2)
d4$SM3 <- sub("?", " ", d4$Sub_metering_3, )
d4$SM3 <- as.numeric(d4$SM3)

png(filename = "./plot3.png", height = 480, width = 480)
plot(d4$DateTime, d4$SM1, type = "n", ylab = "Energy Sub metering", xlab= " ", yaxt = "n")
axis(2, at = c(0, 10, 20, 30, 40), labels = c("0", "10", "20", "30", " "))
lines(d4$DateTime, d4$SM1)
lines(d4$DateTime, d4$SM2, col = "red")
lines(d4$DateTime, d4$SM3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1),
       col = c("black", "red", "blue"))
dev.off()
