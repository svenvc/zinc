testing
testRequestResponse
	| query stream request response numberOfRetriesRemaining completed |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	query := 'Smalltalk'.
	numberOfRetriesRemaining := self class numberOfRetries.
	completed := false.
	[ numberOfRetriesRemaining > 0 ] whileTrue: [
		[
			stream := ZdcSecureSocketStream openConnectionToHostNamed: 'duckduckgo.com' port: 443.
			stream timeout: self class timeout.
			request := nil.
			response := [
				request := ZnRequest get: 'https://duckduckgo.com?q=', query.
				stream connect.
				request writeOn: stream.
				stream flush.
				ZnResponse readFrom: stream ] ensure: [ stream close ].
			completed := true.
			numberOfRetriesRemaining := 0 ]
				on: NetworkError 
				do: [ :exception | 
					completed := exception.
					self class retryDelay seconds wait.
					numberOfRetriesRemaining := numberOfRetriesRemaining - 1 ] ].
	self assert: completed equals: true.
	self assert: response isSuccess.
	self assert: (response contents includesSubstring: 'Duck').   
	self assert: (response contents includesSubstring: query).