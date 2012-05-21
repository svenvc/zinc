testing
testRequestResponse
	| query stream request response |
	query := 'Smalltalk'.
	stream := ZdcSecureSocketStream openConnectionToHostNamed: 'encrypted.google.com' port: 443.
	[
		request := ZnRequest get: 'https://encrypted.google.com/search?q=', query.
		stream connect.
		request writeOn: stream.
		stream flush.
		response := ZnResponse readFrom: stream.
	] ensure: [ stream close ].
	self assert: response isSuccess.
	self assert: (response contents includesSubString: 'Google').   
	self assert: (response contents includesSubString: 'Smalltalk').   
