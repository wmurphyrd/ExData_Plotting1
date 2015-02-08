loadAndPrepData <-function(file="household_power_consumption.txt") {
    d<-read.table(file, sep=";", na.strings="?", header=TRUE,
                  colClasses=c("character","character",rep("numeric",7)))
    d$Date<-as.Date(d$Date, format="%d/%m/%Y")
    d<-d[d$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
    d$Time<-strptime(paste(d$Date,d$Time),
                     format="%Y-%m-%d %H:%M:%S")
    d
}

plot2 <- function(data=loadAndPrepData(), out=NULL) {
    if(!is.null(out)) png(out,bg="transparent",
                          width=504,height=504)
    plot(data$Time,data$Global_active_power,type="l",
         xlab="",ylab="Global Active Power (kilowatts)")
    
    if(!is.null(out)) dev.off();
    invisible(data)
}