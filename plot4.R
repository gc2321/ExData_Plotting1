plot4 <- function() {
  
  # read data
  d <- read.table("hpc.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)
  
  # filter data
  
  d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
  
  # change date/time columns
  library(lubridate)
  d2[,1]<-dmy(d2[,1])+hms(d2[,2])
  
  time <- strptime(d2[,1], "%Y-%m-%d %H:%M:%S") 
  
  # data for plot 1
  power<-as.numeric(d2[,3])
  
  # data for plot2
  m1<-as.numeric(d2[,7])
  m2<-as.numeric(d2[,8])
  m3<-as.numeric(d2[,9])
  
  # data for plot3
  volt<-as.numeric(d2[,5])
  
  # data for plot4
  grp<-as.numeric(d2[,4])
  
  # convert to png
  png("plot4.png", width=480, height=480)
  
  par(mfcol=c(2,2))
  
  # plot 1
  plot(time, power, type="l", xlab="", ylab="Global Active Power")
  
  # plot 2
  plot(time, m1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(time, m2, type="l", col="red")
  lines(time, m3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
  
  # plot 3
  plot(time, volt, type="l", col="black", xlab="datetime", ylab="Voltage")
  
  # plot 4
  plot(time, grp, type="l", col="black", xlab="datetime", ylab="Global_active_power")
  
  dev.off()
  
  
  
  
}  