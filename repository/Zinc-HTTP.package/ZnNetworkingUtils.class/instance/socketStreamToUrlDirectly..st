public
socketStreamToUrlDirectly: url
	| stream address |
	address := NetNameResolver addressForName: url host timeout: self timeout.
	(address isNil or: [ address = SocketAddress zero ])
		ifTrue: [ ^ NameLookupFailure signalFor: url host ].
	stream := (self streamClassForScheme: url scheme)
		openConnectionToHost: address
		port: url portOrDefault
		timeout: self timeout.
	self setSocketStreamParameters: stream.
	"note that for TLS/SSL, #connect should be called"
	^ stream