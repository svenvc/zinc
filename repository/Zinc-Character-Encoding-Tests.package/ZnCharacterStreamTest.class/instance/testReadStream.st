tests
testReadStream
	| stream |
	stream := ZnCharacterReadStream on: 'ABC' asByteArray readStream.
	self deny: stream atEnd.
	self deny: stream isBinary.
	self assert: stream next equals: $A.
	self deny: stream atEnd.
	self assert: stream peek equals: $B.
	self deny: stream atEnd.
	self assert: stream peek equals: $B.
	self deny: stream atEnd.
	self assert: stream next equals: $B.
	self deny: stream atEnd.
	self assert: stream next equals: $C.
	self assert: stream atEnd.
	self assert: stream next isNil.
	self assert: stream peek isNil