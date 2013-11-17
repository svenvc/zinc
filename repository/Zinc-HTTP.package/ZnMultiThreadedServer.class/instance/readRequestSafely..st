request handling
readRequestSafely: stream
	"Read request from stream, returning nil when the connection is closed or times out"

	^ [ 
		[ self readRequest: stream ]
			on: self readRequestBadExceptionSet
			do: [ :exception | 
				self log debug: [ exception printString , ' bad request while parsing' ].
				self writeResponseBad: exception on: stream.
				nil ] ]
			on: self readRequestTerminationExceptionSet
			do: [ :exception | 
				self log debug: [ exception printString , ' while reading request' ].
				nil ]