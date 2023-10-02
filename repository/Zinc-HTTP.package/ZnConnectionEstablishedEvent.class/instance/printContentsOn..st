printing
printContentsOn: stream
	super printContentsOn: stream.

	stream << 'Connection Established '; nextPutAll: hostname asString; nextPut: $:; print: port.
	proxy ifNotNil: [ stream << ' via proxy '; print: proxy ].
	stream space.
	self class printAddress: address on: stream.
	stream nextPut: $:; print: port.
	stream space; print: duration; << 'ms'