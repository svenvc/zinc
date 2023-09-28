printing
printContentsOn: stream
	super printContentsOn: stream.
	stream nextPutAll: method; space.
	url printPathQueryFragmentOn: stream.
	stream space; print: response.
	size ifNotNil: [
		stream space; print: size; nextPut: $B ].
	stream space; print: duration; nextPutAll: 'ms'