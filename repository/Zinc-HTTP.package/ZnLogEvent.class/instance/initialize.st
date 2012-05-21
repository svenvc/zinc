initialize-release
initialize 
	self timeStamp: TimeStamp now.
	self category: #info.  
	self processId: ZnUtils currentProcessID     