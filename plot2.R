library(data.table)

# Localization (to get the days' names in english)
Sys.setlocale(category="LC_TIME",locale="en_US.utf8")

# Get the data and do some date and time conversion
hpc <- fread("household_power_consumption.txt",header=TRUE, na.strings="?",colClasses = 'character')
hpc_sub<- hpc[Date=="1/2/2007" | Date =="2/2/2007",]
hpc_sub<- transform(hpc_sub,DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))


#plot2
# Display it on the current device
plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Global_active_power]),type="l",xlab="",ylab="Global Active Power (kilowatts)")
# Copy it to the .png file
dev.copy(png,file="plot2.png",units="px",height=480,width=480,pointsize=12,bg="white")
dev.off()