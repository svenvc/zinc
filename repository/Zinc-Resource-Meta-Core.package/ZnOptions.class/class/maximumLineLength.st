options
maximumLineLength
	"The maximum line length in bytes that can be read from a stream before ZnLineTooLong is signalled.
	This is applicable to each message's first line and each header line. Malicious parties could hurt 
	a client or server by sending artificially large lines. Setting a maximum is a protection against this."

	<znOption>

	^ 4 * 1024