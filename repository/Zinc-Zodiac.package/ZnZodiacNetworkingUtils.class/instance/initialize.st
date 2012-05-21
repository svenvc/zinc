initialize-release
initialize 
	super initialize.
	self socketStreamClass: ZdcSocketStream.
	self secureSocketStreamClass: ZdcSecureSocketStream