plot3 <- function() {
  
  # read data
  d <- read.table("hpc.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)
  
  # filter data
  
  d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
  
  # change date/time columns
  library(lubridate)
  d2[,1]<-dmy(d2[,1])+hms(d2[,2])
  
  time <- strptime(d2[,1], "%Y-%m-%d %H:%M:%S") 
  
  # change column 3 to numeric data
  m1<-as.numeric(d2[,7])
  m2<-as.numeric(d2[,8])
  m3<-as.numeric(d2[,9])
  
  # convert to png
  png("plot3.png", width=480, height=480)
  
  # make line graph
  plot(time, m1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(time, m2, type="l", col="red")
  lines(time, m3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  
  dev.off()
  
  
  
}  