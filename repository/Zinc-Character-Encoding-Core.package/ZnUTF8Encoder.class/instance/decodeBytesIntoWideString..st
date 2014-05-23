convenience
decodeBytesIntoWideString: bytes
	"Variant of #decodeBytes: that is faster when you know upfront 
	that a WideString is probably needed"

	| byteStream |
	byteStream := bytes readStream.
	^ QuadByteString streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [
			stream nextPut: (self nextFromStream: byteStream) ] ]