testing
testQueryParsing
	| string fields |
	string := 'foo=100&x=' , (ZnPercentEncoder new encode: '/a b').
	fields := ZnResourceMetaUtils parseQueryFrom: string readStream.
	self assert: (fields at: 'foo') equals: '100'.
	self assert: (fields at: 'x') equals: '/a b'