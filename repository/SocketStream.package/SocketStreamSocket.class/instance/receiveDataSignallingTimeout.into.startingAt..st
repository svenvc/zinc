as yet unclassified
receiveDataSignallingTimeout: timeout into: aStringOrByteArray startingAt: aNumber
	"Receive data into the given buffer and return the number of bytes received. 
	Note the given buffer may be only partially filled by the received data.
	Wait for data once for the specified nr of seconds.  This method will
	throw exceptions on timeout or the socket closing."
	self waitForDataFor: timeout.
	^self readInto: aStringOrByteArray startingAt: aNumber for: (aStringOrByteArray size - aNumber +1)