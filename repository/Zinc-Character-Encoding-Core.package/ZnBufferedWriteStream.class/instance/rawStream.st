initialize-release
rawStream
	"Answer the innermost stream wrapped by the receiver, e.g. a raw binary file stream,
	socket stream, or regular Read/WriteStream.
	Defer to the wrappedStream."

	^ self wrappedStream rawStream