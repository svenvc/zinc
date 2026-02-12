convenience
numberOfCharactersFrom: bytes
	"Return the number of characters represented in bytes.
	We avoid creating code points, characters or string for speed reasons. 
	We use #forwardOnStream: to skip bytes corresponding to one character."

	| byteStream count |
	byteStream := bytes readStream.
	count := 0.
	[ byteStream atEnd ] whileFalse: [ 
		self forwardOnStream: byteStream.
		count := count + 1 ].
	^ count