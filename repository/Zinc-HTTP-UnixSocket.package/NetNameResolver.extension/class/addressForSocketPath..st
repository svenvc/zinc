*Zinc-HTTP-UnixSocket
addressForSocketPath: socketPath
	"Resolve a socketPath, a Unix Domain Socket, to a SocketAddress"
	
	| addressSize socketAddress |
	self initializeNetwork.
	self primGetAddressInfoHost: '' service: socketPath flags: 0 family: 1 type: 0 protocol: 0.
	addressSize := self primGetAddressInfoSize.
	socketAddress := SocketAddress new: addressSize withAll: 0.
	self primGetAddressInfoResult: socketAddress.
	^ socketAddress