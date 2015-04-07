library(data.table)

# Localization (to get the days' names in english)
Sys.setlocale(category="LC_TIME",locale="en_US.utf8")

# Get the data and do some date and time conversion
hpc <- fread("household_power_consumption.txt",header=TRUE, na.strings="?",colClasses = 'character')
hpc_sub<- hpc[Date=="1/2/2007" | Date =="2/2/2007",]
hpc_sub<- transform(hpc_sub,DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))


#plot 3
# For some reasons, displaying THEN saving it wreaks the legend. The workaround I found is to save it directly.
png(filename="plot3.png",units="px",height=480,width=480,pointsize=12,bg="white",type=c("cairo"),res=NA)
plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_1]),type="l",xlab="",ylab="Energy sub metering")
lines(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_2]),col="red")
lines(hpc_sub[,DateTime],as.numeric(hpc_sub[,Sub_metering_3]),col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()