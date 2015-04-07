library(data.table)

# Localization (to get the days' names in english)
Sys.setlocale(category="LC_TIME",locale="en_US.utf8")


hpc <- fread("household_power_consumption.txt",header=TRUE, na.strings="?",colClasses = 'character')
hpc_sub<- hpc[Date=="1/2/2007" | Date =="2/2/2007",]
hpc_sub<- transform(hpc_sub,DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#Plot 1:
# Display it on the current device
hist(as.numeric(hpc_sub[,Global_active_power]),xlab = "Global Active Power (kilowatts)",main ="Global Active Power",col ="red")
# Copy it to the .png file
dev.copy(png,file="plot1.png",units="px",height=480,width=480,pointsize=12,bg="white")#,type=c("cairo"),res=NA)  
dev.off()
