writing
writeOn: stream
	self headers writeOn: stream.
	stream nextPutAll: String crlf.
	self hasEntity ifTrue: [ self entity writeOn: stream ]