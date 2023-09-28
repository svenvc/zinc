printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << 'Connection Established '; nextPutAll: hostname asString; nextPut: $:; print: port.
	proxy ifNotNil: [ stream << ' via proxy '; print: proxy ].
	address ifNotNil: [ 
		stream space. 
		address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ].
	stream space; print: duration; << 'ms'