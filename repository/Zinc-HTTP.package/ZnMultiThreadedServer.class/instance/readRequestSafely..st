private
readRequestSafely: stream
	"Read request from stream, returning nil when the connection is closed or times out"
	
	^ [ self readRequest: stream ]
		on: (self exceptionSet: #(ConnectionClosed ConnectionTimedOut PrimitiveFailed
										ZnParseError ZnTooManyDictionaryEntries ZnEntityTooLarge))
		do: [ :exception |
			self log debug: [ exception printString, ' while reading request' ]. 
			nil ]