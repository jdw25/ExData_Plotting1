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


png("plot2.png",bg="transparent")
with(myfile,{
    plot(DateTime,Global_active_power,
         type="n", 
         xlab=NA,
         ylab='Global Active Power (kilowatts)')
    lines(DateTime,Global_active_power)
}
)
dev.off()