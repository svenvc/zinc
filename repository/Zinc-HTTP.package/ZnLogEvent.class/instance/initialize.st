initialization
initialize 
	self timeStamp: DateAndTime now.
	self category: #info.  
	self processId: ZnUtils currentProcessID     