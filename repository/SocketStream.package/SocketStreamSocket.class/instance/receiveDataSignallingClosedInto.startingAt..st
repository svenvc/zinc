as yet unclassified
receiveDataSignallingClosedInto: aStringOrByteArray startingAt: aNumber
	"Receive data into the given buffer and return the number of bytes received. 
	Note the given buffer may be only partially filled by the received data.
	Waits for data until something is read or the socket is closed, upon which
	we signal."

	| bytesRead |
	bytesRead := 0.
	[bytesRead == 0]
		whileTrue: [
			self waitForData.
			bytesRead := self  readInto: aStringOrByteArray startingAt: aNumber for: (aStringOrByteArray size  -aNumber +1) ].
	^bytesRead
