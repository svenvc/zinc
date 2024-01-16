*Zinc-Character-Encoding-Core
rawStream
	"Answer the innermost stream wrapped by the receiver, e.g. a raw binary file stream,
	socket stream, or regular Read/WriteStream.
	Since this the base stream, answer ourself."

	^ self