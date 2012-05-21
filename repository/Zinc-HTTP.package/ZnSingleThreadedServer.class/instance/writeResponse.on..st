private
writeResponse: response on: stream
	"Write response to stream and flush the stream"
	
	response writeOn: stream.
	stream flush.
	self logResponse: response 