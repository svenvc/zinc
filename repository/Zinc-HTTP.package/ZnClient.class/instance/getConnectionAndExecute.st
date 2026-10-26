private - protocol
getConnectionAndExecute
	self canReuseConnection
		ifTrue: [
			[ ^ self executeRequestResponse; cleanupConnection ]
				on: Error
				do: [ :exception | self logIgnoringExceptionOnReusedConnection: exception; close ] ].
	self newConnectionTo: request url.
	[ self executeRequestResponse ]
		ensure: [ self cleanupConnection ]