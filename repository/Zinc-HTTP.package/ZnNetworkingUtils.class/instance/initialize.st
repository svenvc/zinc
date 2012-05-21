initialize-release
initialize
	super initialize.
	self socketStreamClass: SocketStream.
	self secureSocketStreamClass: (Smalltalk globals at: #ZdcSecureSocketStream ifAbsent: [ nil ])