tests
testReset

	| stream |
	stream := ZnCharacterReadStream on: 'abc' asByteArray readStream.
	self assert: stream next equals: $a.
	stream reset.
	self assert: stream next equals: $a