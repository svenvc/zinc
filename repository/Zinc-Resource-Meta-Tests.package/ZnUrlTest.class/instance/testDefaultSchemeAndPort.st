testing
testDefaultSchemeAndPort
	| url |
	url := '' asZnUrl.
	self assert: url hasScheme not.
	self assert: url hasPort not.
	self assert: url port isNil.
	self assert: url scheme isNil.
	self assert: url schemeOrDefault equals: #http.
	self assert: url portOrDefault equals: 80