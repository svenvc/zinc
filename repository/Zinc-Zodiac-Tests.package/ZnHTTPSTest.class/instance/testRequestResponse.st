testing
testRequestResponse
	| query stream request response |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	query := 'Smalltalk'.
	stream := ZdcSecureSocketStream openConnectionToHostNamed: 'duckduckgo.com' port: 443.
	request := nil.
	response := [
		request := ZnRequest get: 'https://duckduckgo.com?q=', query.
		stream connect.
		request writeOn: stream.
		stream flush.
		ZnResponse readFrom: stream.
	] ensure: [ stream close ].
	self assert: response isSuccess.
	self assert: (response contents includesSubstring: 'Duck').   
	self assert: (response contents includesSubstring: query).