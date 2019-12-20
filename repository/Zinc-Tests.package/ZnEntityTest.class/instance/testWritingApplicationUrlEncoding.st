testing
testWritingApplicationUrlEncoding
	| entity bytes |
	entity := ZnApplicationFormUrlEncodedEntity new.
	entity at: 'foo' put: 'bar'.
	bytes := ByteArray streamContents: [ :stream | entity writeOn: stream ].
	self assert: bytes equals: (ZnNullEncoder new encodeString: 'foo=bar').
	self assert: entity contentLength equals: 7