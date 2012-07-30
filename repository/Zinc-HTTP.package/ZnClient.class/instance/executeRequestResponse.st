private protocol
executeRequestResponse
	self logRequest.
	ZnSignalProgress enabled ifTrue: [ HTTPProgress signal: 'Writing request' ].
	request writeOn: connection.
	connection flush.
	ZnSignalProgress enabled ifTrue: [ HTTPProgress signal: 'Reading response' ].
	response := request method = #HEAD
		ifTrue: [ ZnResponse readHeaderFrom: 	connection ]
		ifFalse: [ 
			self streaming
				ifTrue: [ ZnResponse readStreamingFrom: connection ]
				ifFalse: [ ZnResponse readFrom: connection ] ].
	self logResponse