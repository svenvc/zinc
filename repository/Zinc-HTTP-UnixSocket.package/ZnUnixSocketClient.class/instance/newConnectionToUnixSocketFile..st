private
newConnectionToUnixSocketFile: socketFile
	| initialMilliseconds |
	self signalHTTPProgress: 'Connecting to ',  socketFile asString.
	initialMilliseconds := Time millisecondClockValue.
	(connection notNil and: [ connection isConnected ])
		ifTrue: [ connection close ].
	connection := ZnNetworkingUtils socketStreamToUnixSocketFile: socketFile.
	self logConnectionEstablishedTo: socketFile asZnUrl started: initialMilliseconds