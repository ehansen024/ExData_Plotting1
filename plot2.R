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

## PLOT 2
d4$DateTime <- ""
str(d4$DateTime)
for (i in 1:2880) {
  d4$DateTime[i] <- paste(d4$Date[i], d4$Time[i])
}
d4$DateTime <- strptime(d4$DateTime, "%Y-%m-%d %H:%M:%S")

png(filename = "./plot2.png", height = 480, width = 480)
plot(d4$DateTime, d4$GAP, type = "n", ylab = "Global Active Power (kilowatts)", xlab = " ")
lines(d4$DateTime, d4$GAP)
dev.off()
