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


#shoot the histogram to a PNG file.
png("plot1.png",bg="transparent")
hist(myfile$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
     )
dev.off()