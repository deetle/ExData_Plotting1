



#############################################
#
#  Code to Create Plot1.png file 
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
png(filename="Plot1.png")


# plot 
hist( as.numeric(ft$Global_active_power) , 
				col="red", 
				main = "Global Active Power",
				xlab = "Global Active Power (kilowatts)") 
	
# turn of pnp file device 	
dev.off


				



