testing
testParsePathOnly
	| url |
	url := '/images/foo.png?size=large#center' asZnUrl.
	self assert: url hasScheme not.
	self assert: url hasHost not.
	self assert: url hasPort not.
	self assert: url isAbsolute not.
	self assert: url pathSegments equals: (OrderedCollection with: 'images' with: 'foo.png').
	self assert: url firstPathSegment equals: 'images'.
	self assert: url lastPathSegment equals: 'foo.png'.
	self assert: url hasQuery.
	self assert: (url queryAt: 'size') equals: 'large'.
	self assert: url hasFragment.
	self assert: url fragment equals: 'center'