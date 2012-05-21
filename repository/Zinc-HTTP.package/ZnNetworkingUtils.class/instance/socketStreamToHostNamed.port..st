private
socketStreamToHostNamed: hostName port: port
	| stream |
	stream := SocketStream openConnectionToHostNamed: hostName port: port.
	self setSocketStreamParameters: stream.  
	^ stream
	