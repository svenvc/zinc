testing
testUTF8Writing
	| string entity bytes |
	string := String
		with: $$
		with: 16r00A2 asCharacter
		with: 16r20AC asCharacter
		with: 16r024B62 asCharacter.
	entity := ZnStringEntity text: string.
	self assert: entity contentType equals: ZnMimeType textPlain.
	self assert: entity contentLength equals: 10.
	bytes := ByteArray streamContents: [ :stream | entity writeOn: stream ].
	self assert: bytes equals: #(16r24 16rC2 16rA2 16rE2 16r82 16rAC 16rF0 16rA4 16rAD 16rA2) asByteArray