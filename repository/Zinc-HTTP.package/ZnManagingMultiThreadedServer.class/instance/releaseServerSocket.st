private
releaseServerSocket
	super releaseServerSocket.
	self isUsingLimitedAcceptStrategy
		ifTrue: [ availableConnections := nil ]