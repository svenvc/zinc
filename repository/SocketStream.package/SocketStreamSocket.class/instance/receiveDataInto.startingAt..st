as yet unclassified
receiveDataInto: aStringOrByteArray startingAt: aNumber
	"Receive data into the given buffer and return the number of bytes received. 
	Note the given buffer may be only partially filled by the received data.
	Waits for data once.  The answer may be zero (indicating that no data was 
	available before the socket closed)."

	| bytesRead closed b |
	bytesRead := 0.
	closed := false.
	[closed not and: [bytesRead == 0]]
		whileTrue: [self waitForDataIfClosed: [closed := true].
			b:=(aStringOrByteArray size  -aNumber +1).
		
			bytesRead := self  readInto: aStringOrByteArray startingAt: aNumber for: b  ].
		
	^bytesRead
