private
writeChunkSize: size
	stream nextPutAll: (self isBinary ifTrue: [ (size printStringBase: 16) asByteArray ] ifFalse: [ (size printStringBase: 16) ]).
	self crlf