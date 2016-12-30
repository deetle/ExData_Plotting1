

#############################################
#
#  Code to Create Plot3.png file 
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
png(filename="Plot3.png")


# plot 


par(lwd=1 , pch=20, col="black") # plotting symbol and color 
par(mfrow=c(1,1))       # all plots on one page 

str( weekdays( ft$DateTime ) )
print( table(weekdays( ft$DateTime )) )
str(ft$DateTime)

plot( ft$DateTime , ft$Global_active_power, type="n", main="" , xlab="",ylab="Energy sub metering") 
lines( ft$DateTime, ft$Sub_metering_1, type="l" , col="black")  # type L for lines 
lines( ft$DateTime, ft$Sub_metering_2, type="l" , col="red")  # type L for lines
lines( ft$DateTime, ft$Sub_metering_3, type="l" , col="blue")  # type L for lines
legend("topright",pch=1,col=c("blue","red","black"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	
# turn of pnp file device 	
dev.off


				
