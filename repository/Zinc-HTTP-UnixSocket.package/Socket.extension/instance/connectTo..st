*Zinc-HTTP-UnixSocket
connectTo: socketAddress
	| status |
	status := self primSocketConnectionStatus: socketHandle.
	status == Unconnected
		ifFalse: [ InvalidSocketStatusException
				signal: 'Socket status must be unconnected before opening a new connection' ].

	self primSocket: socketHandle connectTo: socketAddress