testing
testWritingApplicationUrlEncodingWithTextEncodingLatin1
	| entity bytes |
	entity := ZnApplicationFormUrlEncodedEntity new.
	entity contentType charSet: 'iso-8859-1'.
	entity at: 'foo' put: (Character value: 246) asString.
	bytes := ByteArray streamContents: [ :stream | entity writeOn: stream ].
	self assert: bytes equals: (ZnNullEncoder new encodeString: 'foo=%F6').
	self assert: entity contentLength equals: 7