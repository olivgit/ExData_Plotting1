library(data.table)

# Localization (to get the days' names in english)
Sys.setlocale(category="LC_TIME",locale="en_US.utf8")

# Get the data and do some date and time conversion
hpc <- fread("household_power_consumption.txt",header=TRUE, na.strings="?")
hpc_sub<- hpc[Date=="1/2/2007" | Date =="2/2/2007",]
hpc_tmp<- transform(hpc_sub,dt=paste(Date,Time))
hpc_sub<- transform(hpc_tmp,DateTime = strptime(dt,"%d/%m/%Y %H:%M:%S"))


#plot2
png(filename="plot2.png",units="px",height=480,width=480,pointsize=12,bg="white",type=c("cairo"),res=NA)
plot(hpc_sub[,DateTime],as.numeric(hpc_sub[,Global_active_power]),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()