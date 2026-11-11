tests
testUpToEndAfterPeek
	| text stream |
	text := (String with: (Character value: 16r20AC)) , 'abc'.
	stream := ZnCharacterReadStream on: (ZnUTF8Encoder new encodeString: text) readStream.
	self assert: stream peek equals: (Character value: 16r20AC).
	self assert: stream upToEnd equals: text.
	self assert: stream atEnd.
	stream := ZnCharacterReadStream on: 'abc' asByteArray readStream.
	self assert: stream peek equals: $a.
	self assert: stream upToEnd equals: 'abc'