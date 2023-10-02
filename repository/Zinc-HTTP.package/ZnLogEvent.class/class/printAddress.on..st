utilities
printAddress: address on: stream
	"Try printing address as a IPv4 dotted address to stream.
	If that fails, just print address as an object to stream."
	
	[ address asSocketAddress printOn: stream ] on: Error do: [ stream print: address ]