
library(data.table)

# Localization (to get the days' names in english)
Sys.setlocale(category="LC_TIME",locale="en_US.utf8")

# Get the data and do some date and time conversion
hpc <- fread("household_power_consumption.txt",header=TRUE, na.strings="?",colClasses = 'character')
hpc_sub<- hpc[Date=="1/2/2007" | Date =="2/2/2007",]
hpc_sub<- transform(hpc_sub,DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#plot 4


# Display it on the current device
# save current mfrow
par_mfrow_tmp= par("mfrow")
par(mfrow = c(2, 2))

plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Global_active_power]),type="l",xlab="",ylab="Global Active Power")

plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Voltage]),type="l",xlab="datetime",ylab="Voltage")

plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_1]),type="l",xlab="",ylab="Energy sub metering")
lines(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_2]),col="red")
lines(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_3]),col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Global_reactive_power]),type="l",xlab="datetime",ylab="global_reactive_power")

# Copy it to the .png file
dev.copy(png,file="plot4.png",units="px",height=480,width=480,bg="white")
dev.off()
#set aga
par(mfrow = par_mfrow_tmp)
