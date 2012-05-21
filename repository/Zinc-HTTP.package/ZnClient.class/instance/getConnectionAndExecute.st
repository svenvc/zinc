private protocol
getConnectionAndExecute
	self canReuseConnection 
		ifTrue: [ 
			[ ^ self executeRequestResponse; cleanupConnection ] 
				on: Exception 
				do: [ self noteIgnoringExceptionOnReusedConnection; close ] ].
	self signalProgress 
		ifTrue: [ HTTPProgress signal: 'Connecting to ', request url authority ].
	connection := ZnNetworkingUtils socketStreamToUrl: request url.
	[ self executeRequestResponse ]
		ensure: [ self cleanupConnection ]