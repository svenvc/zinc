testing
testQueryParsing
	| string fields |
	string := 'foo=100&x=', ('/a b' encodeForHTTP).
	fields := ZnUtils parseQueryFrom: string readStream.
	self assert: (fields at: 'foo') = '100'.
	self assert: (fields at: 'x') = '/a b'.
	