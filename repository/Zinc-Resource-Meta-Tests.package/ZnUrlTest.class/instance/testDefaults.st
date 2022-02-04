testing
testDefaults
	| url |
	url := '' asZnUrl asZnUrlWithDefaults.
	self assert: url hasScheme.
	self assert: url hasPort.
	self assert: url scheme equals: #http.
	self assert: url port equals: 80