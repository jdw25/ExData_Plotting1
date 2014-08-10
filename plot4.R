# Read in data
var_names <- names(read.csv2('household_power_consumption.txt',sep=";",nrows=1))
myfile <- read.csv('household_power_consumption.txt',
                   header = FALSE,
                   col.names = var_names,
                   sep = ";", 
                   na.strings = "?",
                   skip = 66637,
                   nrows = 2880,
                   stringsAsFactors=FALSE
)

# set up datetime column
myfile$Date <- as.Date(myfile$Date, format = "%d/%m/%Y")
myfile$DateTime <- as.POSIXlt(paste(myfile$Date,myfile$Time))



png("plot4.png",bg="transparent")
par(mfrow=c(2,2))
with(myfile,{
    plot(DateTime,Global_active_power,
         type="n", 
         xlab=NA,
         ylab='Global Active Power')
    lines(DateTime,Global_active_power)
}
)

with(myfile,{
    plot(DateTime,Voltage,
         type="n"
    )
    lines(DateTime,Voltage)
}
)

with(myfile,{
    plot(DateTime,Sub_metering_1,
         type="n", 
         xlab=NA,
         ylab='Energy sub metering')
    lines(DateTime,Sub_metering_1)
    lines(DateTime,Sub_metering_2, col="red")
    lines(DateTime,Sub_metering_3, col="blue")
    legend("topright",lty=1, 
           col = c("black","red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           cex=.75
    )
}
)

with(myfile,{
    plot(DateTime,Global_reactive_power,
         type="n"
    )
    lines(DateTime,Global_reactive_power)
}
)
dev.off()