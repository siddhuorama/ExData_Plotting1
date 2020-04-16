
##For reading the CSV, I have made use of the "readr" package.
###"readr" package is available in the "tidyverse" set of packages.

###Installing the "tidyverse" set of packages. 
install.packages("tidyverse") #Please skip this step if already installed.
###Loading the "tidyverse" set of packages.
library(tidyverse)

###Using the read_delim() function for fast file reading.
###Setting columns, the missing value symbol, and saving as an object "t1".
t1 <- read_delim("household_power_consumption.txt", delim = ";", 
                 col_types = "?tddddddd", na = "?")

###Setting the format for variable "Date"using as.Date() function.
t1$Date <- as.Date(t1$Date, format = "%d/%m/%Y")

###Subsetting t1, as required. Storing the result as object "t2".
t2 <- subset(t1, t1$Date == "2007-02-01" | t1$Date == "2007-02-02")

###Using the base plot function "hist" to display the required plot.
with(t2, hist(Global_active_power, col = "red", 
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency", main = "Global Active Power"))

###Using dev.copy() to save the plot in a PNG file.
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
###Shutting down the file device.
dev.off()



