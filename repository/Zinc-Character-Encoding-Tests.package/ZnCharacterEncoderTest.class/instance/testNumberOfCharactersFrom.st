testing
testNumberOfCharactersFrom
	| bytes |
	#(latin1 utf8 utf16 utf32) do: [ :encoding |
		bytes := 'Düsseldorf Königsallee' encodeWith: encoding.
		self assert: (encoding asZnCharacterEncoder numberOfCharactersFrom: bytes) equals: 22 ].
	bytes := 'Test' encodeWith: #ascii.
	self assert: (#ascii asZnCharacterEncoder numberOfCharactersFrom: bytes) equals: 4.