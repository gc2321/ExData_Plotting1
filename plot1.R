plot1 <- function() {
  
  # read data
  d <- read.table("hpc.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)
  
  # filter data
  
  d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
  d3 <- as.numeric(as.character(d2$Global_active_power))
  
  # convert to png
  png("plot1.png", width=480, height=480)
  
  # make histogram
  hist(d3, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  dev.off()
  
}  