
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

###Installing the "lubridate" package. 
###This package is designed for date & time operations.
###**NOTE** If "lubridate" package already installed, please skip this step.
install.packages("lubridate")
###Loading the "lubridate" package.
library(lubridate)

###Using the read_delim() function for fast file reading.
###Setting columns, the missing value symbol, and saving as an object "t1".
t1 <- read_delim("household_power_consumption.txt", delim = ";",
                 col_types = "?tdddddd", na = "?")

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

###Using the base plot function "plot" to display the required plot.
with(t2, plot(DT, Global_active_power, type = "l", xlab = "",
              ylab = "Global Active Power (kilowatts)"))

###Using dev.copy() to save the plot in a PNG file.
dev.copy(png, "Plot2.png", height = 480, width = 480)
###Shutting down the file device.
dev.off()


