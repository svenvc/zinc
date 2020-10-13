testing
testWritingApplicationUrlEncodingWithTextEncodingUtf8
	| entity bytes |
	entity := ZnApplicationFormUrlEncodedEntity new.
	entity contentType charSet: 'utf-8'.
	entity at: 'foo' put: (Character value: 246) asString.
	bytes := ByteArray streamContents: [ :stream | entity writeOn: stream ].
	self assert: bytes equals: (ZnNullEncoder new encodeString: 'foo=%C3%B6').
	self assert: entity contentLength equals: 10