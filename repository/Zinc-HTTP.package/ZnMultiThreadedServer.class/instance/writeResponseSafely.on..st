request handling
writeResponseSafely: response on: stream
	"Write response to stream, when the connection is closed or times out we ignore this"

	[ self writeResponse: response on: stream ]
		on: self writeResponseExceptionSet
		do: [ :exception | self log debug: [ exception printString , ' while writing response' ] ]