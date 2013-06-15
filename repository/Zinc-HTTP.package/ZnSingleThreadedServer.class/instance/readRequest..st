request handling
readRequest: stream
	"Read a request from stream.
	We add a virtual header containing the remote IP address of the client"

	| request |
	request := self withMaximumEntitySizeDo: [ self reader value: stream ].
	request headers 
		at: ZnConstants remoteAddressHeader
		put: (ZnNetworkingUtils ipAddressToString: stream socket remoteAddress).
	self logRequest: request.
	^ request