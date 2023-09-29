printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << 'Connection Established '; nextPutAll: hostname asString; nextPut: $:; print: port.
	proxy ifNotNil: [ stream << ' via proxy '; print: proxy ].
	stream space.
	address
		ifNil: [ stream print: address ]
		ifNotNil: [ address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ].
	stream nextPut: $:; print: port	stream space; print: duration; << 'ms'