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


## PLOT 1
d4$GAP <- sub("?", " ", d4$Global_active_power, )
d4$GAP <- as.numeric(d4$GAP)

png(filename = "./plot1.png", height = 480, width = 480)
hist(d4$GAP, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
