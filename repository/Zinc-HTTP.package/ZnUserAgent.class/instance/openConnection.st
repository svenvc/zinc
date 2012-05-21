private-protocol
openConnection
	| socketStream |
	socketStream := ZnNetworkingUtils socketStreamToUrl: request url.
	self settings timeout 
		ifNotNil: [ :timeout | socketStream timeout: timeout ].
	^ socketStream