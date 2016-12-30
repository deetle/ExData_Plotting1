

#############################################
#
#  Code to Create Plot4.png file 
#
#  Note: I needed to close the R Console once this script is done 
#  before the png file content to actualy get written. Before 
#  closing the R Console the png file was created but had 0 bytes.
#  Once the R Console is closed it sudently had 4kb.
#
#############################################


source("ReadConvertData.r")


#
# Read and convert data 
#

ft = ReadConvertData() 


#
#  Create plot
#

# open png device ( the defaults width and hight is 480 x 480 )  
png(filename="Plot4.png")


#
# plot 
#

print("PLot setup")

par(lwd=1 , pch=20, col="black") # plotting symbol and color 
par(mfrow=c(2,2))       # all plots on one page 

str( weekdays( ft$DateTime ) )
print( table(weekdays( ft$DateTime )) )
str(ft$DateTime)

# plot 1 

print("Plot 1")

plot( ft$DateTime , ft$Global_active_power, type="n", main="" , xlab="",ylab="Global Active Power") 
lines( ft$DateTime, ft$Global_active_power, type="l")  # type L for lines 


# plot 2

print("Plot 2")

plot( ft$DateTime , ft$Voltage, type="n", main="" , xlab="datetime",ylab="Voltage") 
lines( ft$DateTime, ft$Voltage, type="l")  # type L for lines 

# plot 3 

print("Plot 3")


plot( ft$DateTime , ft$Global_active_power, type="n", main="" , xlab="",ylab="Energy sub metering") 
lines( ft$DateTime, ft$Sub_metering_1, type="l" , col="black")  # type L for lines 
lines( ft$DateTime, ft$Sub_metering_2, type="l" , col="red")  # type L for lines
lines( ft$DateTime, ft$Sub_metering_3, type="l" , col="blue")  # type L for lines
legend("topright",pch=1,col=c("blue","red","black"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot 4

print("Plot 2")

plot( ft$DateTime , ft$Global_reactive_power, type="n", main="" , xlab="datetime",ylab="Global_reactive_power ") 
lines( ft$DateTime, ft$Global_reactive_power, type="l")  # type L for lines 

	
# turn of pnp file device 	
dev.off


				
