
#############################################
#
#  Common functon to get data for the plut functions 
#
#############################################

ReadConvertData <- function()
{

		#############################################
		#  Read data table 
		#############################################

		print("++++++++++  Reading data from file")
		
		#filteredDataFileName = "household_power_consumption_filtered.txt"
		
		
		#if( file.exists(filteredDataFileName) ) {
		#	print(" Using existing filtered file ")
		#	
		#	ft = read.table(filteredDataFileName,header=TRUE,sep=",",colClasses=c("numeric","numeric","numeric","numeric","numeric","numeric","numeric","character"))
		#	str(ft)
		#	# Convert the temp Date & Time column into a POSIXlt column 
		#	t$DateTime= strptime(t$DateTimeTemp,"%Y-%m-%d %H:%M:%S")  
		#	str(ft)
		#	return(ft)
		#	
		#}

		#  Convert all columns as characters to start of with
		t = read.table("household_power_consumption.txt",header=T , sep=";",colClasses=c("character")  )
		print("Done rreading data")



		##############################################
		# Convert existing seperate Data and Time columns to a single DataTime POSIXlt column
		##############################################

		print("++++++++++  Convert existing seperate Data and Time columns to a single DataTime POSIXlt column")

		# Create a temp column that will have both the data & Time as string in a single column 
		t$DateTimeTemp = paste(t$Date,t$Time)   
		str(t)

		# Convert the temp Date & Time column into a POSIXlt column 
		t$DateTime= strptime(t$DateTimeTemp,"%d/%m/%Y %H:%M:%S")  
		str(t)
		print(  class(t$DateTime[1]) )
		print(  t$DateTime[1])

		# Delete the temp and existing Date and Time Column
		t$DateTimeTemp <- NULL   
		t$Date <- NULL
		t$Time <- NULL
		str(t)
		str(t$DateTime)
		

		##############################################
		# Convert string columns to numeric 
		##############################################

		print("++++++++++ Convert string columns to numeric ")
		t$Global_active_power = as.numeric(t$Global_active_power)
		t$Global_reactive_power = as.numeric(t$Global_reactive_power)
		t$Voltage = as.numeric(t$Voltage)
		t$Global_intensity  = as.numeric(t$Global_intensity )
		t$Sub_metering_1 = as.numeric(t$Sub_metering_1)
		t$Sub_metering_2 = as.numeric(t$Sub_metering_2)
		t$Sub_metering_3 = as.numeric(t$Sub_metering_3)
		
		str(t)

		##############################################
		# Filter out the 2 day period from 2007-02-01 to 2007-02-02 
		##############################################

		print("++++++++++ Filter out the 2 day period from 2007-02-01 to 2007-02-02 ")

		# Create the from and to date values 
		FromDate = as.POSIXlt("2007-02-01 00:00:00")
		str(FromDate)

		ToDate = as.POSIXlt("2007-02-02 24:00:00")
		str(ToDate)

		# simple test for To and From date 
		if( ToDate  > FromDate ) {
			print("ToDate is bigger")
		} else {
			print(" ERROR To Date is bugger then From Date")
		}

		if( FromDate < ToDate ) {
			print("From Date is smaller")
		} else {
			print("ERROR To Date is bigger then From Date")
		} 

		# construct the logical fitler for these dates 
		DateFilter = t$DateTime >= FromDate & t$DateTime <= ToDate
		str(DateFilter)

		# do the actual filtering 
		ft = t[  DateFilter ,   ]
		str(ft) 
		
		#write.table(ft,file = filteredDataFileName,sep=",",row.name=FALSE , col.names=TRUE)

		ft # return the filtered data 



}