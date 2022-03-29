testing
testDefaultScheme
	| url |
	url := ZnUrl fromString: 'www.example.com/foo.html' defaultScheme: #http.
	self assert: url hasScheme.
	self assert: url scheme equals: #http.
	self assert: url host equals: 'www.example.com'.
	self assert: url pathSegments equals: (OrderedCollection with: 'foo.html')