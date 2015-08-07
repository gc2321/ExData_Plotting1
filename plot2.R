plot2 <- function() {
  
  # read data
  d <- read.table("hpc.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)
  
  # filter data
  
  d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
  
  # change date/time columns
  library(lubridate)
  d2[,1]<-dmy(d2[,1])+hms(d2[,2])
  
  time <- strptime(d2[,1], "%Y-%m-%d %H:%M:%S") 
  
  # change column 3 to numeric data
  power<-as.numeric(d2[,3])
  
  # convert to png
  png("plot2.png", width=480, height=480)
  
  # make line graph
  plot(time, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
}  