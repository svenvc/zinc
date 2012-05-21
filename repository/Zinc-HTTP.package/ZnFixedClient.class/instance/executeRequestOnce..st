private
executeRequestOnce: request
	| stream response |
	stream := self connection.
	request writeOn: stream.
	stream flush.
	response := ZnResponse readFrom: stream.
	self postProcessResponse: response.
	^ response