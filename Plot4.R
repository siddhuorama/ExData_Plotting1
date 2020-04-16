
##For reading the CSV, I have made use of the "readr" package.
###"readr" package is available in the "tidyverse" set of packages.

###Installing the "tidyverse" set of packages. 
install.packages("tidyverse") #Please skip this step if already installed.
###Loading the "tidyverse" set of packages.
library(tidyverse)

###Installing the "lubridate" package. 
###This package is designed for date & time operations.
install.packages("lubridate") #Please skip this step if already installed.
###Loading the "lubridate" package.
library(lubridate)

###Using the read_delim() function for fast file reading.
###Setting columns, the missing value symbol, and saving as an object "t1".
t1 <- read_delim("household_power_consumption.txt", delim = ";",
                 col_types = "?tddddddd", na = "?")

###Setting the format for variable "Date"using as.Date() function.
t1$Date <- as.Date(t1$Date, format  = "%d/%m/%Y")

###Using make_datetime function from "lubridate" package.
###It helps add the y,m,d values from "Date" , and H,M from Time.
###The results are saved in a new variable "DT".
t1$DT <- make_datetime(year(t1$Date), month(t1$Date),
                       day(t1$Date), hour(t1$Time),
                       minute(t1$Time))

###Subsetting t1, as required. Storing the result as object "t2"
t2 <- subset(t1, t1$Date == "2007-02-01" | t1$Date == "2007-02-02")

###Using "par" to set the option for displaying 4 plots in 1 file.
par(mfrow = c(2,2))

###Plot 1 - using "plot" function.
with(t2, plot(DT, Global_active_power, type = "l", xlab = "",
              ylab = "Global Active Power"))
###Plot 2 - using "plot" function.
with(t2, plot(DT, Voltage, type = "l", xlab = "datetime",
              ylab = "Voltage"))
###Plot 3 - Using "plot", "line" and "legend" functions.
with(t2, plot(DT, Sub_metering_1, type = "l", xlab = "", 
              ylab = "Energy sub metering"))
with(t2, lines(DT, Sub_metering_2, col = "red"))
with(t2, lines(DT, Sub_metering_3, col = "blue"))
with(t2, legend("topright", col = c("black", "blue", "red"),
                legend = c("Sub_metering_1", "Sub_metering_2",
                           "Sub_metering_3"), lwd = 1, lty = 1,
                y.intersp = 0.5, x.intersp = 0.5,
                box.col = "white", bty = "n",cex = 0.78))
###Plot 4 - using "plot" function.
with(t2, plot(DT, Global_reactive_power, type = "s", 
              xlab = "datetime",ylab = "Global_reactive_power"))

###Using dev.copy() to save the plot in a PNG file.
dev.copy(png, "Plot4.png", height = 480, width = 480)
###Shutting down the file device.
dev.off()



