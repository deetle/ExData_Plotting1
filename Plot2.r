

#############################################
#
#  Code to Create Plot2.png file 
#
#  Note: I needed to close the R Console once this script is done 
#  before the pnp file content to actualy get written. Before 
#  closing the R Console the png file was created but had 0 bytes.
#  Once the R Console is closed it sudently had 5kb. 
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
png(filename="Plot2.png")


# plot 

par(lwd=1 , pch=20, col="black") # plotting symbol and color 
par(mfrow=c(1,1))       # all plots on one page 

str( weekdays( ft$DateTime ) )
print( table(weekdays( ft$DateTime )) )
str(ft$DateTime)

plot( ft$DateTime , ft$Global_active_power, type="n", main="" , xlab="",ylab="Global Active Power (kilowatts)") 
lines( ft$DateTime, ft$Global_active_power, type="l")  # type L for lines 
	
# turn of pnp file device 	
dev.off


				
