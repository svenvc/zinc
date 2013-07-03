convenience
next: count putAll: string startingAt: offset toStream: stream
	"Write count bytes from string starting at offset to stream."
	
	| bytes |
	bytes := ByteArray new: count.
	bytes replaceFrom: 1 to: count with: string startingAt: offset.
	stream nextPutAll: bytes